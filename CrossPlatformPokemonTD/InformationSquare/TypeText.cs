using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDEngine;

namespace PokemonTDCore.InformationSquare
{
    public class TypeText : PureClickObject
    {
        public override bool HasStaticPosition => true;

        public override Vector2 Size => totalSize;

        private readonly string text;

        private Microsoft.Xna.Framework.Color color;

        private readonly TextureHelper textureHelper;
        private Vector2 textOffset;
        private Vector2 totalSize;
        private readonly GamePlayScreen gameScreen;
        private bool isAttacker;
        private Type type;

        public TypeText(Type type, TextureHelper textureHelper, GamePlayScreen gameScreen, bool isAttacker)
            : base(Vector2.Zero, null, null, Vector2.Zero, 101)
        {
            text = "Type: " + type.TypeDefinition.ToString();
            textOffset = new Vector2(textureHelper.DefaultFont.Value.MeasureString(text).X * Utils.FontScale, 0);
            color = type.Color.ToXna();
            this.textureHelper = textureHelper;
            this.isAttacker = isAttacker;
            this.type = type;
            this.gameScreen = gameScreen;
            totalSize = new Vector2(textOffset.X + Utils.DefaultSize.X * 0.5f, 50);
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            spriteBatch.DrawString(
                textureHelper.DefaultFont.Value,
                text,
                Position,
                color,
                0f,
                Vector2.Zero,
                Utils.FontScale,
                SpriteEffects.None,
                0f);
            if (type.ShowTypeInformation)
            {
                spriteBatch.Draw(
                    textureHelper.HelpButton.Value,
                    Utils.CreateSourceRectangle(Position + textOffset, Utils.DefaultSize * 0.5f).ToXna(),
                    Microsoft.Xna.Framework.Color.White);
            }
        }

        protected override void OnPressRelease(Vector2 position)
        {
            if (!type.ShowTypeInformation)
            {
                return;
            }

            var content = new List<DrawableGameObject>();
            var allTypes = Type.AllTypes.ToDictionary(x => x.TypeDefinition, x => x);
            if (isAttacker)
            {
                var strongAgainst = type.StrongAgainst.Select(x => (x.ToString(), allTypes[x].Color.ToXna()));
                var weakAgainst = type.WeakAgainst.Select(x => (x.ToString(), allTypes[x].Color.ToXna()));
                var cannotAttack = type.CannotAttack.Select(x => (x.ToString(), allTypes[x].Color.ToXna()));
                content.Add(new TypeInfoText(textureHelper.DefaultFont, "Strong against: ", strongAgainst.ToList()));
                content.Add(new TypeInfoText(textureHelper.DefaultFont, "Weak against: ", weakAgainst.ToList()));

                if (cannotAttack.Any())
                {
                    content.Add(new TypeInfoText(textureHelper.DefaultFont, "Cannot attack: ", cannotAttack.ToList()));
                }
            }
            else
            {
                var weakTo = allTypes.Values.Where(x => x.StrongAgainst.Contains(type.TypeDefinition)).Select(x => (x.TypeDefinition.ToString(), x.Color.ToXna()));
                var resistantTo = allTypes.Values.Where(x => x.WeakAgainst.Contains(type.TypeDefinition)).Select(x => (x.TypeDefinition.ToString(), x.Color.ToXna()));
                var immuneTo = allTypes.Values.Where(x => x.CannotAttack.Contains(type.TypeDefinition)).Select(x => (x.TypeDefinition.ToString(), x.Color.ToXna()));
                content.Add(new TypeInfoText(textureHelper.DefaultFont, "Weak to: ", weakTo.ToList()));
                content.Add(new TypeInfoText(textureHelper.DefaultFont, "Resistant to: ", resistantTo.ToList()));

                if (immuneTo.Any())
                {
                    content.Add(new TypeInfoText(textureHelper.DefaultFont, "Immune to: ", immuneTo.ToList()));
                }
            }

            gameScreen.ShowDialog(content, true);
        }

        private class TypeInfoText(SpriteFontReference font, string title, List<(string text, Microsoft.Xna.Framework.Color color)> texts) 
            : DrawableGameObject(Vector2.Zero, null, Vector2.Zero, 501)
        {
            public override bool HasStaticPosition => true;

            public override Vector2 Size => new(
                font.Value.MeasureString(title).X * Utils.FontScale + texts.Sum(x => font.Value.MeasureString(x.text + ", ").X * Utils.FontScale + Utils.DefaultSize.X * 0.33f),
                50);

            public override void Draw(SpriteBatch spriteBatch)
            {
                var titleWidth = font.Value.MeasureString(title) * Utils.FontScale;
                spriteBatch.DrawString(
                    font.Value,
                    title,
                    Position,
                    Microsoft.Xna.Framework.Color.Black,
                    0f,
                    Vector2.Zero,
                    Utils.FontScale,
                    SpriteEffects.None,
                    0f);
                var offset = new Vector2(titleWidth.X, 0);
                for (var i = 0; i < texts.Count; i++)
                {
                    if (i > 0)
                    {
                        spriteBatch.DrawString(
                            font.Value,
                            ", ",
                            Position + offset,
                            Microsoft.Xna.Framework.Color.Black,
                            0f,
                            Vector2.Zero,
                            Utils.FontScale,
                            SpriteEffects.None,
                            0f);
                        offset.X += font.Value.MeasureString(", ").X * Utils.FontScale;
                    }

                    var text = texts[i].text;
                    spriteBatch.DrawString(
                        font.Value,
                        text,
                        Position + offset,
                        texts[i].color,
                        0f,
                        Vector2.Zero,
                        Utils.FontScale,
                        SpriteEffects.None,
                        0f);
                    offset.X += font.Value.MeasureString(text).X * Utils.FontScale;
                }
            }
        }
    }
}
