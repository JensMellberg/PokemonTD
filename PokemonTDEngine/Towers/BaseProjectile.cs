using System;
using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public class BaseProjectile(Vector2 position, EnemyLogic target, BaseTowerLogic tower, int damage, int speed = 3)
        : GameObject(position, Utils.DefaultSize, 3)
    {
        public override bool HasStaticPosition => false;

        public float rotation;

        private int Speed => Utils.AdjustForScreen(speed);

        public override void Update()
        {
            if (target.ShouldDispose)
            {
                ShouldDispose = true;
                return;
            }

            var targetCenter = target.Center;
            var distance = Vector2.Normalize(targetCenter - Position);
            rotation = (float)Math.Atan2(distance.Y, distance.X) - (float)Math.PI / 2;
            Position += distance * Speed;
            if (Utils.DistanceBetween(targetCenter, Position) < Speed)
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
