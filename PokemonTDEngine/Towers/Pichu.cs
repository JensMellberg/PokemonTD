using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Pichu(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Pichu, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Pikachu;
    }
}
