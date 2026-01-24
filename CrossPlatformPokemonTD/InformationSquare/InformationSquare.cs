using System.Collections.Generic;
using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;

namespace PokemonTDCore.InformationSquare
{
    public class InformationSquare(TextureHelper textureHelper, DrawableGameObjects gameObjects, Camera camera)
        : DrawableGameObject(Vector2.Zero, textureHelper.DialogBox, Vector2.Zero, 100)
    {
        public override bool HasStaticPosition => true;

        public bool Show
        {
            get
            {
                return show;
            }
            set
            {
                show = value;
                if (!show)
                {
                    foreach (var item in currentItems)
                    {
                        item.ShouldDispose = true;
                    }

                    currentItems.Clear();
                    if (currentSource != null)
                    {
                        currentSource.IsCurrentlyInformationSource = false;
                        currentSource = null;
                    }
                }
            }
        }

        private bool show;

        private IInformationSource currentSource;

        private List<DrawableGameObject> currentItems = [];

        private const int ItemHeight = 50;

        private const int ItemWidth = 250;

        private Microsoft.Xna.Framework.Rectangle SourceRectangle;

        public void UpdateContent(IInformationSource newSource)
        {
            if (Show)
            {
                Show = false;
            }

            var items = newSource.CreateItems();
            gameObjects.AddRange(items);
            currentSource = newSource;
            currentItems = items;
            var xPosition = camera.ScreenWidth - ItemWidth * Utils.SizeMultiplier - Utils.DefaultSize.X * 0.4f;
            SourceRectangle = Utils.MakeRectangle(xPosition,
                camera.ScreenHeight - ItemHeight * Utils.SizeMultiplier * items.Count - Utils.DefaultSize.Y * 0.8f,
                ItemWidth * Utils.SizeMultiplier + Utils.DefaultSize.X * 0.4f,
                ItemHeight * Utils.SizeMultiplier * items.Count + Utils.DefaultSize.Y * 0.8f).ToXna();
            var currentY = camera.ScreenHeight - ItemHeight * Utils.SizeMultiplier - Utils.DefaultSize.X * 0.3f;
            xPosition += Utils.DefaultSize.X * 0.65f;
            for (var i = items.Count - 1; i >= 0; i--)
            {
                items[i].Position = new Vector2(xPosition, currentY);
                currentY -= ItemHeight * Utils.SizeMultiplier;
            }

            newSource.IsCurrentlyInformationSource = true;
            Show = true;
        }

        public override void Update()
        {
            if (currentSource?.ShouldDispose == true && Show)
            {
                if (currentSource.RedirectToSource != null)
                {
                    UpdateContent(currentSource.RedirectToSource);
                } 
                else
                {
                    currentSource = null;
                    Show = false;
                }
            }
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            if (!Show)
            {
                return;
            }

            spriteBatch.Draw(Texture, SourceRectangle, Microsoft.Xna.Framework.Color.White);
        }
    }
}
