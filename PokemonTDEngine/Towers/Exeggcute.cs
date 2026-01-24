using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Exeggcute(Vector2 position, GameEngine gameEngine)
        : MultipleTargetTowerLogic(position, TowerStats.Exeggcute, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Exeggutor;
    }
}