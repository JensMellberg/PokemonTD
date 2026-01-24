using System;
using System.Collections.Generic;
using System.Numerics;
using PokemonTDCore.InformationSquare;
using PokemonTDCore.Towers;
using PokemonTDEngine;
using PokemonTDEngine.Towers;

namespace PokemonTDCore.BuyableTowers
{
    public class BuyableTower(TextureReference texture, TextureHelper textureHelper, TowerStats towerStats, GameEngine gameEngine, Camera camera, DrawableGameObjects gameObjects, GamePlayScreen gamePlayScreen)
        : ClickableGameObject(Vector2.Zero, texture, Utils.DefaultSize, 2), IInformationSource
    {
        public override bool HasStaticPosition => true;

        private bool canBuy;

        protected override Microsoft.Xna.Framework.Color Color => canBuy ? base.Color : Microsoft.Xna.Framework.Color.Red;

        public IInformationSource RedirectToSource => null;

        public bool IsCurrentlyInformationSource { set; private get; }

        public override void Update()
        {
            canBuy = gameEngine.GoldHandler.CanAfford(towerStats.Cost);
        }

        public override ClickableGameObject TryPress(Vector2 position)
        {
            if (base.TryPress(position) != null)
            {
                if (!canBuy || gameEngine.LevelHandler.IsLevelOnGoing)
                {
                    return this;
                }

                var positionAdjustedForCamera = camera.AdjustForCamera(position);
                var rangeCircle = new RangeCircle(textureHelper, Utils.AdjustForScreen(towerStats.Range), positionAdjustedForCamera + Utils.DefaultSize / 2);
                var shadowTower = new ShadowTower(new TextureReference { Value = Texture }, positionAdjustedForCamera, towerStats, gameEngine, rangeCircle, this, gamePlayScreen);
                gameObjects.Add(shadowTower);
                gameObjects.Add(rangeCircle);
                return shadowTower;
            }

            return null;
        }

        protected override void OnPress(Vector2 position)
        {
            
        }

        protected override void OnPressRelease(Vector2 position)
        {

        }

        public List<DrawableGameObject> CreateItems()
        {
            return [new SquareItemText(textureHelper.DefaultFont, towerStats.Name, Microsoft.Xna.Framework.Color.Black),
                new SquareItemText(textureHelper.DefaultFont, $"Cost: {towerStats.Cost}", Microsoft.Xna.Framework.Color.Gold),
                new TypeText(towerStats.Type, textureHelper, gamePlayScreen, true)];
        }
    }
}
