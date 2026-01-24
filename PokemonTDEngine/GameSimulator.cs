using System.Numerics;
using PokemonTDEngine.Towers;

namespace PokemonTDEngine
{
    public class GameSimulator(List<Event> events, Difficulty difficulty)
    {
        private bool isFinished;
        private GameObjects gameObjects = [];
        public GameResult? Result { get; private set; }

        public void SimulateGame()
        {
            gameObjects = [];
            var levelHandler = new LevelHandler(gameObjects, difficulty);
            var gameEngine = new GameEngine(OnGameFinished, difficulty, gameObjects, new GoldHandler(difficulty), new TileHandler(), levelHandler);
            levelHandler.GameEngine = gameEngine;
            levelHandler.SetupLevels();

            var nextEventIndex = 0;
            while (!isFinished)
            {
                PerformRelevantEvents();
                levelHandler.StartNextLevel();
                while (levelHandler.IsLevelOnGoing && !isFinished)
                {
                    gameEngine.Update();
                    PerformRelevantEvents();
                }
            }

            Event? NextEvent() => nextEventIndex >= events.Count ? null : events[nextEventIndex];
            void PerformRelevantEvents()
            {
                var @event = NextEvent();
                while (@event?.LevelAtEvent == levelHandler.CurrentLevel && @event?.TickAtEvent == gameEngine.CurrentTicks)
                {
                    PerformEvent(@event, gameEngine);
                    nextEventIndex++;
                    @event = NextEvent();
                }
            }
        }

        private void PerformEvent(Event @event, GameEngine gameEngine)
        {
            if (@event is TowerBuildEvent towerBuildEvent)
            {
                if (gameEngine.TryPlaceTower(towerBuildEvent.TowerId, towerBuildEvent.Tile) == null)
                {
                    throw new Exception($"Could not place tower at ({towerBuildEvent.Tile.X}, {towerBuildEvent.Tile.Y}).");
                }
            }
            else if (@event is TowerSellEvent towerSellEvent)
            {
                FindTower(towerSellEvent.Tile).Sell();
            }
            else if (@event is TowerUpgradeEvent towerUpgradeEvent)
            {
                if (FindTower(towerUpgradeEvent.Tile).TryUpgrade() == null)
                {
                    throw new Exception($"Could not upgrade tower at ({towerUpgradeEvent.Tile.X}, {towerUpgradeEvent.Tile.Y}).");
                }
            }
            else if (@event is FocusEnemyEvent focusEnemyEvent)
            {
                gameEngine.FocusEnemy(FindEnemy(focusEnemyEvent.EnemyId));
            }
        }

        private BaseTowerLogic FindTower(Vector2 tile) => gameObjects
            .OfType<BaseTowerLogic>()
            .Where(x => !x.ShouldDispose)
            .Single(x => x.Position == GameEngine.TranslateFromTile(tile));

        private EnemyLogic FindEnemy(long enemyId) => gameObjects
            .OfType<EnemyLogic>()
            .Single(x => x.ID == enemyId);

        private void OnGameFinished(GameResult gameResult)
        {
            isFinished = true;
            Result = gameResult;
        }
    }
}
