using System.Numerics;
using PokemonTDEngine.Towers;

namespace PokemonTDEngine
{
    public class LevelHandler(GameObjects gameObjects, Difficulty difficulty)
    {
        public GameEngine GameEngine { get; set; }

        public bool IsLevelOnGoing { get; private set; }

        public int CurrentLevel { get; set; }

        private List<LevelTemplate> levelTemplates = [];

        private LevelTemplate CurrentTemplate => levelTemplates[CurrentLevel - 1];

        public LevelTemplate NextLevelTemplate => CurrentLevel >= levelTemplates.Count ? null : levelTemplates[CurrentLevel];

        private int nextSpawnCountdown = -1;

        private int spawnsLeft = 0;

        private const int SpawnInterval = 80;

        private Path pathToEnd;

        public void StartNextLevel()
        {
            if (IsLevelOnGoing)
            {
                return;
            }

            var path = PathFinder.FindBestPath(GameEngine.GetPathMatrix(), TileHandler.SpawnStart, TileHandler.SpawnEnd, GameEngine.TranslateFromTile);
            if (path == null)
            {
                return;
            }

            GameEngine.CurrentTicks = 0;
            IsLevelOnGoing = true;
            CurrentLevel++;

            spawnsLeft = CurrentTemplate.Count;
            pathToEnd = path;
            foreach (var tower in gameObjects.OfType<BaseTowerLogic>())
            {
                tower.OnLevelStarted();
            }

            SpawnEnemy();
        }

        public void Update()
        {
            if (nextSpawnCountdown > -1)
            {
                nextSpawnCountdown--;
                if (nextSpawnCountdown == 0)
                {
                    SpawnEnemy();
                }
            }
        }

        private void SpawnEnemy()
        {
            EnemyLogic enemy;
            if (CurrentLevel == 51)
            {
                enemy = new DamageTestLogic(CurrentTemplate, GameEngine.TranslateFromTile(TileHandler.SpawnStart), pathToEnd.Copy(), GameEngine);
            }
            else
            {
                enemy = new EnemyLogic(CurrentTemplate, GameEngine.TranslateFromTile(TileHandler.SpawnStart), pathToEnd.Copy(), GameEngine);
            }
            
            gameObjects.Add(enemy);
            GameEngine.OnEnemySpawned(enemy);

            spawnsLeft--;
            if (spawnsLeft != 0)
            {
                nextSpawnCountdown = SpawnInterval;
                levelTemplates[CurrentLevel - 1] = CurrentTemplate.NextEnemy ?? CurrentTemplate;
            }
        }

        public void TryFinishLevel()
        {
            if (spawnsLeft == 0 && !gameObjects.OfType<EnemyLogic>().Where(x => !x.ShouldDispose).Any())
            {
                FinishLevel();
            }
        }

        private void FinishLevel()
        {
            GameEngine.OnGoldEarned(Utils.DefaultSize * 5, CurrentTemplate.CompletionGoldReward);
            GameEngine.GoldHandler.Add(CurrentTemplate.CompletionGoldReward);
            IsLevelOnGoing = false;
        }

        public void SetupLevels()
        {
            levelTemplates = [];
            SetupLevel("Rattata", 15, 15, 2, 25, Type.Normal);
            SetupLevel("Zubat", 25, 15, 3, 40, Type.Flying);
            SetupLevel("Abra", 40, 20, 3, 60, Type.Psychic);
            SetupLevel("Pineco", 60, 15, 4, 85, Type.Bug);
            SetupLevel("Aron", 85, 10, 7, 105, Type.Steel);
            SetupLevel("Nidoran", 125, 15, 5, 130, Type.Poison);
            SetupLevel("Machop", 160, 15, 5, 160, Type.Fighting);
            SetupLevel("Furret", 210, 20, 4, 185, Type.Normal);
            SetupLevel("Gastly", 270, 15, 6, 200, Type.Ghost);
            SetupLevel("Golem", 1650, 1, 100, 200, Type.Rock, 4);
            SetupLevel("Spinda", 400, 15, 7, 245, Type.Normal);
            SetupLevel("Makuhita", 450, 20, 7, 280, Type.Fighting);
            SetupLevel("Trapinch", 580, 15, 8, 320, Type.Ground);
            SetupLevel("Quilava", 680, 15, 8, 355, Type.Fire);
            SetupLevel("Yanma", 830, 10, 13, 370, Type.Bug);
            SetupLevel("Rhyhorn", 990, 15, 9, 400, Type.Rock);
            SetupLevel("Grimer", 1140, 14, 10, 450, Type.Poison);
            SetupLevel("Electrode", 1320, 15, 10, 480, Type.Electric);
            SetupLevel("Seadra", 1480, 14, 11, 520, Type.Water);
            SetupLevel("Snorlax", 7900, 1, 200, 550, Type.Normal, 4);
            SetupLevel("Starmie", 1760, 15, 11, 600, Type.Water);
            SetupLevel("Porygon", 1890, 15, 11, 670, Type.Normal);
            SetupLevel("Omastar", 2200, 15, 12, 700, Type.Water);
            SetupLevel("Manectric", 2420, 15, 13, 740, Type.Electric);
            SetupLevel("Piloswine", 2660, 15, 14, 770, Type.Ice);
            SetupLevel("Cacturne", 2950, 15, 15, 810, Type.Dark);
            SetupLevel("Metang", 3230, 15, 17, 870, Type.Steel);
            SetupLevel("Hitmontop", 3660, 15, 18, 920, Type.Fighting);
            SetupLevel("Absol", 4200, 15, 19, 965, Type.Dark);
            SetupLevel("Dragonite", 22500, 1, 300, 1000, Type.Dragon, 4);
            SetupLevel("Ninetails", 4730, 15, 20, 1020, Type.Fire);
            SetupLevel("Poliwrath", 5200, 15, 22, 1070, Type.Water);
            SetupLevel("Victreebel", 5650, 15, 23, 1100, Type.Grass);
            SetupLevel("Machamp", 6200, 15, 24, 1150, Type.Fighting);
            SetupLevel("Aggron", 8050, 5, 78, 1210, Type.Steel, 2);
            SetupLevel("Houndoom", 7150, 15, 26, 1260, Type.Dark);
            SetupLevel("Solrock", 7800, 15, 28, 1300, Type.Rock);
            SetupLevel("Walrein", 8400, 15, 29, 1350, Type.Water);
            SetupLevel("Nidoking", 9200, 15, 31, 1390, Type.Poison);
            SetupLevel("Regice", 50000, 1, 450, 1450, Type.Ice, 4);
            SetupLevel("Regigigas", 100000, 1, 475, 1470, Type.Normal, 4, 1);
            SetupStarters();
            SetupLevel("Latias", 60000, 1, 500, 1620, Type.Dragon, 4);
            SetupLevel("Latios", 66000, 1, 525, 1650, Type.Dragon, 4);
            SetupLevel("Tyranitar", 33500, 3, 175, 1700, Type.Rock, 3);
            SetupLevel("Entei", 77000, 1, 550, 1720, Type.Fire, 4);
            SetupLevel("Suicune", 84000, 1, 575, 1750, Type.Water, 4);
            SetupLevel("Raikou", 95000, 1, 600, 1800, Type.Electric, 4);
            SetupLevel("Kyogre", 107500, 1, 650, 1850, Type.Water, 4);
            SetupLevel("Mew", 125000, 1, 1000, 3000, Type.Psychic, 5);
            SetupLevel("Damage test", 1000000000, 1, 1337, 3000, Type.None, 0);

            void SetupLevel(string name, int hitPoints, int count, int goldReward, int completionReward, Type type, int livesTaken = 1, int speed = 2)
            {
                levelTemplates.Add(
                    new(AdjustHpToDifficulty(hitPoints),
                        name,
                        count,
                        goldReward,
                        completionReward,
                        type,
                        speed,
                        livesTaken));
            }

            void SetupStarters()
            {
                var hp = AdjustHpToDifficulty(22000);
                var count = 3;
                var goldReward = 160;
                var totalReward = 1550;
                var displayName = "Gen. 2 Starters";
                var part3 = new LevelTemplate(hp, "Feraligatr", count, goldReward, totalReward, Type.Water, 2, 4, null, displayName, Type.Multiple);
                var part2 = new LevelTemplate(hp, "Typhlosion", count, goldReward, totalReward, Type.Fire, 2, 4, part3, displayName, Type.Multiple);
                var part1 = new LevelTemplate(hp, "Meganium", count, goldReward, totalReward, Type.Grass, 2, 4, part2, displayName, Type.Multiple);
                levelTemplates.Add(part1);
            }

            int AdjustHpToDifficulty(int hp)
            {
                if (difficulty == Difficulty.Hard)
                {
                    return (int)Math.Floor(hp * 1.8);
                }
                else if (difficulty == Difficulty.Extreme)
                {
                    return (int)Math.Floor(hp * 2.25);
                }

                return (int)Math.Floor(hp * 1.4);
            }
        }

        public record LevelTemplate(int HitPoints, string Name, int Count, int GoldReward, int CompletionGoldReward,
            Type Type, float Speed, int LivesTaken, LevelTemplate NextEnemy = null, string DisplayName = null, Type DisplayType = null) : EnemyTemplate(HitPoints, Name, GoldReward, Type, Speed, LivesTaken);
    }
}
