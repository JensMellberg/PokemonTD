using System.Linq;
using System.Numerics;
using PokemonTDCore.InformationSquare;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public class SimplePressHelper
    {
        private ClickableGameObject currentlyClicked;

        private IPressHandler pressHandler;

        private DrawableGameObjects gameObjects;

        public SimplePressHelper(IPressHandler pressHandler, DrawableGameObjects gameObjects)
        {
            this.pressHandler = pressHandler;
            this.gameObjects = gameObjects;
            pressHandler.PressCallback = OnPress;
            pressHandler.DragCallback = OnDrag;
            pressHandler.PressReleaseCallback = OnPressRelease;
        }

        public void Update()
        {
            pressHandler.Update();
        }

        private void OnPress(Vector2 position)
        {
            foreach (var gameObject in gameObjects.OfType<ClickableGameObject>())
            {
                var target = gameObject.TryPress(position);
                if (target != null)
                {
                    currentlyClicked = target;
                    return;
                }
            }
        }

        private void OnDrag(Vector2 delta, Vector2 position)
        {
        }

        private void OnPressRelease(Vector2 position)
        {
            if (currentlyClicked != null)
            {
                currentlyClicked?.TryPressRelease(position);
                currentlyClicked = null;
            }
        }
    }
}
