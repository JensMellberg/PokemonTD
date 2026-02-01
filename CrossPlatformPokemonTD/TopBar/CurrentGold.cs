using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;

namespace PokemonTDCore.TopBar
{
    public class CurrentGold(float startX, TextureHelper textureHelper, GameEngine gameEngine, int height, float textYPosition) : DrawableGameObject(Vector2.Zero, textureHelper.GoldCoin, Vector2.Zero, 2)
    {
        public int Width = (int)(Utils.DefaultSize.X * 2);

        private Vector2 CoinPosition = new(startX + Utils.DefaultSize.X / 3, height / 2 - Utils.DefaultSize.X / 6);

        private Vector2 Size = Utils.DefaultSize / 3;

        private Vector2 TextPosition = new(startX + Utils.DefaultSize.X * 2 / 3 + Utils.DefaultSize.X / 5, textYPosition);

        public override bool HasStaticPosition => true;

        public override void Draw(SpriteBatch spriteBatch)
        {
            spriteBatch.Draw(Texture, Utils.CreateSourceRectangle(CoinPosition, Size).ToXna(), Microsoft.Xna.Framework.Color.White);
            spriteBatch.DrawString(
                textureHelper.DefaultFont.Value,
                gameEngine.GoldHandler.Gold.ToString(),
                TextPosition,
                Microsoft.Xna.Framework.Color.Yellow,
                0f,
                Vector2.Zero,
                Utils.FontScale,
                SpriteEffects.None,
                0f);
        }
    }
}
