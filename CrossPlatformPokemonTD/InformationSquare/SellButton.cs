using System;
using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public class SellButton(TextureHelper textureHelper, Action sellCallback, int sellFor)
        : PureClickObject(Vector2.Zero, textureHelper.SellButton, null, new Vector2(Utils.DefaultSize.X * 1.5f, Utils.DefaultSize.Y * 0.8f), 101)
    {
        public override bool HasStaticPosition => true;

        public int SellFor = sellFor;

        protected override void OnPressRelease(Vector2 position)
        {
            sellCallback();
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            spriteBatch.DrawString(
            textureHelper.DefaultFont.Value,
                SellFor + " gold",
                Position + new Vector2(Utils.DefaultSize.X * 1.7f, Utils.DefaultSize.Y * 0.2f),
                Microsoft.Xna.Framework.Color.Gold,
                0f,
                Vector2.Zero,
                Utils.FontScale,
                SpriteEffects.None,
                0f);
        }
    }
}
