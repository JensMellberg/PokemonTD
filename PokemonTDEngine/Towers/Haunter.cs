using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Haunter(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Haunter, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Gengar;
    }
}
