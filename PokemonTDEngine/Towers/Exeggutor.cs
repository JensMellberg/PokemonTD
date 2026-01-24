using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Exeggutor(Vector2 position, GameEngine gameEngine)
        : MultipleTargetTowerLogic(position, TowerStats.Exeggutor, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}