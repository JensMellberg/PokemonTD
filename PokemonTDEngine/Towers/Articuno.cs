using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Articuno(Vector2 position, GameEngine gameEngine)
        : SlowDownTower(position, TowerStats.Articuno, gameEngine, 300)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
