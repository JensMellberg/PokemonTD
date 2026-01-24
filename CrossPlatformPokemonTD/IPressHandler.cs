using System;
using System.Numerics;

namespace PokemonTDCore
{
    public interface IPressHandler
    {
        public Action<Vector2> PressCallback { get; set; }

        public Action<Vector2> PressReleaseCallback { get; set; }

        public Action<Vector2, Vector2> DragCallback { get; set; }

        public void Update();
    }
}
