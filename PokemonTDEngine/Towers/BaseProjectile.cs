using System;
using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class BaseProjectile(Vector2 position, EnemyLogic target, BaseTowerLogic tower, int damage, float speed = 3)
        : GameObject(position, Utils.DefaultSize, 3)
    {
        public override bool HasStaticPosition => false;

        public float rotation;

        private float Speed => Utils.AdjustForScreen(speed);

        public override void Update()
        {
            if (target.ShouldDispose)
            {
                ShouldDispose = true;
                return;
            }

            var targetCenter = target.Center; // Position + DefaultSize / 2.
            var direction = Vector2.Normalize(targetCenter - Position);
            rotation = (float)Math.Atan2(direction.Y, direction.X) - (float)Math.PI / 2;
            Position += direction * Speed; // Speed is adjusted for game size
            if ((targetCenter - Position).Length() < Speed)
            {
                HitTarget(target);
            }
        }

        protected virtual void HitTarget(EnemyLogic target)
        {
            target.Damage(damage);
            ShouldDispose = true;
        }
    }
}
