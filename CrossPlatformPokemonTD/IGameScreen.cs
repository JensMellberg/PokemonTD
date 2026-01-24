using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace PokemonTDCore
{
    public interface IGameScreen
    {
        public void Load();
        public void Unload();
        public void Update(GameTime gameTime);
        public void Draw(GameTime gameTime, SpriteBatch spriteBatch);
    }
}
