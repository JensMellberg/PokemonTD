using System.Linq;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using PokemonTDCore.ServerCommunication;
using PokemonTDCore.Towers;
using PokemonTDEngine;
using PokemonTDEngine.Towers;

namespace PokemonTDCore
{
    public enum ScreenMode
    {
        Desktop,
        Phone
    }

    public class PokemonTD : Game
    {
        private GraphicsDeviceManager graphics;
        private SpriteBatch spriteBatch;
        private TileRenderer tileRenderer;
        private TextureHelper textureHelper;
        private IPressHandler pressHandler;
        private EnemyTextures enemyTextures;
        private IFileSystemWrapper fileSystemWrapper;
        private ScoreDataHandler scoreDataHandler;
        private IGameScreen currentScreen;
        private UserCredentials userCredentials;

        public int ScreenWidth => GraphicsDevice.Viewport.Width;
        public int ScreenHeight => GraphicsDevice.Viewport.Height;

        public Difficulty Difficulty { get; set; } = Difficulty.Normal;

        public PokemonTD(IPressHandler pressHandler, ScreenMode screenMode, IFileSystemWrapper fileSystemWrapper, UserCredentials userCredentials)
        {
            graphics = new GraphicsDeviceManager(this);
            Content.RootDirectory = "Content";
            IsMouseVisible = true;
            IsFixedTimeStep = true;
            this.pressHandler = pressHandler;
            this.fileSystemWrapper = fileSystemWrapper;
            this.userCredentials = userCredentials;
            if (screenMode == ScreenMode.Phone)
            {
                Utils.DefaultSize = new System.Numerics.Vector2(125, 125);
                Utils.SizeMultiplier = 2.5f;
            }
        }

        public void StartGame()
        {
            currentScreen = new GamePlayScreen(textureHelper, this, enemyTextures, tileRenderer, pressHandler, scoreDataHandler);
            currentScreen.Load();
        }

        public void ShowStartScreen()
        {
            currentScreen = new StartScreen(textureHelper, this, pressHandler, scoreDataHandler);
            currentScreen.Load();
        }

        protected override void Initialize()
        {
            textureHelper = new();
            tileRenderer = new();
            scoreDataHandler = new(fileSystemWrapper, new ScoreService(userCredentials));
            ShowStartScreen();
            base.Initialize();
        }

        protected override void LoadContent()
        {
            spriteBatch = new SpriteBatch(GraphicsDevice);
            tileRenderer.LoadContent(Content);
            textureHelper.LoadContent(Content);
            enemyTextures = new(Content.Load<Texture2D>("healthbar"), Content.Load<Texture2D>("hitpoints"), Content.Load<Texture2D>("CrossHair"));
        }

        protected override void Update(GameTime gameTime)
        {
            currentScreen.Update(gameTime);
            base.Update(gameTime);
        }

        protected override void Draw(GameTime gameTime)
        {
            GraphicsDevice.Clear(Color.CornflowerBlue);
            currentScreen.Draw(gameTime, spriteBatch);
            base.Draw(gameTime);
        }
    }
}
