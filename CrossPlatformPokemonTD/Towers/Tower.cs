using System;
using System.Collections.Generic;

using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDCore.InformationSquare;
using PokemonTDEngine;
using PokemonTDEngine.Towers;

namespace PokemonTDCore.Towers
{
    public class Tower(TextureHelper textureHelper, TextureReference texture, BaseTowerLogic towerLogic, GamePlayScreen gamePlayScreen)
        : EncapsulatingClickObject(texture, null, towerLogic), IInformationSource
    {
        public override bool HasStaticPosition => false;

        private SellButton sellButton;

        private UpgradeButton upgradeButton;

        public bool IsCurrentlyInformationSource { private get; set; }

        private RangeCircle rangeCircle = new(textureHelper, Utils.AdjustForScreen(towerLogic.Stats.Range), towerLogic.Position + Utils.DefaultSize / 2);

        protected override void OnPressRelease(Vector2 position)
        {

        }

        public override void Update()
        {
            if (IsCurrentlyInformationSource)
            {
                if (sellButton != null)
                {
                    sellButton.SellFor = towerLogic.SellPrice;
                }

                if (upgradeButton != null)
                {
                    upgradeButton.CanUpgrade = towerLogic.CanUpgrade;
                }
            }
        }

        private void OnSellButtonClick()
        {
            EventTracker.SellTower(Position, towerLogic.GameEngine);
            towerLogic.Sell();
        }

        private void OnUpgradeButtonClick()
        {
            var newTowerLogic = towerLogic.TryUpgrade();
            if (newTowerLogic != null)
            {
                EventTracker.UpdateTower(Position, towerLogic.GameEngine);
                var newTower = gamePlayScreen.CreateTower(newTowerLogic);
                RedirectToSource = newTower;
            }
        }

        public IInformationSource RedirectToSource { get; private set; }

        public List<DrawableGameObject> CreateItems()
        {
            sellButton = new SellButton(textureHelper, OnSellButtonClick, towerLogic.SellPrice);
            List<DrawableGameObject> baseList = [new SquareItemText(textureHelper.DefaultFont, towerLogic.Stats.Name, Microsoft.Xna.Framework.Color.Black),
                new TypeText(towerLogic.Stats.Type, textureHelper, gamePlayScreen, true),
                new SquareItemText(textureHelper.DefaultFont, $"Damage: {towerLogic.Stats.Damage}", Microsoft.Xna.Framework.Color.DarkOrange),
                sellButton];
            if (towerLogic.UpgradeInfo != null)
            {
                upgradeButton = new UpgradeButton(textureHelper, OnUpgradeButtonClick, towerLogic.UpgradeInfo.Cost);
                baseList.Add(upgradeButton);
            }

            return baseList;
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            if (IsCurrentlyInformationSource)
            {
                rangeCircle.Draw(spriteBatch);
            }

            base.Draw(spriteBatch);
        }
    }
}
