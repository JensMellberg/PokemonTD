using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Gyarados(Vector2 position, GameEngine gameEngine)
        : SlowDownTower(position, TowerStats.Gyarados, gameEngine, 300)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
