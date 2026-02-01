using System.Numerics;
using System.Security.Cryptography.X509Certificates;
using PokemonTDEngine.Towers;

namespace PokemonTDEngine.Tests;

public class SimulatorTests
{
    [Fact]
    public void ProjectilesTakesTheSameAmountOfTravelTimeRegardlessOfSize()
    {
        Utils.SizeMultiplier = 1f;
        Utils.DefaultSize = new(50, 50);
        var engine = SetupEngine(Difficulty.Normal);
        var projectileTicks = new List<int>();
        engine.GameObjects.Add(new FakeTower(new(4, 2), engine, projectileTicks));
        engine.GameObjects.Add(new FakeTower(new(3, 3), engine, projectileTicks));
        engine.GameObjects.Add(new FakeTower(new(2, 4), engine, projectileTicks));
        engine.GameObjects.Add(new FakeTower(new(1, 6), engine, projectileTicks));
        engine.GameObjects.Add(new FakeTower(new(2, 6), engine, projectileTicks));
        RunUntilNextLevel(engine);

        Utils.SizeMultiplier = 2.5f;
        Utils.DefaultSize = new(125, 125);
        var engine2 = SetupEngine(Difficulty.Normal);
        var projectileTicks2 = new List<int>();
        engine2.GameObjects.Add(new FakeTower(new(4, 2), engine2, projectileTicks2));
        engine2.GameObjects.Add(new FakeTower(new(3, 3), engine2, projectileTicks2));
        engine2.GameObjects.Add(new FakeTower(new(2, 4), engine2, projectileTicks2));
        engine2.GameObjects.Add(new FakeTower(new(1, 6), engine2, projectileTicks2));
        engine2.GameObjects.Add(new FakeTower(new(2, 6), engine2, projectileTicks2));
        RunUntilNextLevel(engine2);

        Assert.Equal(projectileTicks.Count, projectileTicks2.Count);
        for (var i = 0; i < projectileTicks2.Count; i++)
        {
            Assert.Equal(projectileTicks[i], projectileTicks2[i]);
        }
    }

    [Fact]
    public void LevelTakesSameAmountOfTicksRegardlessOfSize()
    {
        Utils.SizeMultiplier = 1f;
        Utils.DefaultSize = new(50, 50);
        var engine = SetupEngine(Difficulty.Normal);
        RunUntilNextLevel(engine);

        Utils.SizeMultiplier = 2.5f;
        Utils.DefaultSize = new(125, 125);
        var engine2 = SetupEngine(Difficulty.Normal);
        RunUntilNextLevel(engine2);

        Assert.Equal(engine.CurrentTicks, engine2.CurrentTicks);
    }

    [Fact]
    public void LevelTakesSameAmountOfTicksRegardlessOfSizeWithNoShootTowers()
    {
        Utils.SizeMultiplier = 1f;
        Utils.DefaultSize = new(50, 50);
        var engine = SetupEngine(Difficulty.Normal);
        engine.GameObjects.Add(new FakeTower(new(4, 2), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(3, 3), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(2, 4), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(1, 6), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(2, 6), engine, [], true));
        RunUntilNextLevel(engine);

        Utils.SizeMultiplier = 2.5f;
        Utils.DefaultSize = new(125, 125);
        var engine2 = SetupEngine(Difficulty.Normal);
        engine2.GameObjects.Add(new FakeTower(new(4, 2), engine2, [], true));
        engine2.GameObjects.Add(new FakeTower(new(3, 3), engine2, [], true));
        engine2.GameObjects.Add(new FakeTower(new(2, 4), engine2, [], true));
        engine2.GameObjects.Add(new FakeTower(new(1, 6), engine2, [], true));
        engine2.GameObjects.Add(new FakeTower(new(2, 6), engine2, [], true));
        RunUntilNextLevel(engine2);

        Assert.Equal(engine.CurrentTicks, engine2.CurrentTicks);
    }

    [Fact]
    public void TowersShootTheSameAmountOfProjectilesRegardlessOfSize()
    {
        Utils.SizeMultiplier = 1f;
        Utils.DefaultSize = new(50, 50);
        var engine = SetupEngine(Difficulty.Normal);
        engine.GameObjects.Add(new FakeTower(new(4, 2), engine, []));
        engine.GameObjects.Add(new FakeTower(new(3, 3), engine, []));
        engine.GameObjects.Add(new FakeTower(new(2, 4), engine, []));
        engine.GameObjects.Add(new FakeTower(new(1, 6), engine, []));
        engine.GameObjects.Add(new FakeTower(new(2, 6), engine, []));
        RunUntilNextLevel(engine);
        var shotsPerTower = engine.GameObjects.OfType<FakeTower>().Select(x => x.TimesShot).ToList();

        Utils.SizeMultiplier = 2.5f;
        Utils.DefaultSize = new(125, 125);
        var engine2 = SetupEngine(Difficulty.Normal);
        engine2.GameObjects.Add(new FakeTower(new(4, 2), engine2, []));
        engine2.GameObjects.Add(new FakeTower(new(3, 3), engine2, []));
        engine2.GameObjects.Add(new FakeTower(new(2, 4), engine2, []));
        engine2.GameObjects.Add(new FakeTower(new(1, 6), engine2, []));
        engine2.GameObjects.Add(new FakeTower(new(2, 6), engine2, []));
        RunUntilNextLevel(engine2);
        var shotsPerTower2 = engine2.GameObjects.OfType<FakeTower>().Select(x => x.TimesShot).ToList();

        for (var i = 0; i < shotsPerTower2.Count; i++)
        {
            Assert.Equal(shotsPerTower[i], shotsPerTower2[i]);
        }
    }

    [Fact]
    public void LevelTakesSameAmountOfTicksRegardlessOfSizeWithTower()
    {
        Utils.SizeMultiplier = 1f;
        Utils.DefaultSize = new(50, 50);
        var engine = SetupEngine(Difficulty.Normal);
        engine.TryPlaceTower(TowerId.Charmander, new(4, 2));
        engine.TryPlaceTower(TowerId.Charmander, new(3, 3));
        engine.TryPlaceTower(TowerId.Charmander, new(2, 4));
        engine.TryPlaceTower(TowerId.Charmander, new(1, 6));
        engine.TryPlaceTower(TowerId.Charmander, new(2, 6));
        RunUntilNextLevel(engine);

        Utils.SizeMultiplier = 2.5f;
        Utils.DefaultSize = new(125, 125);
        var engine2 = SetupEngine(Difficulty.Normal);
        engine2.TryPlaceTower(TowerId.Charmander, new(4, 2));
        engine2.TryPlaceTower(TowerId.Charmander, new(3, 3));
        engine2.TryPlaceTower(TowerId.Charmander, new(2, 4));
        engine2.TryPlaceTower(TowerId.Charmander, new(1, 6));
        engine2.TryPlaceTower(TowerId.Charmander, new(2, 6));
        RunUntilNextLevel(engine2);

        Assert.Equal(engine.CurrentTicks, engine2.CurrentTicks);
    }

    [Theory]
    [InlineData("WinEvents.txt")]
    [InlineData("WinEvents2.txt")]
    public void SimulatorGetsSameResultForDifferentSizes(string fileName)
    {
        var fileLines = File.ReadAllText(System.IO.Path.Combine(AppContext.BaseDirectory, "TestData", fileName)).Split('\n', StringSplitOptions.RemoveEmptyEntries);
        var isWin = fileLines[0][0] == 'W';
        var difficulty = fileLines[0][1] switch
        {
            'N' => Difficulty.Normal,
            'H' => Difficulty.Hard,
            'E' => Difficulty.Extreme,
            _ => throw new NotImplementedException(),
        };
        var result = long.Parse(fileLines[0][2..]);

        var events = EventTracker.DeserializeEvents(fileLines.Skip(1));
        var simulator = new GameSimulator(events, difficulty);
        simulator.SimulateGame();

        Utils.DefaultSize = new(125, 125);
        Utils.SizeMultiplier = 2.5f;
        var simulator2 = new GameSimulator(events, difficulty);
        simulator2.SimulateGame();

        Assert.NotNull(simulator.Result);
        Assert.NotNull(simulator2.Result);
        Assert.Equal(simulator.Result.LevelCompleted, simulator2.Result.LevelCompleted);
        Assert.Equal(simulator.Result.DamageTestResult, simulator2.Result.DamageTestResult);
        if (isWin)
        {
            Assert.Equal(result, simulator.Result.DamageTestResult);
        } else
        {
            Assert.Equal(result, simulator.Result.LevelCompleted);
        }
    }

    [Fact]
    public void SerializeAndDeserializes()
    {
        var events = new List<Event>
        {
            new FocusEnemyEvent { LevelAtEvent = 1, TickAtEvent = 2, EnemyId = 3 },
            new TowerBuildEvent { LevelAtEvent = 1, TickAtEvent = 2, Tile = new(5, 7), TowerId = TowerId.Articuno },
            new TowerUpgradeEvent { LevelAtEvent = 1, TickAtEvent = 2, Tile = new(5, 7) },
            new TowerSellEvent { LevelAtEvent = 1, TickAtEvent = 2, Tile = new(5, 7) }
        };

        var deserializedEvents = EventTracker.DeserializeEvents(EventTracker.SerializeEvents(events));
        Assert.Equal(events.Count, deserializedEvents.Count);
        for (var i = 0; i < deserializedEvents.Count; i++)
        {
            Assert.Equivalent(deserializedEvents[i], events[i]);
        }
    }

    [Fact]
    public void UpgradesAreAlwaysBetterThanOriginal()
    {
        Utils.SizeMultiplier = 1f;
        Utils.DefaultSize = new(50, 50);

        ImpersonatedTower? currentTower = null;
        var results = new Dictionary<string, (double, int)>();
        double lastAddedDamage = 0;
        var engine = SetupEngine(Difficulty.Normal, score =>
        {
            lastAddedDamage = Math.Round((double)score.DamageTestResult / currentTower.TotalCost, 3);
            results.Add(currentTower.Stats.Name, 
                (lastAddedDamage, currentTower.TotalCost));
        });

        currentTower = new ImpersonatedTower(new(8, 6), engine, TowerStats.Charmander);
        engine.GameObjects.Add(new FakeTower(new(4, 2), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(5, 3), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(6, 4), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(7, 5), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(5, 6), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(6, 7), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(7, 8), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(8, 8), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(9, 8), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(10, 7), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(10, 6), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(10, 5), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(9, 4), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(8, 3), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(7, 2), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(11, 7), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(12, 8), engine, [], true));
        engine.GameObjects.Add(new FakeTower(new(13, 9), engine, [], true));

        TowerStats[] statsToTry = [TowerStats.Charmander, TowerStats.Pichu, TowerStats.Pidgey,
            TowerStats.Onix, TowerStats.Poochyena, TowerStats.Bagon,
            TowerStats.Gastly, TowerStats.Koffing, TowerStats.Makuhita,
            TowerStats.Magikarp, TowerStats.Articuno, TowerStats.Groudon,
            TowerStats.Scyther, TowerStats.Wobbuffet];
        foreach (var stat in statsToTry)
        {
            AddResultFor(new ImpersonatedTower(new(8, 6), engine, stat), 0);
        }

        var ordered = results.OrderBy(x => x.Value.Item1).Select(x => (x.Key, x.Value.Item1, x.Value.Item2)).ToList();
        foreach (var dps in ordered)
        {
            Assert.True(dps.Item2 < 3);
        }

        void AddResultFor(ImpersonatedTower tower, double previousDps)
        {
            currentTower = tower;
            engine.LevelHandler.CurrentLevel = 50;
            engine.GameObjects.Add(tower);
            RunUntilNextLevel(engine);
            Assert.True(lastAddedDamage > previousDps,
                $"Expected {tower.Stats.Id} to have more dps than {previousDps} but had {lastAddedDamage}.");
            var upgradeInfo = TowerLogicFactory.CreateTower(tower.Stats.Id, engine, Vector2.Zero).UpgradeInfo;
            if (upgradeInfo != null)
            {
                var nextTower = new ImpersonatedTower(new(8, 6), engine, upgradeInfo);
                nextTower.TotalCost += currentTower.TotalCost;
                tower.ShouldDispose = true;
                engine.GameObjects.Update(); 
                AddResultFor(nextTower, lastAddedDamage);
                return;
            }

            currentTower.ShouldDispose = true;
            engine.GameObjects.Update();
        }
    }

    private GameEngine SetupEngine(Difficulty difficulty) => SetupEngine(difficulty, _ => { });

    private GameEngine SetupEngine(Difficulty difficulty, Action<GameResult> onGameWon)
    {
        GameObjects gameObjects = [];
        var levelHandler = new LevelHandler(gameObjects, difficulty);
        var gameEngine = new GameEngine(onGameWon, difficulty, gameObjects, new GoldHandler(difficulty), new TileHandler(), levelHandler);
        levelHandler.GameEngine = gameEngine;
        levelHandler.SetupLevels();
        return gameEngine;
    }

    private void RunUntilNextLevel(GameEngine gameEngine)
    {
        gameEngine.LevelHandler.StartNextLevel();
        while (gameEngine.LevelHandler.IsLevelOnGoing)
        {
            gameEngine.Update();
        }
    }

    private class ImpersonatedTower(Vector2 position, GameEngine gameEngine, TowerStats stats) : BaseTowerLogic(GameEngine.TranslateFromTile(position), stats, gameEngine)
    {
        public override TowerStats UpgradeInfo => throw new NotImplementedException();
    }

    private class FakeTower(Vector2 position, GameEngine gameEngine, List<int> shotTicks, bool dontShoot = false) : Charmander(GameEngine.TranslateFromTile(position), gameEngine)
    {
        public int TimesShot { get; private set; }

        protected override BaseProjectile CreateProjectile(EnemyLogic target, int damage)
        {
            TimesShot++;
            return new FakeProjectile(Center, target, this, damage, shotTicks);
        }

        protected override void TryAttack()
        {
            if (!dontShoot)
            {
                base.TryAttack();
            }
        }
    }

    private class FakeProjectile(Vector2 position, EnemyLogic target, BaseTowerLogic tower, int damage, List<int> shotTicks) : BaseProjectile(position, target, tower, damage)
    {
        public int TicksUntilHit { get; private set; }

        public override void Update()
        {
            if (!ShouldDispose)
            {
                TicksUntilHit++;
                base.Update();

                if (ShouldDispose)
                {
                    shotTicks.Add(TicksUntilHit);
                }
            }
        }
    }
}
