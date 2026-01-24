using System.Linq;
using System.Numerics;
using PokemonTDCore.InformationSquare;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public class PressHelper
    {
        private bool isDraggingScreen;

        private ClickableGameObject currentlyClicked;

        private IPressHandler pressHandler;

        private DrawableGameObjects gameObjects;

        private Camera camera;

        private InformationSquare.InformationSquare informationSquare;

        private float totalCameraMoveDistance;

        public PressHelper(TextureHelper textureHelper, IPressHandler pressHandler, DrawableGameObjects gameObjects, Camera camera)
        {
            this.pressHandler = pressHandler;
            this.gameObjects = gameObjects;
            this.camera = camera;
            pressHandler.PressCallback = OnPress;
            pressHandler.DragCallback = OnDrag;
            pressHandler.PressReleaseCallback = OnPressRelease;
            informationSquare = new InformationSquare.InformationSquare(textureHelper, gameObjects, camera);
            gameObjects.Add(informationSquare);
        }

        public void Update()
        {
            pressHandler.Update();
        }

        private void OnPress(Vector2 position)
        {
            var adjustedPosition = camera.AdjustForCamera(position);
            foreach (var gameObject in gameObjects.OfType<ClickableGameObject>().Reverse().Where(x => !x.Hidden).ToList())
            {
                var target = gameObject.TryPress(gameObject.HasStaticPosition ? position : adjustedPosition);
                if (target != null)
                {
                    currentlyClicked = target;
                    return;
                }
            }
          
            if (currentlyClicked == null)
            {
                isDraggingScreen = true;
                totalCameraMoveDistance = 0f;
            }
        }

        private void OnDrag(Vector2 delta, Vector2 position)
        {
            if (isDraggingScreen)
            {
                camera.Move(delta);
                totalCameraMoveDistance += delta.Length();
            }

            currentlyClicked?.OnDrag(delta, position);
        }

        private void OnPressRelease(Vector2 position)
        {
            if (isDraggingScreen)
            {
                isDraggingScreen = false;
                if (totalCameraMoveDistance < 10f * Utils.SizeMultiplier)
                {
                    informationSquare.Show = false;
                }
            }

            totalCameraMoveDistance = 0f;
            if (currentlyClicked != null)
            {
                var adjustedPosition = currentlyClicked.HasStaticPosition ? position : camera.AdjustForCamera(position);
                currentlyClicked?.TryPressRelease(adjustedPosition);
                
                if (currentlyClicked is IInformationSource informationSource)
                {
                    informationSquare.UpdateContent(informationSource);
                }

                currentlyClicked = null;
            }
        }
    }
}
