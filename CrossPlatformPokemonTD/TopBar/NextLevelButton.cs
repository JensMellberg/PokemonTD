using System.Numerics;
using PokemonTDEngine;
using Color = Microsoft.Xna.Framework.Color;

namespace PokemonTDCore.TopBar
{
    public class NextLevelButton(TextureHelper textureHelper, LevelHandler levelHandler, int height)
        : PureClickObject(new(10, 5), textureHelper.NextLevelButton, null, new Vector2(Utils.DefaultSize.X * 2f, Utils.DefaultSize.Y), 2)
    {
        public override bool HasStaticPosition => true;

        protected override Color Color => levelHandler.IsLevelOnGoing ? Color.Gray : Color.White;

        protected override void OnPressRelease(Vector2 position)
        {
            levelHandler.StartNextLevel();
        }
    }
}
