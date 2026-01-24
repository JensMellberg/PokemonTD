using System;

namespace PokemonTDCore
{
    public record UserCredentials(string UserName, Guid AccessToken, string ServerIp);
}
