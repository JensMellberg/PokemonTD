namespace PokemonTDEngine
{
    public class GoldHandler(Difficulty difficulty)
    {
        private const int DefaultGold = 100;

        private int gold = DefaultGold + (difficulty == Difficulty.Extreme ? 50 : 0);

        public int Gold => gold;
        public void Add(int gold) => this.gold += gold;

        public void Reduce(int gold) => this.gold = Math.Max(this.gold - gold, 0);

        public bool CanAfford(int cost) => gold >= cost;
    }
}
