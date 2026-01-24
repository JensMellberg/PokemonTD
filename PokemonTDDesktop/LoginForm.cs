using System;
using System.Windows.Forms;
using PokemonTDCore;
using PokemonTDCore.ServerCommunication;

namespace PokemonTDDesktop
{
    public partial class LoginForm : Form
    {
        private LoginHandler loginHandler;
        public UserCredentials UserCredentials { get; private set; }
        public LoginForm(LoginHandler loginHandler)
        {
            this.loginHandler = loginHandler;
            InitializeComponent();
        }

        private void InitializeComponent()
        {
            Text = "Login";
            Width = 330;
            Height = 290;

            var lblUser = new Label { Left = 20, Top = 20, Text = "Username", Width = 100 };
            var txtUser = new TextBox { Left = 130, Top = 20, Width = 150 };

            var lblPass = new Label { Left = 20, Top = 60, Text = "Password", Width = 100 };
            var txtPass = new TextBox
            {
                Left = 130,
                Top = 60,
                Width = 150,
                UseSystemPasswordChar = true
            };

            var lblIp = new Label { Left = 20, Top = 100, Text = "Server ip", Width = 100 };
            var txtIp = new TextBox { Left = 130, Top = 100, Width = 150, Text = loginHandler.GetServerIp() };

            var btnLogin = new Button
            {
                Left = 130,
                Top = 150,
                Width = 80,
                Text = "Login"
            };

            var btnOffline = new Button
            {
                Left = 130,
                Top = 200,
                Width = 150,
                Text = "Continue offline"
            };

            btnLogin.Click += (s, e) =>
            {
                btnLogin.Enabled = false;
                var (credentials, httpError) = loginHandler.TryLogin(txtUser.Text, txtPass.Text, txtIp.Text);
                if (httpError)
                {
                    MessageBox.Show("Could not connect to server.");
                    btnLogin.Enabled = true;
                }
                else if (credentials == null)
                {
                    MessageBox.Show("Invalid username or password");
                    btnLogin.Enabled = true;
                }
                else
                {
                    UserCredentials = credentials;

                    DialogResult = DialogResult.OK;
                    Close();
                }
            };

            btnOffline.Click += (s, e) =>
            {
                DialogResult = DialogResult.OK;
                Close();
            };

            Controls.Add(lblUser);
            Controls.Add(txtUser);
            Controls.Add(lblPass);
            Controls.Add(txtPass);
            Controls.Add(lblIp);
            Controls.Add(txtIp);
            Controls.Add(btnLogin);
            Controls.Add(btnOffline);
        }
    }
}