using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;
using PokemonTDEngine.Towers;

namespace PokemonTDCore.Towers
{
    public class Projectile(TextureReference texture, BaseProjectile source)
        : EncapsulatingGameObject(texture, source)
    {
        Vector2 origin;

        public override void Update()
        {
            origin = new Vector2(Texture.Width, Texture.Height) / 2;
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            spriteBatch.Draw(Texture, 
                Utils.MakeRectangle(Position.X, Position.Y, Texture.Width * Utils.SizeMultiplier, Texture.Height * Utils.SizeMultiplier).ToXna(), 
                null, 
                Color.White, 
                source.rotation, 
                origin, 
                SpriteEffects.None, 
                0f);
        }
    }
}
