using System;
using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public class UpgradeButton(TextureHelper textureHelper, Action upgradeCallback, int cost)
        : PureClickObject(Vector2.Zero, textureHelper.UpgradeButton, null, new Vector2(Utils.DefaultSize.X * 2.2f, Utils.DefaultSize.Y * 0.8f), 101)
    {
        public override bool HasStaticPosition => true;

        public bool CanUpgrade { get; set; } = true;

        public override float Opacity => CanUpgrade ? 1.0f : 0.5f;

        protected override void OnPressRelease(Vector2 position)
        {
            upgradeCallback();
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            spriteBatch.DrawString(
            textureHelper.DefaultFont.Value,
                cost + " gold",
                Position + new Vector2(Utils.DefaultSize.X * 2.4f, Utils.DefaultSize.Y * 0.2f),
                Microsoft.Xna.Framework.Color.Gold * Opacity,
                0f,
                Vector2.Zero,
                Utils.FontScale,
                SpriteEffects.None,
                0f);
        }
    }
}
