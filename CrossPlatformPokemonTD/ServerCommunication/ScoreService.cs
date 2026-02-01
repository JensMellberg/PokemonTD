

using System;
using System.Collections.Generic;
using System.Net.Http.Json;
using PokemonTDEngine;
using static PokemonTDCore.ServerCommunication.AuthenticationService;

namespace PokemonTDCore.ServerCommunication
{
    public class ScoreService(UserCredentials userCredentials)
    {
        public bool SaveScore(Difficulty difficulty, List<Event> events)
        {
            if (userCredentials == null)
            {
                return false;
            }

            var body = new
            {
                username = userCredentials.UserName,
                accessToken = userCredentials.AccessToken,
                difficulty = difficulty.ToString(),
                serializedEvents = EventTracker.SerializeEvents(events)
            };

            var (response, success) = ServerCommunicationUtils.MakeRequest(userCredentials.ServerIp, "PokemonTD/Results/Store", body, 120);
            if (!success)
            {
                return false;
            }

            return true;

        }
        public Dictionary<Difficulty, ScoreData> GetScores()
        {
            var scores = new Dictionary<Difficulty, ScoreData>
            {
                [Difficulty.Normal] = ScoreData.Empty,
                [Difficulty.Hard] = ScoreData.Empty,
                [Difficulty.Extreme] = ScoreData.Empty
            };

            if (userCredentials == null)
            {
                return scores;
            }

            var body = new
            {
                username = userCredentials.UserName,
                accessToken = userCredentials.AccessToken
            };

            var (response, success) = ServerCommunicationUtils.MakeRequest(userCredentials.ServerIp, "PokemonTD/Results/Get", body, 10);
            if (success)
            {
                var result = response.Content.ReadFromJsonAsync<ScoreResponse>().Result;
                foreach (var score in result.results)
                {
                    if (!Enum.TryParse<Difficulty>(score.difficulty, out var difficulty)) {
                        continue;
                    }

                    scores[difficulty] = new(score.levelCompleted, score.damageTestResult, score.isWin, [], true);
                }
            }

            return scores;
        }

        public class ScoreReponseResult
        {
            public string difficulty { get; set; }
            public bool isWin { get; set; }
            public int levelCompleted { get; set; }
            public long damageTestResult { get; set; }
        }

        public class ScoreResponse
        {
            public ScoreReponseResult[] results { get; set; }
        }
    }
}
