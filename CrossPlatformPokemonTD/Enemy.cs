using System.Collections.Generic;
using System.Numerics;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDCore.InformationSquare;
using PokemonTDEngine;
using Color = Microsoft.Xna.Framework.Color;
using Rectangle = Microsoft.Xna.Framework.Rectangle;

namespace PokemonTDCore
{
    public record EnemyTextures(Texture2D HealthBar, Texture2D HitPoints, Texture2D CrossHair)
    {
        public int HealthBarWidth => HealthBar?.Width ?? 1;
        public int HealthBarHeight => HealthBar?.Height ?? 1;
        public int HitPointsWidth => HitPoints?.Width ?? 1;
        public int HitPointsHeight => HitPoints?.Height ?? 1;
    }

    public class Enemy(TextureHelper textureHelper, EnemyTextures textures, Texture2D texture, EnemyLogic logic, GameEngine gameEngine, GamePlayScreen gamePlayScreen)
        : EncapsulatingClickObject(new TextureReference { Value = texture }, null, logic), IInformationSource
    {
        private Color hpColor;

        private Rectangle HitPointsRectangle;

        private Rectangle HealthBarRectangle;

        protected override Color Color => logic.IsSlowedDown ? Color.LightBlue : base.Color;
        public IInformationSource RedirectToSource => null;
        public bool IsCurrentlyInformationSource { get; set; }

        private SquareItemText hitPointText;

        protected override void OnPressRelease(Vector2 position)
        {
            if (!IsCurrentlyInformationSource)
            {
                gameEngine.FocusEnemy(logic);
                EventTracker.FocusEnemy(logic, gameEngine);
            }
        }

        public void UpdateHealthBar()
        {
            var hpLeftRatio = (double)logic.CurrentHp / logic.Template.HitPoints;
            HealthBarRectangle = new Rectangle((int)Position.X, (int)(Position.Y - Utils.DefaultSize.Y / 10),
                (int)(textures.HealthBarWidth * Utils.SizeMultiplier), (int)(textures.HealthBarHeight * Utils.SizeMultiplier));
            HitPointsRectangle = new Rectangle((int)(Position.X + Utils.SizeMultiplier), (int)(Position.Y - Utils.DefaultSize.Y / 10 + Utils.SizeMultiplier),
                (int)(hpLeftRatio * (textures.HitPointsWidth * Utils.SizeMultiplier)),
                (int)(textures.HitPointsHeight * Utils.SizeMultiplier));
            hpColor = hpLeftRatio < 0.5 ? Color.Red : Color.Lime;
        }

        public override void Update()
        {
            UpdateHealthBar();
            if (IsCurrentlyInformationSource && hitPointText != null)
            {
                hitPointText.Text = HitPointText;
            }
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            spriteBatch.Draw(textures.HealthBar, HealthBarRectangle, Color.White);
            spriteBatch.Draw(textures.HitPoints, HitPointsRectangle, hpColor);
            if (IsCurrentlyInformationSource)
            {
                spriteBatch.Draw(textures.CrossHair, GetSourceRectangle.ToXna(), Color.White);
            }
        }

        public List<DrawableGameObject> CreateItems()
        {
            hitPointText = new SquareItemText(textureHelper.DefaultFont, HitPointText, Color.Black);
            return [
                new SquareItemText(textureHelper.DefaultFont, logic.Template.Name, Color.Black),
                new TypeText(logic.Template.Type, textureHelper, gamePlayScreen, false),
                hitPointText
            ];
        }

        private string HitPointText => $"{logic.CurrentHp}/{logic.Template.HitPoints}";
    }
}
