

using System.Numerics;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public abstract class ClickableGameObject(Vector2 position, TextureReference texture, Vector2 size, int zIndex = 1)
        : DrawableGameObject(position, texture, size, zIndex)
    {
        public virtual ClickableGameObject TryPress(Vector2 position)
        {
            if (Utils.IsInside(position, GetSourceRectangle))
            {
                return this;
            }

            return null;
        }

        public virtual void TryPressRelease(Vector2 position)
        {
            OnPressRelease(position);
        }

        protected abstract void OnPress(Vector2 position);

        protected abstract void OnPressRelease(Vector2 position);

        public virtual void OnDrag(Vector2 delta, Vector2 position) { }
    }
}
