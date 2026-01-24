using System.Drawing;

namespace PokemonTDEngine
{
    public class Type
    {
        public bool CanAttack(Type other) => !CannotAttack.Contains(other.TypeDefinition);

        public static List<Type> AllTypes => [Water, Steel, Psychic, Poison, Rock, Normal, Ground, Grass, Ghost,
            Fire, Fighting, Flying, Ice, Electric, Dragon, Dark, Bug];

        public double GetMultiplier(Type other)
        {
            if (StrongAgainst.Contains(other.TypeDefinition))
            {
                return 2;
            }
            else if (WeakAgainst.Contains(other.TypeDefinition))
            {
                return 0.5;
            }

            return 1;
        }

        public bool ShowTypeInformation { get; set; } = true;

        public static Type Bug = new()
        {
            Color = Color.DarkGreen,
            TypeDefinition = TypeEnum.Bug,
            StrongAgainst = [TypeEnum.Dark, TypeEnum.Grass, TypeEnum.Psychic],
            WeakAgainst = [TypeEnum.Fighting, TypeEnum.Flying, TypeEnum.Fire, TypeEnum.Ghost, TypeEnum.Poison, TypeEnum.Steel]
        };

        public static Type Dark = new()
        {
            Color = Color.Black,
            TypeDefinition = TypeEnum.Dark,
            StrongAgainst = [TypeEnum.Ghost, TypeEnum.Psychic],
            WeakAgainst = [TypeEnum.Dark, TypeEnum.Fighting, TypeEnum.Steel]
        };

        public static Type Dragon = new()
        {
            Color = Color.Violet,
            TypeDefinition = TypeEnum.Dragon,
            StrongAgainst = [TypeEnum.Dragon],
            WeakAgainst = [TypeEnum.Steel]
        };

        public static Type Electric = new()
        {
            Color = Color.Yellow,
            TypeDefinition = TypeEnum.Electric,
            StrongAgainst = [TypeEnum.Flying, TypeEnum.Water],
            WeakAgainst = [TypeEnum.Dragon, TypeEnum.Electric, TypeEnum.Grass],
            CannotAttack = [TypeEnum.Ground]
        };

        public static Type Ice = new()
        {
            Color = Color.Teal,
            TypeDefinition = TypeEnum.Ice,
            StrongAgainst = [TypeEnum.Dragon, TypeEnum.Grass, TypeEnum.Flying, TypeEnum.Ground],
            WeakAgainst = [TypeEnum.Fire, TypeEnum.Ice, TypeEnum.Steel, TypeEnum.Water]
        };

        public static Type Flying = new()
        {
            Color = Color.Purple,
            TypeDefinition = TypeEnum.Flying,
            StrongAgainst = [TypeEnum.Bug, TypeEnum.Grass, TypeEnum.Fighting],
            WeakAgainst = [TypeEnum.Rock, TypeEnum.Electric, TypeEnum.Steel]
        };

        public static Type Fighting = new()
        {
            Color = Color.Brown,
            TypeDefinition = TypeEnum.Fighting,
            StrongAgainst = [TypeEnum.Normal, TypeEnum.Rock, TypeEnum.Steel, TypeEnum.Ice, TypeEnum.Dark],
            WeakAgainst = [TypeEnum.Poison, TypeEnum.Flying, TypeEnum.Bug, TypeEnum.Psychic]
        };

        public static Type Fire = new()
        {
            Color = Color.Red,
            TypeDefinition = TypeEnum.Fire,
            StrongAgainst = [TypeEnum.Bug, TypeEnum.Grass, TypeEnum.Steel, TypeEnum.Ice],
            WeakAgainst = [TypeEnum.Rock, TypeEnum.Dragon, TypeEnum.Fire, TypeEnum.Water]
        };

        public static Type Ghost = new()
        {
            Color = Color.Purple,
            TypeDefinition = TypeEnum.Ghost,
            StrongAgainst = [TypeEnum.Ghost, TypeEnum.Psychic],
            WeakAgainst = [TypeEnum.Dark, TypeEnum.Steel],
            CannotAttack = [TypeEnum.Normal]
        };

        public static Type Grass = new()
        {
            Color = Color.Green,
            TypeDefinition = TypeEnum.Grass,
            StrongAgainst = [TypeEnum.Water, TypeEnum.Rock, TypeEnum.Ground],
            WeakAgainst = [TypeEnum.Dragon, TypeEnum.Grass, TypeEnum.Bug, TypeEnum.Flying, TypeEnum.Fire, TypeEnum.Steel, TypeEnum.Poison]
        };

        public static Type Ground = new()
        {
            Color = Color.SandyBrown,
            TypeDefinition = TypeEnum.Ground,
            StrongAgainst = [TypeEnum.Fire, TypeEnum.Rock, TypeEnum.Poison, TypeEnum.Electric, TypeEnum.Steel],
            WeakAgainst = [TypeEnum.Bug, TypeEnum.Grass],
            CannotAttack = [TypeEnum.Flying]
        };

        public static Type Multiple = new()
        {
            Color = Color.Pink,
            TypeDefinition = TypeEnum.Multiple,
            ShowTypeInformation = false
        };

        public static Type None = new()
        {
            Color = Color.White,
            TypeDefinition = TypeEnum.None,
            ShowTypeInformation = false
        };

        public static Type Normal = new()
        {
            Color = Color.White,
            TypeDefinition = TypeEnum.Normal,
            StrongAgainst = [],
            WeakAgainst = []
        };

        public static Type Rock = new()
        {
            Color = Color.DimGray,
            TypeDefinition = TypeEnum.Rock,
            StrongAgainst = [TypeEnum.Flying, TypeEnum.Bug, TypeEnum.Fire, TypeEnum.Ice],
            WeakAgainst = [TypeEnum.Steel, TypeEnum.Fighting, TypeEnum.Ground]
        };

        public static Type Poison = new()
        {
            Color = Color.LightCyan,
            TypeDefinition = TypeEnum.Poison,
            StrongAgainst = [TypeEnum.Grass],
            WeakAgainst = [TypeEnum.Ghost, TypeEnum.Ground, TypeEnum.Poison, TypeEnum.Rock],
            CannotAttack = [TypeEnum.Steel]
        };

        public static Type Psychic = new()
        {
            Color = Color.Pink,
            TypeDefinition = TypeEnum.Psychic,
            StrongAgainst = [TypeEnum.Poison, TypeEnum.Fighting],
            WeakAgainst = [TypeEnum.Psychic, TypeEnum.Steel],
            CannotAttack = [TypeEnum.Dark]
        };

        public static Type Steel = new()
        {
            Color = Color.DarkGray,
            TypeDefinition = TypeEnum.Steel,
            StrongAgainst = [TypeEnum.Ice, TypeEnum.Rock],
            WeakAgainst = [TypeEnum.Electric, TypeEnum.Fire, TypeEnum.Steel, TypeEnum.Water]
        };

        public static Type Water = new()
        {
            Color = Color.Blue,
            TypeDefinition = TypeEnum.Water,
            StrongAgainst = [TypeEnum.Fire, TypeEnum.Rock, TypeEnum.Ground],
            WeakAgainst = [TypeEnum.Dragon, TypeEnum.Grass, TypeEnum.Water]
        };

        public Color Color { get; init; }

        public List<TypeEnum> StrongAgainst { get; init; } = [];

        public List<TypeEnum> WeakAgainst { get; init; } = [];

        public List<TypeEnum> CannotAttack { get; init; } = [];

        public TypeEnum TypeDefinition { get; init; }

        public enum TypeEnum
        {
            Normal,
            Fighting,
            Fire,
            Dark,
            Bug,
            Grass,
            Steel,
            Ice,
            Rock,
            Dragon,
            Water,
            Flying,
            Electric,
            Ground,
            Poison,
            Ghost,
            Psychic,
            Multiple,
            None
        }
    }
}
