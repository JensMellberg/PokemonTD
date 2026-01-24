using System.Windows.Forms;
using PokemonTDCore;
using PokemonTDCore.ServerCommunication;
using PokemonTDDesktop;

var fileSystemWrapper = new FileSystemWrapper();
var loginHandler = new LoginHandler(fileSystemWrapper);
var credentials = loginHandler.CheckForExistingCredentials();
if (credentials == null)
{
    using var loginForm = new LoginForm(loginHandler);
    if (loginForm.ShowDialog() == DialogResult.OK)
    {
        credentials = loginForm.UserCredentials;
    }
}

using var game = new PokemonTD(new ClickHandler(), ScreenMode.Desktop, fileSystemWrapper, credentials);
game.Run();