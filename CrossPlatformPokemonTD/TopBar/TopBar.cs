using System.Collections.Generic;
using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;

namespace PokemonTDCore.TopBar
{
    public class TopBar : DrawableGameObject
    {
        private Camera camera;

        public TopBar(TextureHelper textureHelper, DrawableGameObjects drawableGameObjects, GameEngine gameEngine, Camera camera, GamePlayScreen gamePlayScreen)
            : base(Vector2.Zero, textureHelper.Menu, Vector2.Zero, 1)
        {
            this.camera = camera;
            height = (int)Utils.DefaultSize.Y + 10;
            var textYPosition = height / 2 - Utils.DefaultSize.Y / 5;

            var nextLevelButton = new NextLevelButton(textureHelper, gameEngine.LevelHandler, height);
            var xAdjustment = nextLevelButton.Size.X;
            var currentGold = new CurrentGold(xAdjustment, textureHelper, gameEngine, height, textYPosition);
            xAdjustment += currentGold.Width + (int)Utils.DefaultSize.X / 5;
            var nextLevel = new NextLevel(xAdjustment, textureHelper, gameEngine, textYPosition, gamePlayScreen);
            var settingsButton = new SettingsButton(textureHelper, new Vector2(camera.ScreenWidth - (Utils.DefaultSize.X + 5) * 2, 5), gameEngine);
            List<DrawableGameObject> gameObjects = [nextLevelButton, currentGold, nextLevel, settingsButton];

            var toggleVisibilityButton = new ToggleVisibilityButton(textureHelper, OnToggleVisibility, new Vector2(camera.ScreenWidth - Utils.DefaultSize.X - 5, 5));
            drawableGameObjects.AddRange(gameObjects);
            drawableGameObjects.Add(toggleVisibilityButton);

            void OnToggleVisibility(bool hide)
            {
                Hidden = hide;
                foreach (var item in gameObjects)
                {
                    item.Hidden = hide;
                }
            }
        }

        public override bool HasStaticPosition => true;

        private readonly int height;

        public override void Draw(SpriteBatch spriteBatch)
        {
            var screenWidth = camera.ScreenWidth;
            spriteBatch.Draw(Texture, new Microsoft.Xna.Framework.Rectangle(0, 0, screenWidth, height), Microsoft.Xna.Framework.Color.White);
        }
    }
}
