using System.Collections.Generic;
using System.Linq;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDCore.InformationSquare;
using PokemonTDCore.Towers;
using PokemonTDEngine;
using PokemonTDEngine.Towers;

namespace PokemonTDCore
{
    public class GamePlayScreen(TextureHelper textureHelper, PokemonTD game, EnemyTextures enemyTextures, TileRenderer tileRenderer, IPressHandler pressHandler, ScoreDataHandler scoreDataHandler)
        : IGameScreen
    {
        private Camera camera;
        private PressHelper pressHelper;
        private DrawableGameObjects gameObjects;
        private GameEngine gameEngine;
        private LevelHandler levelHandler;
        private bool pauseGame;

        public void Load()
        {
            EventTracker.Reset();
            gameObjects = [];
            camera = new(() => game.ScreenWidth,
                () => game.ScreenHeight,
                () => tileRenderer.FieldWidth * (int)Utils.DefaultSize.X,
                () => tileRenderer.FieldHeight * (int)Utils.DefaultSize.Y);

            pressHelper = new(textureHelper, pressHandler, gameObjects, camera);
            GameObjects engineGameObjects = [];

            levelHandler = new(engineGameObjects, game.Difficulty);
            var goldHandler = new GoldHandler(game.Difficulty);
            gameEngine = new GameEngine(OnGameFinished, game.Difficulty, engineGameObjects, goldHandler, tileRenderer, levelHandler);
            gameEngine.OnProjectileAdded = (projectile, towerId) => gameObjects.Add(TowerFactory.CreateProjectile(textureHelper, projectile, towerId));
            gameEngine.OnEnemySpawned = OnEnemySpawned;
            gameEngine.OnGoldEarned = (System.Numerics.Vector2 position, int gold) => gameObjects.Add(new GoldText(textureHelper, position, gold));

            levelHandler.GameEngine = gameEngine;
            levelHandler.SetupLevels();
            gameObjects.Add(new TowerBar(textureHelper, gameEngine, camera, gameObjects, this));
            gameObjects.Add(new TopBar.TopBar(textureHelper, gameObjects, gameEngine, camera, this));
        }
        public void Unload()
        {
        }
        public void Update(GameTime gameTime)
        {
            pressHelper.Update();
            if (!pauseGame)
            {
                gameEngine.Update();
            }
            
            gameObjects.Update();
        }

        public void Draw(GameTime gameTime, SpriteBatch spriteBatch)
        {
            spriteBatch.Begin(transformMatrix: camera.GetViewMatrix(), samplerState: SamplerState.PointClamp);
            tileRenderer.Draw(spriteBatch);
            foreach (var gameObject in gameObjects.Where(x => !x.HasStaticPosition && !x.Hidden))
            {
                gameObject.Draw(spriteBatch);
            }

            spriteBatch.End();

            spriteBatch.Begin();
            foreach (var gameObject in gameObjects.Where(x => x.HasStaticPosition && !x.Hidden))
            {
                gameObject.Draw(spriteBatch);
            }
            spriteBatch.End();
        }

        private void OnGameFinished(GameResult result)
        {
            pauseGame = true;
            var scoreData = new ScoreData(result.LevelCompleted, result.DamageTestResult, result.IsWin, EventTracker.TrackedEvents, false);
            if (!result.IsWin)
            {
                List<DrawableGameObject> content = [
                    new SquareItemText(textureHelper.DefaultFont, "You lost", Color.Red, 501),
                    new HomeButton(textureHelper, game),
                    new RetryButton(textureHelper, game, "Try again")];
                ShowDialog(content);
            }
            else
            {
                List<DrawableGameObject> content = [
                    new SquareItemText(textureHelper.DefaultFont, $"You completed {result.Difficulty}", Color.Green, 501),
                    new SquareItemText(textureHelper.DefaultFont, $"Damage: {result.DamageTestResult}", Color.Green, 501),
                    new HomeButton(textureHelper, game),
                    new RetryButton(textureHelper, game, "Play again")];
                ShowDialog(content);
            }

            scoreDataHandler.TrySaveScore(scoreData, result.Difficulty);
            var simulator = new GameSimulator(EventTracker.DeserializeEvents(EventTracker.SerializeTrackedEvents()), result.Difficulty);
            simulator.SimulateGame();
            if (result.LevelCompleted != simulator.Result.LevelCompleted || result.DamageTestResult != simulator.Result.DamageTestResult)
            {
                var a = 5;
            }
        }

        public Tower CreateTower(BaseTowerLogic logic)
        {
            var tower = TowerFactory.CreateTower(textureHelper, logic, this);
            gameObjects.Add(tower);
            return tower;
        }

        public void ShowDialog(List<DrawableGameObject> content, bool showCloseButton = false)
        {
            gameObjects.Add(new DialogOverlay(textureHelper, gameObjects, camera, content, showCloseButton));
        }

        private void OnEnemySpawned(EnemyLogic logic)
        {
            gameObjects.Add(new Enemy(textureHelper, enemyTextures, textureHelper.LevelTextures[logic.Template.Name], logic, gameEngine, this));
        }
    }
}
