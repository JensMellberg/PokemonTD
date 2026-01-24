using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;

namespace PokemonTDCore.InformationSquare
{
    public class SquareItemText(SpriteFontReference font, string text, Microsoft.Xna.Framework.Color color, int zIndex = 101, float? fontScale = null) : DrawableGameObject(Vector2.Zero, null, Vector2.Zero, zIndex)
    {
        public override bool HasStaticPosition => true;

        public string Text { get; set; } = text;

        public override void Draw(SpriteBatch spriteBatch)
        {
            spriteBatch.DrawString(
                font.Value,
                Text,
                Position,
                color,
                0f,
                Vector2.Zero,
                fontScale ?? Utils.FontScale,
                SpriteEffects.None,
                0f);
        }
    }
}
