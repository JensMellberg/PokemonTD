using System;
using System.Net.Http;
using System.Net.Http.Json;

namespace PokemonTDCore.ServerCommunication
{
    public static class ServerCommunicationUtils
    {
        public static HttpClient CreateClient(string serverIp, int timeoutSeconds)
        {
            var client = new HttpClient();

            client.BaseAddress = new Uri($"http://{serverIp}/");

            client.Timeout = TimeSpan.FromSeconds(timeoutSeconds);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

            return client;
        }

        public static (HttpResponseMessage response, bool success) MakeRequest(string serverIp, string path, object body, int timeoutSeconds)
        {
            try
            {
                var response = CreateClient(serverIp, timeoutSeconds).PostAsJsonAsync(
                path,
                body).Result;
                return (response, response.IsSuccessStatusCode);
            }
            catch
            {
                return (null, false);
            }
        }
    }
}
