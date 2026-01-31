

using System.Numerics;

namespace PokemonTDCore
{
    public class RangeCircle : DrawableGameObject
    {
        public RangeCircle(TextureHelper textureHelper, float range, Vector2 position) : base(new Vector2(position.X - range, position.Y - range), textureHelper.RangeCircle, new Vector2(range * 2, range * 2))
        {
        }

        public override bool HasStaticPosition => false;

        public override float Opacity => 0.5f;
    }
}
