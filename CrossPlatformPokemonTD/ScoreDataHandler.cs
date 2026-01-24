using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PokemonTDCore.ServerCommunication;
using PokemonTDEngine;

namespace PokemonTDCore
{
    public class ScoreDataHandler(IFileSystemWrapper fileSystemWrapper, ScoreService scoreService)
    {
        private readonly Dictionary<Difficulty, ScoreData> results = [];
        private const string NormalFileName = "Normal.txt";
        private const string HardFileName = "Hard.txt";
        private const string ExtremeFileName = "Extreme.txt";

        public Dictionary<Difficulty, ScoreData> GetScores()
        {
            var serverScores = scoreService.GetScores();
            results[Difficulty.Normal] = FromText(fileSystemWrapper.Read(NormalFileName));
            results[Difficulty.Hard] = FromText(fileSystemWrapper.Read(HardFileName));
            results[Difficulty.Extreme] = FromText(fileSystemWrapper.Read(ExtremeFileName));
            foreach (var kv in results.ToDictionary())
            {
                if (IsBetterThan(serverScores[kv.Key], kv.Value))
                {
                    results[kv.Key] = serverScores[kv.Key];
                    SaveScore(serverScores[kv.Key], kv.Key);
                }

                if (!results[kv.Key].IsStored)
                {
                    if (scoreService.SaveScore(kv.Key, results[kv.Key].Events))
                    {
                        var savedResult = results[kv.Key] with { IsStored = true };
                        SaveScore(savedResult, kv.Key);
                    }
                }
            }

            var simulator = new GameSimulator(results[Difficulty.Normal].Events, Difficulty.Normal);
            simulator.SimulateGame();
            return results;
        }

        public bool TrySaveScore(ScoreData score, Difficulty difficulty)
        {
            var existingScore = results[difficulty];
            if (!IsBetterThan(score, existingScore)) {
                return false;
            }

            var savedToServer = scoreService.SaveScore(difficulty, score.Events);
            SaveScore(score with { IsStored = savedToServer }, difficulty);
            return true;
        }

        public void SaveScore(ScoreData score, Difficulty difficulty)
        {
            var sb = new StringBuilder();

            sb.Append(score.IsWin ? "W" : "L");
            sb.Append(score.IsStored ? "Y" : "N");
            sb.Append(score.IsWin ? score.DamageTestResult : score.LevelCompleted);
            sb.AppendLine();
            sb.Append(EventTracker.SerializeEvents(score.Events));
            var text = sb.ToString();
            string fileName = difficulty switch
            {
                Difficulty.Normal => NormalFileName,
                Difficulty.Hard => HardFileName,
                Difficulty.Extreme => ExtremeFileName,
                _ => throw new Exception(),
            };

            fileSystemWrapper.Write(fileName, text);
            results[difficulty] = score;
        }

        private static bool IsBetterThan(ScoreData score, ScoreData existing) => score.DamageTestResult > existing.DamageTestResult || score.LevelCompleted > existing.LevelCompleted;

        private static ScoreData FromText(string text)
        {
            if (string.IsNullOrEmpty(text))
            {
                return ScoreData.Empty;
            }

            try
            {
                var lines = text.Replace("\r", "").Split('\n', StringSplitOptions.RemoveEmptyEntries);
                var isWin = lines[0][0] == 'W';
                var isStored = lines[0][1] == 'Y';
                var events = EventTracker.DeserializeEvents(lines.Skip(1));
                if (isWin)
                {
                    var damageTestResult = long.Parse(lines[0][2..]);
                    return new ScoreData(50, damageTestResult, true, events, isStored);
                }
                else
                {
                    var levelCompleted = int.Parse(lines[0][2..]);
                    return new ScoreData(levelCompleted, 0, false, events, isStored);
                }
            }
            catch
            {
                return ScoreData.Empty;
            }
        }

    }

    public record ScoreData(int LevelCompleted, long DamageTestResult, bool IsWin, List<Event> Events, bool IsStored)
    {
        public static ScoreData Empty => new(0, 0, false, [], true);
    }
}
