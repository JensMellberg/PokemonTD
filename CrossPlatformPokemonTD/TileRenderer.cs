using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public class TileRenderer : TileHandler
    {
        private Texture2D[] tileTextures;

        public void LoadContent(ContentManager contentManager)
        {
            tileTextures = new Texture2D[5];
            tileTextures[0] = contentManager.Load<Texture2D>("Grass");
            tileTextures[1] = contentManager.Load<Texture2D>("Bricks");
            tileTextures[2] = contentManager.Load<Texture2D>("Water");
            tileTextures[3] = contentManager.Load<Texture2D>("Goal");
            tileTextures[4] = contentManager.Load<Texture2D>("Start");
        }

        public void Draw(SpriteBatch spriteBatch)
        {
            for (var x = 0; x < TileMap.GetLength(1); x++)
            {
                for (var y = 0; y < TileMap.GetLength(0); y++)
                {
                    spriteBatch.Draw(tileTextures[TileMap[y, x]], new Rectangle((int)Utils.DefaultSize.X * x, (int)Utils.DefaultSize.Y * y, (int)Utils.DefaultSize.X, (int)Utils.DefaultSize.Y), Color.White);
                }
            }

            spriteBatch.Draw(tileTextures[4], Utils.CreateSourceRectangle(GameEngine.TranslateFromTile(SpawnStart - new System.Numerics.Vector2(0, 1)), Utils.DefaultSize).ToXna(), Color.White);
        }
    }
}
