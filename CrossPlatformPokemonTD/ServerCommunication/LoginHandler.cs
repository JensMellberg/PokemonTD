using System;

namespace PokemonTDCore.ServerCommunication
{
    public class LoginHandler(IFileSystemWrapper fileSystemWrapper)
    {
        private const string ServerIpFileName = "ServerIp.txt";
        private const string UserNameFileName = "UserName.txt";
        private const string AccessTokenFileName = "AccessToken.txt";
        private const string DefaultServerIp = "100.126.200.29:8000";
        public UserCredentials CheckForExistingCredentials()
        {
            var serverIp = GetServerIp();
            var userName = fileSystemWrapper.Read(UserNameFileName);
            var accessTokenString = fileSystemWrapper.Read(AccessTokenFileName);

            if (string.IsNullOrEmpty(serverIp) || string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(accessTokenString))
            {
                return null;
            }

            if (!Guid.TryParse(accessTokenString, out var accessToken))
            {
                return null;
            }

            var service = new AuthenticationService(serverIp);
            if (service.VerifyAccessToken(userName, accessToken))
            {
                return new(userName, accessToken, serverIp);
            }

            return null;
        }

        public (UserCredentials, bool httpError) TryLogin(string userName, string password, string serverIp)
        {
            var service = new AuthenticationService(serverIp);
            var (accessToken, success, httpError) = service.TryLogin(userName, password);
            if (success)
            {
                fileSystemWrapper.Write(UserNameFileName, userName);
                fileSystemWrapper.Write(ServerIpFileName, serverIp);
                fileSystemWrapper.Write(AccessTokenFileName, accessToken.ToString());
                return (new(userName, accessToken, serverIp), false);
            }

            return (null, httpError);
        }

        public string GetServerIp()
        {
            var serverIp = fileSystemWrapper.Read(ServerIpFileName);
            return string.IsNullOrEmpty(serverIp) ? DefaultServerIp : serverIp;
        }
    }
}
