using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Wobbuffet(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Wobbuffet, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
