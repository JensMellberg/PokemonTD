using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Shelgon(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Shelgon, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Salamence;
    }
}
