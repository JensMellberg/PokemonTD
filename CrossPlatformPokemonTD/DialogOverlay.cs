using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public class DialogOverlay : DrawableGameObject
    {
        public override bool HasStaticPosition => true;

        private const int ItemHeight = 50;

        private readonly int itemWidth;

        private Microsoft.Xna.Framework.Rectangle SourceRectangle;

        private readonly List<DrawableGameObject> content;

        public DialogOverlay(TextureHelper textureHelper, DrawableGameObjects gameObjects, Camera camera, List<DrawableGameObject> content, bool showCloseButton)
            : base(Vector2.Zero, textureHelper.DialogBox, Vector2.Zero, 500)
        {
            this.content = content;
            if (showCloseButton)
            {
                content.Add(new SimpleButton(textureHelper, Vector2.Zero, () => ShouldDispose = true, new Vector2(210, 50) * Utils.SizeMultiplier, "Close", 501));
            }

            gameObjects.AddRange(content);
            itemWidth = Math.Max(content.Max(x => (int)(x.Size.X + Utils.DefaultSize.X * 0.8f)), (int)(280 * Utils.SizeMultiplier));

            var xPosition = camera.ScreenWidth / 2 - itemWidth / 2 - Utils.DefaultSize.X * 0.2f;
            var yPosition = camera.ScreenHeight / 2 - ItemHeight * Utils.SizeMultiplier * content.Count / 2 - Utils.DefaultSize.Y * 0.2f;
            SourceRectangle = Utils.MakeRectangle(xPosition,
                yPosition,
                itemWidth + Utils.DefaultSize.X * 0.4f,
                ItemHeight * Utils.SizeMultiplier * content.Count + Utils.DefaultSize.Y * 0.8f).ToXna();
            xPosition += itemWidth / 5 * 0.65f;
            yPosition += Utils.DefaultSize.X * 0.32f;
            for (var i = 0; i < content.Count; i++)
            {
                content[i].Position = new Vector2(xPosition, yPosition);
                yPosition += ItemHeight * Utils.SizeMultiplier;
            }
        }

        public override bool ShouldDispose { 
            get => base.ShouldDispose; 
            set
            {
                foreach (var item in content)
                {
                    item.ShouldDispose = true;
                }

                base.ShouldDispose = value;
            } 
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            spriteBatch.Draw(Texture, SourceRectangle, Microsoft.Xna.Framework.Color.White);
        }
    }
}
