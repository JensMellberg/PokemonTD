using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Weezing(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Weezing, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
