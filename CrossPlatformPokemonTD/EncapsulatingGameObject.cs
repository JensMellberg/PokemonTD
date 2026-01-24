using System.Numerics;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public abstract class EncapsulatingGameObject(TextureReference texture, GameObject source) : DrawableGameObject(source.Position, texture, source.Size, source.ZIndex)
    {
        public override bool HasStaticPosition => source.HasStaticPosition;

        public override bool ShouldDispose
        {
            get => source.ShouldDispose;
            set => source.ShouldDispose = value;
        }

        public override Vector2 Position
        {
            get => source.Position;
            set => source.Position = value;
        }
    }

    public abstract class EncapsulatingClickObject(TextureReference texture, TextureReference clickedTexture, GameObject source) : PureClickObject(source.Position, texture, clickedTexture, source.Size, source.ZIndex)
    {
        public override bool HasStaticPosition => source.HasStaticPosition;

        public override bool ShouldDispose
        {
            get => source.ShouldDispose;
            set => source.ShouldDispose = value;
        }

        public override Vector2 Position
        {
            get => source.Position;
            set => source.Position = value;
        }
    }
}
