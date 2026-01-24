using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public abstract class MultipleTargetTowerLogic(Vector2 position, TowerStats stats, GameEngine gameEngine) : BaseTowerLogic(position, stats, gameEngine)
    {
        protected override void TryAttack()
        {
            var targets = GameEngine.GameObjects.OfType<EnemyLogic>().Where(IsInRange).ToList();
            foreach (var target in targets)
            {
                AttackEnemy(target);
            }
        }
    }
}
