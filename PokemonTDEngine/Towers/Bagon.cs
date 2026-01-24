using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Bagon(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Bagon, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Shelgon;
    }
}
