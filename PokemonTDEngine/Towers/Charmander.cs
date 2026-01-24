using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Charmander(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Charmander, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Charmeleon;
    }
}
