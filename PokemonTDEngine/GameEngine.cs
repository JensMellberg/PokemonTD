using System.Numerics;
using PokemonTDEngine.Towers;

namespace PokemonTDEngine
{
    public enum Difficulty
    {
        Normal,
        Hard,
        Extreme
    }

    public record GameResult(int LevelCompleted, long DamageTestResult, Difficulty Difficulty, bool IsWin);

    public class GameEngine
    {
        public GoldHandler GoldHandler;

        public GameObjects GameObjects;

        public LevelHandler LevelHandler;

        public LifeHandler LifeHandler;

        public EnemyLogic? CurrentFocus;

        public Difficulty Difficulty;

        public int CurrentTicks;

        public double GameSpeed = 1;

        private bool SkippedLastUpdate;

        private TileHandler tileHandler;

        private Action<GameResult> onGameFinished;

        private long nextId;

        public GameEngine(Action<GameResult> onGameFinished, Difficulty difficulty, GameObjects gameObjects, GoldHandler goldHandler, TileHandler tileHandler, LevelHandler levelHandler)
        {
            Difficulty = difficulty;
            GameObjects = gameObjects;
            GoldHandler = goldHandler;
            LevelHandler = levelHandler;
            this.onGameFinished = onGameFinished;
            this.tileHandler = tileHandler;
            LifeHandler = new(LoseGame);
        }

        public long GetNextId() => nextId++;

        public void Update()
        {
            if (GameSpeed == 0.5 && !SkippedLastUpdate)
            {
                SkippedLastUpdate = true;
                return;
            }

            for (var i = 0; i < GameSpeed; i++)
            {
                var increaseTicks = LevelHandler.IsLevelOnGoing;
                GameObjects.Update();
                LevelHandler.Update();

                if (increaseTicks)
                {
                    CurrentTicks++;
                }
            }
            
            SkippedLastUpdate = false;
        }

        public bool[,] GetPathMatrix(int freeTileType = TileHandler.GrassTileType)
        {
            var baseMatrix = tileHandler.GetBasePathmatrix(freeTileType);
            foreach (var tower in GameObjects.OfType<BaseTowerLogic>().Where(x => !x.ShouldDispose))
            {
                var tile = TranslateToTile(tower.Position);
                baseMatrix[(int)tile.Y, (int)tile.X] = false;
            }

            return baseMatrix;
        }

        public static Vector2 TranslateToTile(Vector2 position)
        {
            position.X = (int)position.X;
            while (position.X % Utils.DefaultSize.X != 0)
            {
                position.X--;
            }

            position.Y = (int)position.Y;
            while (position.Y % Utils.DefaultSize.Y != 0)
            {
                position.Y--;
            }

            return new Vector2(position.X / Utils.DefaultSize.X, position.Y / Utils.DefaultSize.Y);
        }

        public static Vector2 TranslateFromTile(Vector2 tile) => tile * Utils.DefaultSize;

        public bool IsFreeTile(Vector2 tile, int freeTileType)
        {
            var pathMatrix = GetPathMatrix(freeTileType);
            if (tile.X < 0 || tile.Y < 0 || tile.X >= pathMatrix.GetLength(1) || tile.Y >= pathMatrix.GetLength(0))
            {
                return false;
            }

            return pathMatrix[(int)tile.Y, (int)tile.X];
        }

        public BaseTowerLogic? TryPlaceTower(string towerId, Vector2 tile)
        {
            var tower = TowerLogicFactory.CreateTower(towerId, this, TranslateFromTile(tile));
            if (!IsFreeTile(tile, tower.Stats.BuildableTileType) || !GoldHandler.CanAfford(tower.Stats.Cost) || LevelHandler.IsLevelOnGoing)
            {
                return null;
            }

            GameObjects.Add(tower);
            GoldHandler.Reduce(tower.Stats.Cost);
            return tower;
        }

        public void FocusEnemy(long id) => FocusEnemy(GameObjects.OfType<EnemyLogic>().Single(x => x.ID == id));

        public void FocusEnemy(EnemyLogic enemy)
        {
            CurrentFocus = enemy;
        }

        public void AddProjectile(BaseProjectile projectile, BaseTowerLogic owner)
        {
            GameObjects.Add(projectile);
            OnProjectileAdded(projectile, owner.Stats.Id);
        }

        public void OnGameWon(long damageTestResult)
        {
            onGameFinished(new GameResult(LevelHandler.CurrentLevel - 1, damageTestResult, Difficulty, true));
        }

        private void LoseGame()
        {
            onGameFinished(new GameResult(LevelHandler.CurrentLevel - 1, 0, Difficulty, false));
        }

        public Action<BaseProjectile, string> OnProjectileAdded = (_, _) => { };
        public Action<EnemyLogic> OnEnemySpawned = _ => { };
        public Action<Vector2, int> OnGoldEarned = (_, _) => { };
    }
}
