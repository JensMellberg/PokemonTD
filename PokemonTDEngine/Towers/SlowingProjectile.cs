using System.Numerics;
namespace PokemonTDEngine.Towers
{
    public class SlowingProjectile(Vector2 position, EnemyLogic target, BaseTowerLogic tower, int damage, int slowDuration)
        : BaseProjectile(position, target, tower, damage)
    {
        protected override void HitTarget(EnemyLogic target)
        {
            target.SlowDown(slowDuration);
            base.HitTarget(target);
        }
    }
}
