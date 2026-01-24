using System.Numerics;

namespace PokemonTDEngine
{
    public record EnemyTemplate(int HitPoints, string Name, int GoldReward,
        Type Type, float Speed, int LivesTaken);

    public class EnemyLogic(EnemyTemplate template, Vector2 position, Path path, GameEngine gameEngine)
        : GameObject(position, Utils.DefaultSize, 2)
    {
        public override bool HasStaticPosition => false;

        public long ID = gameEngine.GetNextId();

        public EnemyTemplate Template => template;

        public int CurrentHp = template.HitPoints;

        public int ExpectedHp = template.HitPoints;

        public bool IsSlowedDown => slowDownDebuff != null;

        protected GameEngine GameEngine = gameEngine;

        private float Speed => Utils.AdjustForScreen(template.Speed);

        private SlowDownDebuff? slowDownDebuff;

        public virtual void Damage(int damage)
        {
            CurrentHp -= damage;

            if (CurrentHp <= 0)
            {
                Kill();
                GameEngine.GoldHandler.Add(template.GoldReward);
                GameEngine.OnGoldEarned(Position, template.GoldReward);
            }
        }

        public void SlowDown(int duration)
        {
            slowDownDebuff = new SlowDownDebuff(duration);
        }

        private void Kill()
        {
            ShouldDispose = true;
            GameEngine.LevelHandler.TryFinishLevel();
        }

        public override void Update()
        {
            if (slowDownDebuff?.ShouldSkipStep() == true)
            {
                return;
            }

            if (slowDownDebuff?.HasExpired == true)
            {
                slowDownDebuff = null;
            }

            var directionVector = Utils.GetVectorPointingTo(Position, path.NextPoint);
            Position += directionVector * Speed;

            if (path.HasReachedNextPosition(Position, Speed))
            {
                path.UpdatePosition();
            }

            if (path.HasReachedGoal)
            {
                Kill();
                OnGoalReached();
            }
        }

        protected virtual void OnGoalReached()
        {
            GameEngine.LifeHandler.LoseLives(template.LivesTaken);
        }

        private class SlowDownDebuff(int duration)
        {
            private int durationLeft = duration;
            private bool skippedLastStep;

            public bool ShouldSkipStep()
            {
                durationLeft--;
                if (HasExpired)
                {
                    return false;
                }

                if (skippedLastStep)
                {
                    skippedLastStep = false;
                    return false;
                }

                skippedLastStep = true;
                return true;
            }

            public bool HasExpired => durationLeft <= 0;
        }
    }
}
