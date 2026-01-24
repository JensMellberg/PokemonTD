using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Pikachu(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Pikachu, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Raichu;
    }
}
