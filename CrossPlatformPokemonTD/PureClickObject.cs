using System.Numerics;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public abstract class PureClickObject(Vector2 position, TextureReference texture, TextureReference clickedTexture, Vector2 size, int zIndex = 1) : ClickableGameObject(position, texture, size, zIndex)
    {
        TextureReference OriginalTexture = texture;

        public override void TryPressRelease(Vector2 position)
        {
            CurrentTextureReference = OriginalTexture;
            if (Utils.IsInside(position, GetSourceRectangle))
            {
                OnPressRelease(position);
            }
        }

        protected override void OnPress(Vector2 position)
        {
            if (clickedTexture != null)
            {
                CurrentTextureReference = clickedTexture;
            }
        }
    }
}
