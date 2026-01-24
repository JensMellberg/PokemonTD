using System;
using System.Net.Http.Json;

namespace PokemonTDCore.ServerCommunication
{
    public class AuthenticationService(string serverIp)
    {
        public (Guid accessToken, bool success, bool httpError) TryLogin(string userName, string password)
        {
            var request = new
            {
                username = userName,
                password
            };

            var (response, success) = ServerCommunicationUtils.MakeRequest(serverIp, "ExternalLogin/Login", request);

            if (!success)
            {
                return (Guid.Empty, false, true);
            }

            var result = response.Content.ReadFromJsonAsync<LoginResult>().Result;
            return (result.accessToken, result.success, false);
        }

        public bool VerifyAccessToken(string userName, Guid accessToken)
        {
            var request = new
            {
                username = userName,
                accessToken
            };

            var (response, success) = ServerCommunicationUtils.MakeRequest(serverIp, "ExternalLogin/VerifyToken", request);

            if (!success)
            {
                return false;
            }

            var result = response.Content.ReadFromJsonAsync<LoginResult>().Result;
            return result.success;
        }

        public bool ValidateToken(Guid accessToken) => true;

        public class LoginResult
        {
            public bool success { get; set; }
            public Guid accessToken { get; set; }
        }
    }
}
