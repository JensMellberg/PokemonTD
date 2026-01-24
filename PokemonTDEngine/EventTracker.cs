using System.Numerics;
using System.Text;

namespace PokemonTDEngine
{
    public static class EventTracker
    {
        public static readonly List<Event> TrackedEvents = [];

        public static string SerializeEvents(List<Event> events)
        {
            var sb = new StringBuilder();
            foreach (var trackedEvent in events)
            {
                sb.AppendLine(trackedEvent.Serialize());
            }

            return sb.ToString();
        }

        public static void Reset()
        {
            TrackedEvents.Clear();
        }

        public static string SerializeTrackedEvents() => SerializeEvents(TrackedEvents);

        public static List<Event> DeserializeEvents(IEnumerable<string> input)
        {
            var result = new List<Event>();
            foreach (var line in input)
            {
                var tokens = line.Replace("\r", "").Split(',');
                var type = tokens[0];
                var level = int.Parse(tokens[1]);
                var tick = long.Parse(tokens[2]);

                if (type == "Focus")
                {
                    result.Add(new FocusEnemyEvent
                    {
                        LevelAtEvent = level,
                        TickAtEvent = tick,
                        EnemyId = long.Parse(tokens[3])
                    });
                }
                else if (type == "Build")
                {
                    result.Add(new TowerBuildEvent
                    {
                        LevelAtEvent = level,
                        TickAtEvent = tick,
                        TowerId = tokens[3],
                        Tile = Event.VectorDeserialize(tokens[4])
                    });
                }
                else if (type == "Upgrade")
                {
                    result.Add(new TowerUpgradeEvent
                    {
                        LevelAtEvent = level,
                        TickAtEvent = tick,
                        Tile = Event.VectorDeserialize(tokens[3])
                    });
                }
                else if (type == "Sell")
                {
                    result.Add(new TowerSellEvent
                    {
                        LevelAtEvent = level,
                        TickAtEvent = tick,
                        Tile = Event.VectorDeserialize(tokens[3])
                    });
                }
            }

            return result;
        }

        public static List<Event> DeserializeEvents(string input) => DeserializeEvents(input.Split('\n', StringSplitOptions.RemoveEmptyEntries));

        public static void BuildTower(string towerId, Vector2 tile, GameEngine gameEngine)
        {
            TrackedEvents.Add(new TowerBuildEvent
            {
                TickAtEvent = gameEngine.CurrentTicks,
                LevelAtEvent = gameEngine.LevelHandler.CurrentLevel,
                TowerId = towerId,
                Tile = tile
            });
        }

        public static void SellTower(Vector2 position, GameEngine gameEngine)
        {
            TrackedEvents.Add(new TowerSellEvent
            {
                TickAtEvent = gameEngine.CurrentTicks,
                LevelAtEvent = gameEngine.LevelHandler.CurrentLevel,
                Tile = GameEngine.TranslateToTile(position)
            });
        }

        public static void UpdateTower(Vector2 position, GameEngine gameEngine)
        {
            TrackedEvents.Add(new TowerUpgradeEvent
            {
                TickAtEvent = gameEngine.CurrentTicks,
                LevelAtEvent = gameEngine.LevelHandler.CurrentLevel,
                Tile = GameEngine.TranslateToTile(position)
            });
        }

        public static void FocusEnemy(EnemyLogic enemy, GameEngine gameEngine)
        {
            TrackedEvents.Add(new FocusEnemyEvent
            {
                TickAtEvent = gameEngine.CurrentTicks,
                LevelAtEvent = gameEngine.LevelHandler.CurrentLevel,
                EnemyId = enemy.ID
            });
        }
    }

    public abstract class Event
    {
        public long TickAtEvent { get; set; }

        public int LevelAtEvent { get; set; }

        public abstract string Type { get; }

        public abstract string Serialize();

        protected string BaseSerialize() => $"{Type},{LevelAtEvent},{TickAtEvent}";

        protected string VectorSerialize(Vector2 vector) => $"({vector.X}:{vector.Y})";

        public static Vector2 VectorDeserialize(string input)
        {
            var tokens = input.Split(':');
            return new Vector2(float.Parse(tokens[0][1..]), float.Parse(tokens[1][..^1]));
        }
    }

    public class FocusEnemyEvent : Event
    {
        public long EnemyId { get; set; }

        public override string Type => "Focus";

        public override string Serialize() => $"{BaseSerialize()},{EnemyId}";
    }

    public class TowerBuildEvent : Event
    {
        public required string TowerId { get; set; }

        public Vector2 Tile { get; set; }

        public override string Type => "Build";

        public override string Serialize() => $"{BaseSerialize()},{TowerId},{VectorSerialize(Tile)}";
    }

    public class TowerSellEvent : Event
    {
        public Vector2 Tile { get; set; }

        public override string Type => "Sell";

        public override string Serialize() => $"{BaseSerialize()},{VectorSerialize(Tile)}";
    }

    public class TowerUpgradeEvent : Event
    {
        public Vector2 Tile { get; set; }

        public override string Type => "Upgrade";

        public override string Serialize() => $"{BaseSerialize()},{VectorSerialize(Tile)}";
    }
}
