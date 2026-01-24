using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Hariyama(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Hariyama, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
