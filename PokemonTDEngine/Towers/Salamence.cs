using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Salamence(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Salamence, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
