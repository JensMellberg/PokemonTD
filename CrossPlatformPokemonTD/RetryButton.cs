using System.Numerics;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public class RetryButton(TextureHelper textureHelper, PokemonTD game, string text)
        : SimpleButton(textureHelper, Vector2.Zero, game.StartGame, new Vector2(210, 40) * Utils.SizeMultiplier, text, 501)
    {
        public override bool HasStaticPosition => true;
    }
}
