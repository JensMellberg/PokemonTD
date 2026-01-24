using System;
using System.Numerics;

namespace PokemonTDCore
{
    public class Camera(Func<int> screenWidth, Func<int> screenHeight, Func<int> fieldWidth, Func<int> fieldHeight)
    {
        public Vector2 Position = Vector2.Zero;
        public float Zoom = 1f;
        public float Rotation = 0f;

        public Microsoft.Xna.Framework.Matrix GetViewMatrix()
        {
            return
                Microsoft.Xna.Framework.Matrix.CreateTranslation(new Vector3(-Position, 0f)) *
                Microsoft.Xna.Framework.Matrix.CreateRotationZ(Rotation) *
                Microsoft.Xna.Framework.Matrix.CreateScale(Zoom, Zoom, 1f);
        }

        public Vector2 AdjustForCamera(Vector2 position) => position + Position;

        public void Move(Vector2 delta)
        {
            Position -= delta / Zoom;
            Position.X = Math.Max(0, Position.X);
            Position.Y = Math.Max(0, Position.Y);
            Position.X = Math.Min(fieldWidth() - ScreenWidth, Position.X);
            Position.Y = Math.Min(fieldHeight() - ScreenHeight, Position.Y);
        }

        public int ScreenWidth => screenWidth();

        public int ScreenHeight => screenHeight();
    }
}
