using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Onix(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Onix, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Steelix;
    }
}
