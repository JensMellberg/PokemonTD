using System.Collections;

namespace PokemonTDEngine
{
    public class GameObjects : GameObjectsBase<GameObject> { }

    public class GameObjectsBase<T> : IEnumerable<T>
        where T : GameObject
    {
        private bool hasAdded;

        private List<T> gameObjects = [];

        public void Add(T gameObject)
        {
            hasAdded = true;
            gameObjects.Add(gameObject);
        }

        public void AddRange(IEnumerable<T> objects)
        {
            hasAdded = true;
            gameObjects.AddRange(objects);
        }

        public IEnumerator<T> GetEnumerator() => gameObjects.GetEnumerator();

        public void Update()
        {
            if (hasAdded)
            {
                gameObjects = [.. gameObjects.OrderBy(x => x.ZIndex)];
                hasAdded = false;
            }

            gameObjects = gameObjects.Where(x => !x.ShouldDispose).ToList();
            for (var i = 0; i < gameObjects.Count; i++)
            {
                gameObjects[i].Update();
            }
        }

        IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();
    }
}
