using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Koffing(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Koffing, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Weezing;
    }
}
