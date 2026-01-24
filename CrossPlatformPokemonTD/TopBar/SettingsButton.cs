using System.Collections.Generic;
using System.Numerics;
using PokemonTDCore.InformationSquare;
using PokemonTDEngine;

namespace PokemonTDCore.TopBar
{
    public class SettingsButton(TextureHelper textureHelper, Vector2 position, GameEngine gameEngine)
        : PureClickObject(position, textureHelper.SettingsButton, null, Utils.DefaultSize, 2), IInformationSource
    {
        public override bool HasStaticPosition => true;

        public IInformationSource RedirectToSource => null;

        public bool IsCurrentlyInformationSource { get; set; }

        private SquareItemText livesLeft;
        private SquareItemText currentLevel;

        private string LivesLeftText => $"Lives left: {gameEngine.LifeHandler.LivesLeft}";
        private string CurrentLevelText => $"Current level: {gameEngine.LevelHandler.CurrentLevel}";

        public override void Update()
        {
            if (IsCurrentlyInformationSource)
            {
                livesLeft.Text = LivesLeftText;
                currentLevel.Text = CurrentLevelText;
            }
        }

        protected override void OnPressRelease(Vector2 position)
        {
        }

        public List<DrawableGameObject> CreateItems()
        {
            livesLeft = new SquareItemText(textureHelper.DefaultFont, LivesLeftText, Microsoft.Xna.Framework.Color.Purple);
            currentLevel = new SquareItemText(textureHelper.DefaultFont, CurrentLevelText, Microsoft.Xna.Framework.Color.Pink);
            return [
                currentLevel,
                livesLeft,
                new SpeedChanger(textureHelper, gameEngine)
            ];
        }
    }
}
