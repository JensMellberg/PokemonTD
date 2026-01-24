using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Scyther(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Scyther, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Scizor;
    }
}
