using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Pidgeot(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Pidgeot, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
