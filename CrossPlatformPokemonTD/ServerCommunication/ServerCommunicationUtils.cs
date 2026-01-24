using System;
using System.Net.Http;
using System.Net.Http.Json;

namespace PokemonTDCore.ServerCommunication
{
    public static class ServerCommunicationUtils
    {
        public static HttpClient CreateClient(string serverIp)
        {
            var client = new HttpClient();

            client.BaseAddress = new Uri($"http://{serverIp}/");

            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

            return client;
        }

        public static (HttpResponseMessage response, bool success) MakeRequest(string serverIp, string path, object body)
        {
            try
            {
                var response = CreateClient(serverIp).PostAsJsonAsync(
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
