using System.Numerics;

namespace PokemonTDEngine
{
    public class DamageTestLogic(EnemyTemplate template, Vector2 position, Path path, GameEngine gameEngine)
        : EnemyLogic(template, position, path, gameEngine)
    {
        private int totalDamage;

        public override void Damage(int damage)
        {
            totalDamage += damage;
        }

        protected override void OnGoalReached()
        {
            GameEngine.OnGameWon(totalDamage);
        }
    }
}
