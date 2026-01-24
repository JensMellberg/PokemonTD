using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDCore.BuyableTowers;
using PokemonTDCore.TopBar;
using PokemonTDCore.Towers;
using PokemonTDEngine;
using PokemonTDEngine.Towers;

namespace PokemonTDCore
{
    public class TowerBar : DrawableGameObject
    {
        private readonly Camera camera;
        private readonly List<BuyableTower> towers = [];
        private Dictionary<int, List<BuyableTower>> towerPages;
        private readonly ToggleVisibilityButton toggleVisibilityButton;
        private readonly TowerChangeButton towerChangeButton;
        private int currentPage = -1;

        public TowerBar(TextureHelper textureHelper, GameEngine gameEngine, Camera camera, DrawableGameObjects gameObjects, GamePlayScreen gamePlayScreen)
            : base(Vector2.Zero, textureHelper.Menu, Vector2.Zero)
        {
            this.camera = camera;
            height = (int)Utils.DefaultSize.Y + 10;
            toggleVisibilityButton = new ToggleVisibilityButton(textureHelper, OnToggleVisiblity, new Vector2(camera.ScreenWidth - Utils.DefaultSize.X - 5, camera.ScreenHeight - height + 5));
            towerChangeButton = new TowerChangeButton(new Vector2(toggleVisibilityButton.Position.X - Utils.DefaultSize.X - 10 * Utils.SizeMultiplier, camera.ScreenHeight - height + 5), textureHelper, OnTowerChange);
            towers.Add(new BuyableTower(textureHelper.Charmander, textureHelper, TowerStats.Charmander, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Pichu, textureHelper, TowerStats.Pichu, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Pidgey, textureHelper, TowerStats.Pidgey, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Onix, textureHelper, TowerStats.Onix, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Bagon, textureHelper, TowerStats.Bagon, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Magikarp, textureHelper, TowerStats.Magikarp, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Exeggcute, textureHelper, TowerStats.Exeggcute, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Poochyena, textureHelper, TowerStats.Poochyena, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Gastly, textureHelper, TowerStats.Gastly, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Makuhita, textureHelper, TowerStats.Makuhita, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Koffing, textureHelper, TowerStats.Koffing, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Wobbuffet, textureHelper, TowerStats.Wobbuffet, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Scyther, textureHelper, TowerStats.Scyther, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Articuno, textureHelper, TowerStats.Articuno, gameEngine, camera, gameObjects, gamePlayScreen));
            towers.Add(new BuyableTower(textureHelper.Groudon, textureHelper, TowerStats.Groudon, gameEngine, camera, gameObjects, gamePlayScreen));

            gameObjects.AddRange(towers);
            gameObjects.Add(toggleVisibilityButton);
            gameObjects.Add(towerChangeButton);

            AdjustPositions();
            OnTowerChange();
        }

        private void AdjustPositions()
        {
            towerPages = [];
            towerPages.Add(0, []);
            towerChangeButton.Hidden = true;
            var current = new Vector2(10 * Utils.SizeMultiplier, camera.ScreenHeight - height + 5);
            var currentPage = 0;
            foreach (var tower in towers)
            {
                tower.Position = current;
                towerPages[currentPage].Add(tower);
                current.X += Utils.DefaultSize.X + 10 * Utils.SizeMultiplier;
                if (current.X + Utils.DefaultSize.X + 10 * Utils.SizeMultiplier >= towerChangeButton.Position.X)
                {
                    current.X = 10 * Utils.SizeMultiplier;
                    currentPage++;
                    towerPages.Add(currentPage, []);
                    towerChangeButton.Hidden = false;
                }
            }
        }

        private void OnTowerChange()
        {
            currentPage++;
            if (currentPage >= towerPages.Count)
            {
                currentPage = 0;
            }

            foreach (var kv in towerPages)
            {
                var hide = kv.Key != currentPage;
                foreach (var tower in kv.Value)
                {
                    tower.Hidden = hide;
                }
            }
        }

        private void OnToggleVisiblity(bool hide)
        {
            Hidden = hide;
            towerChangeButton.Hidden = hide;
            foreach (var tower in towerPages[currentPage])
            {
                tower.Hidden = hide;
            }
        }

        public override bool HasStaticPosition => true;

        private readonly int height;

        public override void Draw(SpriteBatch spriteBatch)
        {
            var screenHeight = camera.ScreenHeight;
            var screenWidth = camera.ScreenWidth;
            spriteBatch.Draw(Texture, new Microsoft.Xna.Framework.Rectangle(0, screenHeight - height, screenWidth, height), Microsoft.Xna.Framework.Color.White);
        }

        private class TowerChangeButton(Vector2 position, TextureHelper textureHelper, Action callback) : PureClickObject(position, textureHelper.TowerChange, null, Utils.DefaultSize, 2)
        {
            public override bool HasStaticPosition => true;

            protected override void OnPressRelease(Vector2 position)
            {
                callback();
            }
        }
    }
}
