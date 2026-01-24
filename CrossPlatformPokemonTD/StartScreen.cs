using System.Collections.Generic;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDCore.InformationSquare;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public class StartScreen(TextureHelper textureHelper, PokemonTD game, IPressHandler pressHandler, ScoreDataHandler scoreDataHandler) : IGameScreen
    {
        private SimplePressHelper pressHelper;
        private DrawableGameObjects gameObjects = [];
        public void Load()
        {
            pressHelper = new(pressHandler, gameObjects);
            var scores = scoreDataHandler.GetScores();
            gameObjects.Add(new DifficultyButton(textureHelper, new System.Numerics.Vector2(20, 50) * Utils.SizeMultiplier, Difficulty.Normal, game, scores));
            gameObjects.Add(new DifficultyButton(textureHelper, new System.Numerics.Vector2(265, 50) * Utils.SizeMultiplier, Difficulty.Hard, game, scores));
            gameObjects.Add(new DifficultyButton(textureHelper, new System.Numerics.Vector2(500, 50) * Utils.SizeMultiplier, Difficulty.Extreme, game, scores));
        }
        public void Unload()
        {

        }
        public void Update(GameTime gameTime)
        {
            pressHelper.Update();
            gameObjects.Update();
        }

        public void Draw(GameTime gameTime, SpriteBatch spriteBatch)
        {
            spriteBatch.Begin();
            foreach (var gameObject in gameObjects)
            {
                gameObject.Draw(spriteBatch);
            }
            spriteBatch.End();
        }

        private class DifficultyButton
            : SimpleButton
        {
            public override bool HasStaticPosition => true;
            private readonly PokemonTD game;
            private readonly Difficulty difficulty;
            private SquareItemText textObject;

            public DifficultyButton(TextureHelper textureHelper, System.Numerics.Vector2 position, Difficulty difficulty, PokemonTD game, Dictionary<Difficulty, ScoreData> scores)
                : base(textureHelper, position, null, new System.Numerics.Vector2(200, 50) * Utils.SizeMultiplier, difficulty.ToString(), 2)
            {
                this.game = game;
                this.difficulty = difficulty;
                var score = scores[difficulty];
                string text;
                Color color;
                if (score.IsWin)
                {
                    text = $"Completed! \nDamage result: {score.DamageTestResult}";
                    color = Color.Green;
                }
                else
                {
                    text = $"Level completed: {score.LevelCompleted}";
                    color = Color.Black;
                }

                textObject = new(textureHelper.DefaultFont, text, color, 101, 0.2f);
                textObject.Position = position + new System.Numerics.Vector2(0, 50) * Utils.SizeMultiplier;
            }

            protected override void OnClick()
            {
                game.Difficulty = difficulty;
                game.StartGame();
            }

            public override void Draw(SpriteBatch spriteBatch)
            {
                base.Draw(spriteBatch);
                textObject.Draw(spriteBatch);
            }
        }
    }
}
