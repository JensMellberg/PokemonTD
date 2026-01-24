using System.Drawing;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public class DrawableGameObjects : GameObjectsBase<DrawableGameObject> {  }

    public abstract class DrawableGameObject(System.Numerics.Vector2 position, TextureReference texture, System.Numerics.Vector2 size, int zIndex = 1) : GameObject(position, size, zIndex)
    {
        protected TextureReference CurrentTextureReference = texture;

        protected Texture2D Texture => CurrentTextureReference.Value;

        public bool Hidden { get; set; }

        public virtual float Opacity => 1.0f;

        protected virtual Microsoft.Xna.Framework.Color Color => Microsoft.Xna.Framework.Color.White;

        public virtual void Draw(SpriteBatch spriteBatch) {
            spriteBatch.Draw(Texture, GetSourceRectangle.ToXna(), Color * Opacity);
        }

        public System.Drawing.Rectangle GetSourceRectangle => Utils.CreateSourceRectangle(Position, Size);
    }
}
