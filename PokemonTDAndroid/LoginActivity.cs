using Android.App;
using Android.Content;
using Android.OS;
using Android.Widget;
using System.Threading.Tasks;
using Android.Content.PM;
using PokemonTDCore.ServerCommunication;
using PokemonTDCore;

namespace PokemonTDAndroid
{
    [Activity(
        Label = "PokemonTD",
        MainLauncher = true,
        Icon = "@drawable/icon",
        ScreenOrientation = ScreenOrientation.Portrait,
        Exported = true
    )]
    public class LoginActivity : Activity
    {
        private LoginHandler loginHandler;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            loginHandler = new LoginHandler(new FileSystemWrapper(this));
            var credentials = loginHandler.CheckForExistingCredentials();
            if (credentials != null)
            {
                Session.UserCredentials = credentials;
                StartGame();
                return;
            }

            SetContentView(Resource.Layout.Login);

            var txtUser = FindViewById<EditText>(Resource.Id.txtUser);
            var txtPass = FindViewById<EditText>(Resource.Id.txtPass);
            var txtIp = FindViewById<EditText>(Resource.Id.txtIp);

            var btnLogin = FindViewById<Button>(Resource.Id.btnLogin);
            var btnOffline = FindViewById<Button>(Resource.Id.btnOffline);

            txtIp.Text = loginHandler.GetServerIp();

            btnLogin.Click += async (s, e) =>
            {
                btnLogin.Enabled = false;

                var (credentials, httpError) = await Task.Run(() =>
                    loginHandler.TryLogin(
                        txtUser.Text,
                        txtPass.Text,
                        txtIp.Text));

                RunOnUiThread(() =>
                {
                    if (httpError)
                    {
                        Toast.MakeText(this, "Could not connect to server.", ToastLength.Long).Show();
                        btnLogin.Enabled = true;
                    }
                    else if (credentials == null)
                    {
                        Toast.MakeText(this, "Invalid username or password", ToastLength.Long).Show();
                        btnLogin.Enabled = true;
                    }
                    else
                    {
                        Session.UserCredentials = credentials;
                        StartGame();
                    }
                });
            };

            btnOffline.Click += (s, e) =>
            {
                StartGame();
            };
        }

        private void StartGame()
        {
            var intent = new Intent(this, typeof(Activity1));
            StartActivity(intent);
            Finish();
        }
    }

    public static class Session
    {
        public static UserCredentials UserCredentials;
    }
}
