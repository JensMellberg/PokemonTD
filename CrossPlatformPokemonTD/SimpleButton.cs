using System;
using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public class SimpleButton(TextureHelper textureHelper, Vector2 position, Action onClick, Vector2 size, string text, int zIndex = 1)
        : PureClickObject(position, textureHelper.SimpleButton, null, size, zIndex)
    {
        protected virtual void OnClick() => onClick();
        public override bool HasStaticPosition => true;

        protected override void OnPressRelease(Vector2 position)
        {
            OnClick();
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);

            var textSize = textureHelper.DefaultFont.Value.MeasureString(text) * Utils.FontScale;
            var textPosition = Position + (Size - textSize) / 2f;
            spriteBatch.DrawString(
                textureHelper.DefaultFont.Value,
                text,
                textPosition,
                Microsoft.Xna.Framework.Color.Black,
                0f,
                Vector2.Zero,
                Utils.FontScale,
                SpriteEffects.None,
                0f);
        }
    }
}
