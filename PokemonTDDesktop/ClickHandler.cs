using System;
using System.Numerics;
using Microsoft.Xna.Framework.Input;
using PokemonTDCore;

namespace PokemonTDDesktop
{
    internal class ClickHandler : IPressHandler
    {
        public Action<Vector2> PressCallback { get; set; }
        public Action<Vector2> PressReleaseCallback { get; set; }
        public Action<Vector2, Vector2> DragCallback { get; set; }

        private bool hasClicked;
        private Vector2 lastMousePos;

        public void Update()
        {
            var mouseState = Mouse.GetState();
            if (hasClicked)
            {
                if (mouseState.LeftButton == ButtonState.Pressed)
                {
                    var newMousePos = MousePosition(mouseState);
                    var delta = newMousePos - lastMousePos;
                    DragCallback(delta, newMousePos);
                    lastMousePos = newMousePos;
                } else
                {
                    hasClicked = false;
                    PressReleaseCallback(MousePosition(mouseState));
                }
            } else if (mouseState.LeftButton == ButtonState.Pressed) {
                hasClicked = true;
                lastMousePos = MousePosition(mouseState);
                PressCallback(lastMousePos);
            }
        }

        private Vector2 MousePosition(MouseState state) => new Vector2(state.X, state.Y);
    }
}
