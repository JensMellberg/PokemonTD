namespace PokemonTDEngine
{
    public class LifeHandler(Action loseCallback)
    {
        private const int DefaultLives = 20;

        private int lives = DefaultLives;

        public int LivesLeft => lives;

        public void LoseLives(int livesLost)
        {
            lives -= livesLost;
            if (lives <= 0)
            {
                loseCallback();
            }
        }
    }
}
