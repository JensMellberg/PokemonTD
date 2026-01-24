using Android.App;
using Android.Content.PM;
using Android.OS;
using Android.Views;
using Microsoft.Xna.Framework;
using PokemonTDCore;

namespace PokemonTDAndroid
{
    [Activity(
        Label = "PokemonTD",
        MainLauncher = false,
        Icon = "@drawable/icon",
        AlwaysRetainTaskState = true,
        LaunchMode = LaunchMode.SingleInstance,
        ScreenOrientation = ScreenOrientation.Landscape,
        Exported = true,
        ConfigurationChanges = ConfigChanges.Orientation | ConfigChanges.Keyboard | ConfigChanges.KeyboardHidden | ConfigChanges.ScreenSize
    )]
    public class Activity1 : AndroidGameActivity
    {
        private PokemonTD game;
        private View _view;

        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);

            game = new PokemonTD(new TouchHandler(), ScreenMode.Phone, new FileSystemWrapper(this), Session.UserCredentials);
            _view = game.Services.GetService(typeof(View)) as View;

            SetContentView(_view);
            game.Run();
        }
    }
}
