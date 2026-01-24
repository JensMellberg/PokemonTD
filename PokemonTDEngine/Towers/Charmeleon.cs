using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Charmeleon(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Charmeleon, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Charizard;
    }
}
