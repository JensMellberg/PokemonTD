using System.Numerics;
using PokemonTDEngine;

namespace PokemonTDCore.TopBar
{
    public class SpeedChanger
        : PureClickObject
    {
        private TextureHelper textureHelper;
        private GameEngine gameEngine;
        public SpeedChanger(TextureHelper textureHelper, GameEngine gameEngine)
            : base(Vector2.Zero, textureHelper.Speed1x, null, new Vector2(250 * Utils.SizeMultiplier - Utils.DefaultSize.X * 0.4f, Utils.DefaultSize.Y), 101)
        {
            CurrentTextureReference = gameEngine.GameSpeed switch
            {
                0.5 => textureHelper.Speed05x,
                2 => textureHelper.Speed2x,
                _ => textureHelper.Speed1x,
            };
            this.textureHelper = textureHelper;
            this.gameEngine = gameEngine;
        }

        public override bool HasStaticPosition => true;

        protected override void OnPressRelease(Vector2 position)
        {
            if (position.X < Position.X + Size.X / 3)
            {
                CurrentTextureReference = textureHelper.Speed05x;
                gameEngine.GameSpeed = 0.5;
            }
            else if (position.X > Position.X + Size.X * 0.66f)
            {
                CurrentTextureReference = textureHelper.Speed2x;
                gameEngine.GameSpeed = 2;
            }
            else
            {
                CurrentTextureReference = textureHelper.Speed1x;
                gameEngine.GameSpeed = 1;
            }
        }
    }
}
