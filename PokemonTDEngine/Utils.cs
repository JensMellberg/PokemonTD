using System.Drawing;
using System.Numerics;

namespace PokemonTDEngine
{
    public static class Utils
    {
        public static bool IsInside(Vector2 position, Rectangle rectangle) => position.X >= rectangle.X && position.Y >= rectangle.Y
            && position.X <= rectangle.X + rectangle.Width && position.Y <= rectangle.Y + rectangle.Height;

        public static Vector2 DefaultSize = new(50, 50);

        public static float SizeMultiplier = 1;

        public static float FontScale = 0.25f;

        public const float EPSILON = 0.0001f;

        public static Rectangle CreateSourceRectangle(Vector2 position, Vector2 size) =>
            new((int)position.X, (int)position.Y, (int)size.X, (int)size.Y);

        public static Vector2 GetVectorPointingTo(Vector2 start, Vector2 goal)
        {
            var direction = goal - start;
            return Vector2.Normalize(direction);
        }

        public static int AdjustForScreen(int original) => (int)(original * SizeMultiplier);

        public static float AdjustForScreen(float original) => original * SizeMultiplier;

        public static float DistanceBetween(Vector2 first, Vector2 second) => (first - second).Length();

        public static Rectangle MakeRectangle(float x, float y, float width, float height) => new((int)x, (int)y, (int)width, (int)height);
    }
}
