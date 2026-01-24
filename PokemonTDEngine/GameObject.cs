using System.Drawing;
using System.Numerics;

namespace PokemonTDEngine
{
    public abstract class GameObject(Vector2 position, Vector2 size, int zIndex = 1)
    {
        public abstract bool HasStaticPosition { get; }

        public virtual void Update() { }

        public virtual Vector2 Size => size;

        public virtual Vector2 Position { get; set; } = position;

        public int ZIndex = zIndex;

        public Vector2 Center => Position + (Size / 2);

        public virtual bool ShouldDispose { get; set; }
    }
}
