using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Pidgeotto(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Pidgeotto, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Pidgeot;
    }
}
