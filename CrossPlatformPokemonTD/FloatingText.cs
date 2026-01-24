using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;
using Color = Microsoft.Xna.Framework.Color;

namespace PokemonTDCore
{
    public class GoldText(TextureHelper textureHelper, Vector2 position, int gold)
        : FloatingText(textureHelper.DefaultFont, position, 60, $"+{gold}", Color.Gold);

    public class FloatingText(SpriteFontReference font, Vector2 position, int duration, string text, Color color) : DrawableGameObject(position, null, Vector2.Zero, 5)
    {
        public override bool HasStaticPosition => false;

        public override void Update()
        {
            duration--;
            if (duration < 1)
            {
                ShouldDispose = true;
            }

            Position = new Vector2(Position.X, Position.Y - Utils.SizeMultiplier);
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            spriteBatch.DrawString(
                font.Value,
                text,
                Position,
                color,
                0f,
                Vector2.Zero,
                Utils.FontScale,
                SpriteEffects.None,
                0f);
        }
    }
}
