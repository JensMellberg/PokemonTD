using System;
using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;

namespace PokemonTDCore.TopBar
{
    public class ToggleVisibilityButton(TextureHelper textureHelper, Action<bool> toggleCallback, Vector2 position)
        : PureClickObject(position, textureHelper.VisibilityButton, null, Utils.DefaultSize, 2)
    {
        public override bool HasStaticPosition => true;

        private bool isHidden;

        protected override void OnPressRelease(Vector2 position)
        {
            isHidden = !isHidden;
            toggleCallback(isHidden);
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            var origin = new Vector2(
                Texture.Width / 2f,
                Texture.Height / 2f
            );

            spriteBatch.Draw(
                Texture,
                Position + Size / 2,
                null,
                Microsoft.Xna.Framework.Color.White,
                isHidden ? 0 : Microsoft.Xna.Framework.MathHelper.Pi,
                origin,
                Utils.SizeMultiplier,
                SpriteEffects.None,
                0f);
        }
    }
}
