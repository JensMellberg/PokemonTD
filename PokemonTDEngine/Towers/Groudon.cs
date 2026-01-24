using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Groudon(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Groudon, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
