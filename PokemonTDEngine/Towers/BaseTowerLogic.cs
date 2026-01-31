using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public abstract class BaseTowerLogic(Vector2 position, TowerStats stats, GameEngine gameEngine) : GameObject(position, Utils.DefaultSize)
    {
        public TowerStats Stats { get; private set; } = stats;

        public GameEngine GameEngine = gameEngine;

        protected float Range => Utils.AdjustForScreen(Stats.Range);

        public override bool HasStaticPosition => false;

        public int TotalCost = stats.Cost;

        private int attackCooldown;

        public void OnLevelStarted()
        {
            if (wasRecentlyBuild)
            {
                wasRecentlyBuild = false;
            }
        }

        private bool wasRecentlyBuild = true;

        public abstract TowerStats UpgradeInfo { get; }

        public override void Update()
        {
            if (attackCooldown > 0)
            {
                attackCooldown--;
            }
            else
            {
                TryAttack();
            }
        }

        protected virtual void TryAttack()
        {
            var target = ((IEnumerable<EnemyLogic>)[GameEngine.CurrentFocus])
                .Concat(GameEngine.GameObjects.OfType<EnemyLogic>())
                .FirstOrDefault(x => IsInRange(x) && x.ExpectedHp > 0);
            if (target != null && Stats.Type.CanAttack(target.Template.Type))
            {
                AttackEnemy(target);
            }
        }

        protected void AttackEnemy(EnemyLogic enemy)
        {
            attackCooldown = Stats.Cooldown;
            var damage = CalculateDamage(enemy);
            var projectile = CreateProjectile(enemy, damage);
            GameEngine.AddProjectile(projectile, this);
            enemy.ExpectedHp -= damage;
        }

        protected virtual BaseProjectile CreateProjectile(EnemyLogic target, int damage) =>
            new(Center, target, this, damage);

        protected bool IsInRange(EnemyLogic enemy) => enemy != null && Utils.DistanceBetween(Position, enemy.Position) <= Range + Utils.EPSILON;

        protected int CalculateDamage(EnemyLogic enemy) => (int)Math.Floor(Stats.Damage * Stats.Type.GetMultiplier(enemy.Template.Type));

        public void Sell()
        {
            GameEngine.GoldHandler.Add(SellPrice);
            GameEngine.OnGoldEarned(Position, SellPrice);
            ShouldDispose = true;
        }

        public int SellPrice => wasRecentlyBuild ? TotalCost : TotalCost / 2;

        public BaseTowerLogic? TryUpgrade()
        {
            if (!CanUpgrade)
            {
                return null;
            }

            ShouldDispose = true;
            GameEngine.GoldHandler.Reduce(UpgradeInfo.Cost);
            var newTower = TowerLogicFactory.CreateTower(UpgradeInfo.Id, GameEngine, Position);
            newTower.TotalCost += TotalCost;
            GameEngine.GameObjects.Add(newTower);
            return newTower;
        }

        public bool CanUpgrade => GameEngine.GoldHandler.Gold >= UpgradeInfo?.Cost;
    }
}
