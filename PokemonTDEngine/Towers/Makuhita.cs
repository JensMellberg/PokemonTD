using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Makuhita(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Makuhita, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Hariyama;
    }
}
