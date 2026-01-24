using Microsoft.Xna.Framework;

namespace PokemonTDCore
{
    public static class XnaUtils
    {
        public static Rectangle ToXna(this System.Drawing.Rectangle r) => new(r.X, r.Y, r.Width, r.Height);
        public static Vector2 ToXna(this System.Numerics.Vector2 v) => new(v.X, v.Y);
        public static Color ToXna(this System.Drawing.Color c) => new(c.R, c.G, c.B, c.A);
    }
}
