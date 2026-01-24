using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Charizard(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Charizard, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
