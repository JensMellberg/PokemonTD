using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Steelix(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Steelix, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
