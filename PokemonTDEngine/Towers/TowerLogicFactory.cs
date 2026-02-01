using System.Numerics;

namespace PokemonTDEngine.Towers
{
    public static class TowerLogicFactory
    {
        public static BaseTowerLogic CreateTower(string id, GameEngine gameEngine, Vector2 position)
        {
            switch (id)
            {
                case TowerId.Charmander: return new Charmander(position, gameEngine);
                case TowerId.Charmeleon: return new Charmeleon(position, gameEngine);
                case TowerId.Charizard: return new Charizard(position, gameEngine);
                case TowerId.Pichu: return new Pichu(position, gameEngine);
                case TowerId.Pikachu: return new Pikachu(position, gameEngine);
                case TowerId.Raichu: return new Raichu(position, gameEngine);
                case TowerId.Pidgey: return new Pidgey(position, gameEngine);
                case TowerId.Pidgeotto: return new Pidgeotto(position, gameEngine);
                case TowerId.Pidgeot: return new Pidgeot(position, gameEngine);
                case TowerId.Onix: return new Onix(position, gameEngine);
                case TowerId.Steelix: return new Steelix(position, gameEngine);
                case TowerId.Bagon: return new Bagon(position, gameEngine);
                case TowerId.Shelgon: return new Shelgon(position, gameEngine);
                case TowerId.Salamence: return new Salamence(position, gameEngine);
                case TowerId.Magikarp: return new Magikarp(position, gameEngine);
                case TowerId.Gyarados: return new Gyarados(position, gameEngine);
                case TowerId.Exeggcute: return new Exeggcute(position, gameEngine);
                case TowerId.Exeggutor: return new Exeggutor(position, gameEngine);
                case TowerId.Poochyena: return new Poochyena(position, gameEngine);
                case TowerId.Mightyena: return new Mightyena(position, gameEngine);
                case TowerId.Gastly: return new Gastly(position, gameEngine);
                case TowerId.Haunter: return new Haunter(position, gameEngine);
                case TowerId.Gengar: return new Gengar(position, gameEngine);
                case TowerId.Makuhita: return new Makuhita(position, gameEngine);
                case TowerId.Hariyama: return new Hariyama(position, gameEngine);
                case TowerId.Koffing: return new Koffing(position, gameEngine);
                case TowerId.Weezing: return new Weezing(position, gameEngine);
                case TowerId.Wobbuffet: return new Wobbuffet(position, gameEngine);
                case TowerId.Scyther: return new Scyther(position, gameEngine);
                case TowerId.Scizor: return new Scizor(position, gameEngine);
                case TowerId.Articuno: return new Articuno(position, gameEngine);
                case TowerId.Groudon: return new Groudon(position, gameEngine);
                default: throw new Exception($"Unknown tower id {id}.");
            }
        }
    }

    public static class TowerId
    {
        public const string Charmander = "Charmander";
        public const string Charmeleon = "Charmeleon";
        public const string Charizard = "Charizard";
        public const string Pichu = "Pichu";
        public const string Pikachu = "Pikachu";
        public const string Raichu = "Raichu";
        public const string Pidgey = "Pidgey";
        public const string Pidgeotto = "Pidgeotto";
        public const string Pidgeot = "Pidgeot";
        public const string Onix = "Onix";
        public const string Steelix = "Steelix";
        public const string Bagon = "Bagon";
        public const string Shelgon = "Shelgon";
        public const string Salamence = "Salamence";
        public const string Magikarp = "Magikarp";
        public const string Gyarados = "Gyarados";
        public const string Exeggcute = "Exeggcute";
        public const string Exeggutor = "Exeggutor";
        public const string Poochyena = "Poochyena";
        public const string Mightyena = "Mightyena";
        public const string Gastly = "Gastly";
        public const string Haunter = "Haunter";
        public const string Gengar = "Gengar";
        public const string Makuhita = "Makuhita";
        public const string Hariyama = "Hariyama";
        public const string Koffing = "Koffing";
        public const string Weezing = "Weezing";
        public const string Wobbuffet = "Wobbuffet";
        public const string Scyther = "Scyther";
        public const string Scizor = "Scizor";
        public const string Articuno = "Articuno";
        public const string Groudon = "Groudon";
    }

    public record TowerStats(string Name, string Id, int Cost, float Range, int Cooldown, int Damage, Type Type, int BuildableTileType = TileHandler.GrassTileType)
    {
        public static TowerStats Charmander = new(
            TowerId.Charmander,
            TowerId.Charmander,
            20,
            100,
            40,
            6,
            Type.Fire);
        public static TowerStats Charmeleon = new(
            TowerId.Charmeleon,
            TowerId.Charmeleon,
            60,
            110,
            38,
            22,
            Type.Fire);
        public static TowerStats Charizard = new(
            TowerId.Charizard,
            TowerId.Charizard,
            300,
            125,
            22,
            66,
            Type.Fire);
        public static TowerStats Pichu = new(
            TowerId.Pichu,
            TowerId.Pichu,
            50,
            125,
            30,
            10,
            Type.Electric);
        public static TowerStats Pikachu = new(
            TowerId.Pikachu,
            TowerId.Pikachu,
            130,
            125,
            25,
            32,
            Type.Electric);
        public static TowerStats Raichu = new(
            TowerId.Raichu,
            TowerId.Raichu,
            750,
            125,
            20,
            145,
            Type.Electric);
        public static TowerStats Pidgey = new(
            TowerId.Pidgey,
            TowerId.Pidgey,
            100,
            110,
            24,
            17,
            Type.Flying);
        public static TowerStats Pidgeotto = new(
            TowerId.Pidgeotto,
            TowerId.Pidgeotto,
            750,
            110,
            24,
            180,
            Type.Flying);
        public static TowerStats Pidgeot = new(
            TowerId.Pidgeot,
            TowerId.Pidgeot,
            2250,
            115,
            24,
            630,
            Type.Flying);
        public static TowerStats Onix = new(
            TowerId.Onix,
            TowerId.Onix,
            200,
            150,
            50,
            64,
            Type.Rock);
        public static TowerStats Steelix = new(
            TowerId.Steelix,
            TowerId.Steelix,
            500,
            150,
            50,
            230,
            Type.Steel);
        public static TowerStats Bagon = new(
            TowerId.Bagon,
            TowerId.Bagon,
            150,
            115,
            26,
            30,
            Type.Dragon);
        public static TowerStats Shelgon = new(
            TowerId.Shelgon,
            TowerId.Shelgon,
            600,
            115,
            26,
            152,
            Type.Dragon);
        public static TowerStats Salamence = new(
            TowerId.Salamence,
            TowerId.Salamence,
            1200,
            120,
            20,
            310,
            Type.Dragon);
        public static TowerStats Magikarp = new(
            TowerId.Magikarp,
            TowerId.Magikarp,
            30,
            80,
            100,
            2,
            Type.Water,
            TileHandler.WaterTileType);
        public static TowerStats Gyarados = new(
            TowerId.Gyarados,
            TowerId.Gyarados,
            2500,
            135,
            25,
            350,
            Type.Water);
        public static TowerStats Exeggcute = new(
            TowerId.Exeggcute,
            TowerId.Exeggcute,
            250,
            115,
            50,
            46,
            Type.Grass);
        public static TowerStats Exeggutor = new(
            TowerId.Exeggutor,
            TowerId.Exeggutor,
            1000,
            115,
            50,
            190,
            Type.Grass);
        public static TowerStats Poochyena = new(
            TowerId.Poochyena,
            TowerId.Poochyena,
            300,
            105,
            25,
            65,
            Type.Dark);
        public static TowerStats Mightyena = new(
            TowerId.Mightyena,
            TowerId.Mightyena,
            1700,
            105,
            25,
            460,
            Type.Dark);
        public static TowerStats Gastly = new(
            TowerId.Gastly,
            TowerId.Gastly,
            400,
            100,
            10,
            42,
            Type.Ghost);
        public static TowerStats Haunter = new(
            TowerId.Haunter,
            TowerId.Haunter,
            2000,
            115,
            10,
            250,
            Type.Ghost);
        public static TowerStats Gengar = new(
            TowerId.Gengar,
            TowerId.Gengar,
            4000,
            125,
            10,
            710,
            Type.Ghost);
        public static TowerStats Makuhita = new(
            TowerId.Makuhita,
            TowerId.Makuhita,
            600,
            75,
            5,
            40,
            Type.Fighting);
        public static TowerStats Hariyama = new(
            TowerId.Hariyama,
            TowerId.Hariyama,
            1500,
            75,
            5,
            142,
            Type.Fighting);
        public static TowerStats Koffing = new(
            TowerId.Koffing,
            TowerId.Koffing,
            900,
            105,
            30,
            240,
            Type.Poison);
        public static TowerStats Weezing = new(
            TowerId.Weezing,
            TowerId.Weezing,
            2000,
            115,
            30,
            780,
            Type.Poison);
        public static TowerStats Wobbuffet = new(
            TowerId.Wobbuffet,
            TowerId.Wobbuffet,
            2500,
            110,
            28,
            666,
            Type.Psychic);
        public static TowerStats Scyther = new(
            TowerId.Scyther,
            TowerId.Scyther,
            3000,
            110,
            30,
            940,
            Type.Bug);
        public static TowerStats Scizor = new(
            TowerId.Scizor,
            TowerId.Scizor,
            7000,
            115,
            30,
            2800,
            Type.Bug);
        public static TowerStats Articuno = new(
            TowerId.Articuno,
            TowerId.Articuno,
            6500,
            100,
            20,
            1200,
            Type.Ice);
        public static TowerStats Groudon = new(
            TowerId.Groudon,
            TowerId.Groudon,
            10500,
            200,
            10,
            640,
            Type.Ground);
    }
}
