using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Mightyena(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Mightyena, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
