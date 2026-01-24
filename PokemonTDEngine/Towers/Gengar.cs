using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class Gengar(Vector2 position, GameEngine gameEngine)
        : BaseTowerLogic(position, TowerStats.Gengar, gameEngine)
    {
        public override TowerStats UpgradeInfo => null;
    }
}
