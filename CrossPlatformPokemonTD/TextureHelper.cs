using System.Collections.Generic;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;

namespace PokemonTDCore
{
    public class TextureHelper
    {
        public void LoadContent(ContentManager contentManager)
        {
            Menu.Value = LoadTexture("Menu", contentManager);
            Start.Value = LoadTexture("Start", contentManager);
            Goal.Value = LoadTexture("Goal", contentManager);
            Charmander.Value = LoadTexture("CharmanderTower", contentManager);
            Charmeleon.Value = LoadTexture("Charmeleon", contentManager);
            Charizard.Value = LoadTexture("Charizard", contentManager);
            Pichu.Value = LoadTexture("Pichu", contentManager);
            Pikachu.Value = LoadTexture("Pikachu", contentManager);
            Raichu.Value = LoadTexture("Raichu", contentManager);
            Pidgey.Value = LoadTexture("Pidgey", contentManager);
            Pidgeotto.Value = LoadTexture("Pidgeotto", contentManager);
            Pidgeot.Value = LoadTexture("Pidgeot", contentManager);
            Onix.Value = LoadTexture("Onix", contentManager);
            Steelix.Value = LoadTexture("Steelix", contentManager);
            Bagon.Value = LoadTexture("Bagon", contentManager);
            Shelgon.Value = LoadTexture("Shelgon", contentManager);
            Salamence.Value = LoadTexture("Salamence", contentManager);
            Magikarp.Value = LoadTexture("Magikarp", contentManager);
            Gyarados.Value = LoadTexture("Gyarados", contentManager);
            Exeggcute.Value = LoadTexture("Exeggcute", contentManager);
            Exeggutor.Value = LoadTexture("Exeggutor", contentManager);
            Poochyena.Value = LoadTexture("Poochyena", contentManager);
            Mightyena.Value = LoadTexture("Mightyena", contentManager);
            Gastly.Value = LoadTexture("Gastly", contentManager);
            Haunter.Value = LoadTexture("Haunter", contentManager);
            Gengar.Value = LoadTexture("Gengar", contentManager);
            Makuhita.Value = LoadTexture("Makuhita", contentManager);
            Hariyama.Value = LoadTexture("Hariyama", contentManager);
            Koffing.Value = LoadTexture("Koffing", contentManager);
            Weezing.Value = LoadTexture("Weezing", contentManager);
            Wobbuffet.Value = LoadTexture("Wobbuffet", contentManager);
            Scyther.Value = LoadTexture("Scyther", contentManager);
            Scizor.Value = LoadTexture("Scizor", contentManager);
            Articuno.Value = LoadTexture("Articuno", contentManager);
            Groudon.Value = LoadTexture("Groudon", contentManager);
            PoochyenaProjectile.Value = LoadTexture("HyenaP", contentManager);
            GastlyProjectile.Value = LoadTexture("GastlyP", contentManager);
            MakuhitaProjectile.Value = LoadTexture("HitmonP", contentManager);
            KoffingProjectile.Value = LoadTexture("KoffingP", contentManager);
            WobbuffetProjectile.Value = LoadTexture("WobbuP", contentManager);
            ScytherProjectile.Value = LoadTexture("ScytherP", contentManager);
            ArticunoProjectile.Value = LoadTexture("ArticunoP", contentManager);
            CharmanderProjectile.Value = LoadTexture("CharmanderP", contentManager);
            CharizardProjectile.Value = LoadTexture("CharizardP", contentManager);
            PikachuProjectile.Value = LoadTexture("PickachuP", contentManager);
            PidgeyProjectile.Value = LoadTexture("PidgeyP", contentManager);
            OnixProjectile.Value = LoadTexture("OnixP", contentManager);
            BagonProjectile.Value = LoadTexture("BagonP", contentManager);
            MagikarpProjectile.Value = LoadTexture("MagikarpP", contentManager);
            ExeggcuteProjectile.Value = LoadTexture("ExeggcuteP", contentManager);
            RangeCircle.Value = LoadTexture("Circle", contentManager);
            GoldCoin.Value = LoadTexture("GoldCoin", contentManager);
            NextLevelButton.Value = LoadTexture("NextLevel", contentManager);
            VisibilityButton.Value = LoadTexture("VisibilityButton", contentManager);
            SettingsButton.Value = LoadTexture("Settings", contentManager);
            SellButton.Value = LoadTexture("SellButton", contentManager);
            UpgradeButton.Value = LoadTexture("UpgradeButton", contentManager);
            SimpleButton.Value = LoadTexture("SimpleButton", contentManager);
            TowerChange.Value = LoadTexture("TowerChange", contentManager);
            DialogBox.Value = LoadTexture("DialogBox", contentManager);
            HelpButton.Value = LoadTexture("HelpButton", contentManager);
            CrossHair.Value = LoadTexture("CrossHair", contentManager);
            Speed05x.Value = LoadTexture("Speed05x", contentManager);
            Speed1x.Value = LoadTexture("Speed1x", contentManager);
            Speed2x.Value = LoadTexture("Speed2x", contentManager);

            DefaultFont.Value = contentManager.Load<SpriteFont>("DefaultFont");
            
            LevelTextures.Add("Rattata", LoadTexture("Level1", contentManager));
            LevelTextures.Add("Zubat", LoadTexture("Level2", contentManager));
            LevelTextures.Add("Abra", LoadTexture("Level3", contentManager));
            LevelTextures.Add("Pineco", LoadTexture("Level4", contentManager));
            LevelTextures.Add("Aron", LoadTexture("Level5", contentManager));
            LevelTextures.Add("Nidoran", LoadTexture("Level6", contentManager));
            LevelTextures.Add("Machop", LoadTexture("Level7", contentManager));
            LevelTextures.Add("Furret", LoadTexture("Level8", contentManager));
            LevelTextures.Add("Gastly", LoadTexture("Level9", contentManager));
            LevelTextures.Add("Golem", LoadTexture("Level10", contentManager));
            LevelTextures.Add("Spinda", LoadTexture("Level11", contentManager));
            LevelTextures.Add("Makuhita", LoadTexture("Level12", contentManager));
            LevelTextures.Add("Trapinch", LoadTexture("Level13", contentManager));
            LevelTextures.Add("Quilava", LoadTexture("Level14", contentManager));
            LevelTextures.Add("Yanma", LoadTexture("Level15", contentManager));
            LevelTextures.Add("Rhyhorn", LoadTexture("Level16", contentManager));
            LevelTextures.Add("Grimer", LoadTexture("Level17", contentManager));
            LevelTextures.Add("Electrode", LoadTexture("Level18", contentManager));
            LevelTextures.Add("Seadra", LoadTexture("Level19", contentManager));
            LevelTextures.Add("Snorlax", LoadTexture("Level20", contentManager));
            LevelTextures.Add("Starmie", LoadTexture("Level21", contentManager));
            LevelTextures.Add("Porygon", LoadTexture("Level22", contentManager));
            LevelTextures.Add("Omastar", LoadTexture("Level23", contentManager));
            LevelTextures.Add("Manectric", LoadTexture("Level24", contentManager));
            LevelTextures.Add("Piloswine", LoadTexture("Level25", contentManager));
            LevelTextures.Add("Cacturne", LoadTexture("Level26", contentManager));
            LevelTextures.Add("Metang", LoadTexture("Level27", contentManager));
            LevelTextures.Add("Hitmontop", LoadTexture("Level28", contentManager));
            LevelTextures.Add("Absol", LoadTexture("Level29", contentManager));
            LevelTextures.Add("Dragonite", LoadTexture("Level30", contentManager));
            LevelTextures.Add("Ninetails", LoadTexture("Level31", contentManager));
            LevelTextures.Add("Poliwrath", LoadTexture("Level32", contentManager));
            LevelTextures.Add("Victreebel", LoadTexture("Level33", contentManager));
            LevelTextures.Add("Machamp", LoadTexture("Level34", contentManager));
            LevelTextures.Add("Aggron", LoadTexture("Level35", contentManager));
            LevelTextures.Add("Houndoom", LoadTexture("Level36", contentManager));
            LevelTextures.Add("Solrock", LoadTexture("Level37", contentManager));
            LevelTextures.Add("Walrein", LoadTexture("Level38", contentManager));
            LevelTextures.Add("Nidoking", LoadTexture("Level39", contentManager));
            LevelTextures.Add("Regice", LoadTexture("Level40", contentManager));
            LevelTextures.Add("Regigigas", LoadTexture("Level41", contentManager));
            LevelTextures.Add("Meganium", LoadTexture("Level423", contentManager));
            LevelTextures.Add("Typhlosion", LoadTexture("Level422", contentManager));
            LevelTextures.Add("Feraligatr", LoadTexture("Level421", contentManager));
            LevelTextures.Add("Latias", LoadTexture("Level43", contentManager));
            LevelTextures.Add("Latios", LoadTexture("Level44", contentManager));
            LevelTextures.Add("Tyranitar", LoadTexture("Level45", contentManager));
            LevelTextures.Add("Entei", LoadTexture("Level46", contentManager));
            LevelTextures.Add("Suicune", LoadTexture("Level47", contentManager));
            LevelTextures.Add("Raikou", LoadTexture("Level48", contentManager));
            LevelTextures.Add("Kyogre", LoadTexture("Level49", contentManager));
            LevelTextures.Add("Mew", LoadTexture("Level50", contentManager));
            LevelTextures.Add("Damage test", LoadTexture("ShinyMagikarp", contentManager));
        }

        private static Texture2D LoadTexture(string asset, ContentManager contentManager) => contentManager.Load<Texture2D>(asset);
        public TextureReference Menu { get; private set; } = new();
        public TextureReference DialogBox { get; private set; } = new();
        public TextureReference Start { get; private set; } = new();
        public TextureReference Goal { get; private set; } = new();
        public TextureReference HelpButton { get; private set; } = new();
        public TextureReference Charmander { get; private set; } = new();
        public TextureReference Charmeleon { get; private set; } = new();
        public TextureReference Charizard { get; private set; } = new();
        public TextureReference CharmanderProjectile { get; private set; } = new();
        public TextureReference CharizardProjectile { get; private set; } = new();
        public TextureReference Pichu { get; private set; } = new();
        public TextureReference Pikachu { get; private set; } = new();
        public TextureReference Raichu { get; private set; } = new();
        public TextureReference PikachuProjectile { get; private set; } = new();
        public TextureReference Pidgey { get; private set; } = new();
        public TextureReference Pidgeotto { get; private set; } = new();
        public TextureReference Pidgeot { get; private set; } = new();
        public TextureReference PidgeyProjectile { get; private set; } = new();
        public TextureReference Onix { get; private set; } = new();
        public TextureReference Steelix { get; private set; } = new();
        public TextureReference OnixProjectile { get; private set; } = new();
        public TextureReference Bagon { get; private set; } = new();
        public TextureReference Shelgon { get; private set; } = new();
        public TextureReference Salamence { get; private set; } = new();
        public TextureReference BagonProjectile { get; private set; } = new();
        public TextureReference Magikarp { get; private set; } = new();
        public TextureReference MagikarpProjectile { get; private set; } = new();
        public TextureReference Gyarados { get; private set; } = new();
        public TextureReference Exeggcute { get; private set; } = new();
        public TextureReference Exeggutor { get; private set; } = new();
        public TextureReference ExeggcuteProjectile { get; private set; } = new();
        public TextureReference Poochyena { get; private set; } = new();
        public TextureReference PoochyenaProjectile { get; private set; } = new();
        public TextureReference Mightyena { get; private set; } = new();
        public TextureReference Gastly { get; private set; } = new();
        public TextureReference GastlyProjectile { get; private set; } = new();
        public TextureReference Haunter { get; private set; } = new();
        public TextureReference Gengar { get; private set; } = new();
        public TextureReference Makuhita { get; private set; } = new();
        public TextureReference MakuhitaProjectile { get; private set; } = new();
        public TextureReference Hariyama { get; private set; } = new();
        public TextureReference Koffing { get; private set; } = new();
        public TextureReference KoffingProjectile { get; private set; } = new();
        public TextureReference Weezing { get; private set; } = new();
        public TextureReference Wobbuffet { get; private set; } = new();
        public TextureReference WobbuffetProjectile { get; private set; } = new();
        public TextureReference Scyther { get; private set; } = new();
        public TextureReference ScytherProjectile { get; private set; } = new();
        public TextureReference Scizor { get; private set; } = new();
        public TextureReference Articuno { get; private set; } = new();
        public TextureReference ArticunoProjectile { get; private set; } = new();
        public TextureReference Groudon { get; private set; } = new();
        public TextureReference RangeCircle { get; private set; } = new();
        public TextureReference TowerChange { get; private set; } = new();
        public TextureReference NextLevelButton { get; private set; } = new();
        public TextureReference VisibilityButton { get; private set; } = new();
        public TextureReference SettingsButton { get; private set; } = new();
        public TextureReference CrossHair { get; private set; } = new();
        public TextureReference SellButton { get; private set; } = new();
        public TextureReference SimpleButton { get; private set; } = new();
        public TextureReference UpgradeButton { get; private set; } = new();
        public TextureReference GoldCoin { get; private set; } = new();
        public TextureReference Speed05x { get; private set; } = new();
        public TextureReference Speed1x { get; private set; } = new();
        public TextureReference Speed2x { get; private set; } = new();
        public SpriteFontReference DefaultFont { get; private set; } = new();

        public Dictionary<string, Texture2D> LevelTextures = [];
    }

    public class TextureReference
    {
        public Texture2D Value { get; set; }
    }

    public class SpriteFontReference
    {
        public SpriteFont Value { get; set; }
    }
}
