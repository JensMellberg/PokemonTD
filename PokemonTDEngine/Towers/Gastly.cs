using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Gastly(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Gastly, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Haunter;
    }
}
