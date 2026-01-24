using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Scizor(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Scizor, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
