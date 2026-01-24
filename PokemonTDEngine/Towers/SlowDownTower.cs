using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public abstract class SlowDownTower(Vector2 position, TowerStats towerStats, GameEngine gameEngine, int slowDuration)
        : BaseTowerLogic(position, towerStats, gameEngine)
    {
        protected override BaseProjectile CreateProjectile(EnemyLogic target, int damage) =>
            new SlowingProjectile(Center, target, this, damage, slowDuration);
    }
}
