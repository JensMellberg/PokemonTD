using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Pidgey(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Pidgey, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Pidgeotto;
    }
}
