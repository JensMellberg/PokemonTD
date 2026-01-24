using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Poochyena(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Poochyena, gameEngine)
    {
        public override TowerStats UpgradeInfo => TowerStats.Mightyena;
    }
}
