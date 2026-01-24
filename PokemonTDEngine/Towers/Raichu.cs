using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Raichu(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Raichu, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
