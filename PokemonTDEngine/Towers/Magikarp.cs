using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Magikarp(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Magikarp, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Gyarados;
    }
}
