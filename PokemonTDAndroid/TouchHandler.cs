using System;
using System.Linq;
using System.Numerics;
using Microsoft.Xna.Framework.Input.Touch;
using PokemonTDCore;

namespace PokemonTDAndroid
{
    internal class TouchHandler : IPressHandler
    {
        public Action<Vector2> PressCallback { get; set; }
        public Action<Vector2> PressReleaseCallback { get; set; }
        public Action<Vector2, Vector2> DragCallback { get; set; }

        private Microsoft.Xna.Framework.Vector2 lastTouchPos;

        public void Update()
        {
            var touch = TouchPanel.GetState().FirstOrDefault();
            if (touch.State != TouchLocationState.Invalid)
            {
                switch (touch.State)
                {
                    case TouchLocationState.Pressed:
                        lastTouchPos = touch.Position;
                        PressCallback(new Vector2(lastTouchPos.X, lastTouchPos.Y));
                        break;
                    case TouchLocationState.Moved:
                        var delta = touch.Position - lastTouchPos;
                        DragCallback(new Vector2(delta.X, delta.Y), new Vector2(touch.Position.X, touch.Position.Y));
                        lastTouchPos = touch.Position;
                        break;
                    case TouchLocationState.Released:
                        PressReleaseCallback(new Vector2(touch.Position.X, touch.Position.Y));
                        break;
                }
            }
        }
    }
}
