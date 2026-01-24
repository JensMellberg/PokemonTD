using System.Numerics;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public class HomeButton(TextureHelper textureHelper, PokemonTD game)
        : SimpleButton(textureHelper, Vector2.Zero, game.ShowStartScreen, new Vector2(210, 40) * Utils.SizeMultiplier, "Home", 501)
    {
        public override bool HasStaticPosition => true;
    }
}
