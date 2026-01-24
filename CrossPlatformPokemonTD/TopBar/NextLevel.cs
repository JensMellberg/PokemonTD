using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDCore.InformationSquare;
using PokemonTDEngine;

namespace PokemonTDCore.TopBar
{
    public class NextLevel(float startX, TextureHelper textureHelper, GameEngine gameEngine, float textYPosition, GamePlayScreen gamePlayScreen)
        : PureClickObject(Vector2.Zero, null, null, Vector2.Zero, 2)
    {
        private Vector2 TextPosition = new(startX + Utils.DefaultSize.X / 5, textYPosition);

        private int lastLevel = -1;

        private TypeText typeText;

        private string text;

        public override Vector2 Size => new(textWidth + typeText.Size.X, typeText.Size.Y);

        private float textWidth;

        public override void Update()
        {
            if (lastLevel != gameEngine.LevelHandler.CurrentLevel)
            {
                lastLevel = gameEngine.LevelHandler.CurrentLevel;
                UpdateInformation();
            }
        }

        private void UpdateInformation()
        {
            var template = gameEngine.LevelHandler.NextLevelTemplate;
            Position = TextPosition;
            if (template != null)
            {
                var font = textureHelper.DefaultFont.Value;
                text = "Next level: " + (template.DisplayName ?? template.Name);
                textWidth = font.MeasureString(text).X * Utils.FontScale;
                typeText = new TypeText(template.DisplayType ?? template.Type, textureHelper, gamePlayScreen, false);
                typeText.Position = TextPosition + new Vector2(textWidth + font.MeasureString(" ").X * Utils.FontScale, 0);
            }
            else
            {
                text = null;
            }
        }

        public override bool HasStaticPosition => true;

        public override void Draw(SpriteBatch spriteBatch)
        {
            if (text == null)
            {
                return;
            }

            var font = textureHelper.DefaultFont.Value;
            spriteBatch.DrawString(
                font,
                text,
                TextPosition,
                Microsoft.Xna.Framework.Color.Black,
                0f,
                Vector2.Zero,
                Utils.FontScale,
                SpriteEffects.None,
                0f);
            typeText.Draw(spriteBatch);
        }

        protected override void OnPressRelease(Vector2 position)
        {
            typeText.TryPressRelease(position);
        }
    }
}
