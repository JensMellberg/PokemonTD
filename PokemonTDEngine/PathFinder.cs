using System.Numerics;

namespace PokemonTDEngine
{
    public static class PathFinder
    {
        public static Path FindBestPath(bool[,] pathMatrix, Vector2 start, Vector2 end, Func<Vector2, Vector2> transformTile)
        {
            var distanceMatrix = new int[pathMatrix.GetLength(0), pathMatrix.GetLength(1)];
            for (var x = 0; x < distanceMatrix.GetLength(1); x++)
            {
                for (var y = 0; y < distanceMatrix.GetLength(0); y++)
                {
                    distanceMatrix[y, x] = int.MaxValue;
                }
            }

            var visited = new HashSet<(int x, int y)>();
            var visitQueue = new Queue<(int x, int y, int length)>();
            visitQueue.Enqueue(((int)end.X, (int)end.Y, 0));
            pathMatrix[(int)end.Y, (int)end.X] = true;

            while (visitQueue.Count > 0)
            {
                (var x, var y, var length) = visitQueue.Dequeue();
                if (!visited.Add((x, y)) || x < 0 || y < 0 || x >= pathMatrix.GetLength(1) || y >= pathMatrix.GetLength(0) || !pathMatrix[y, x])
                {
                    continue;
                }

                distanceMatrix[y, x] = length;
                visitQueue.Enqueue((x + 1, y, length + 1));
                visitQueue.Enqueue((x - 1, y, length + 1));
                visitQueue.Enqueue((x, y + 1, length + 1));
                visitQueue.Enqueue((x, y - 1, length + 1));
            }

            var pathPoints = new List<Vector2>();
            var currentX = (int)start.X;
            var currentY = (int)start.Y;

            if (distanceMatrix[currentY, currentX] == int.MaxValue)
            {
                return null;
            }

            while (currentX != (int)end.X || currentY != (int)end.Y)
            {
                var choices = new List<(int length, int x, int y)>();
                TryChoice(currentX - 1, currentY);
                TryChoice(currentX + 1, currentY);
                TryChoice(currentX, currentY - 1);
                TryChoice(currentX, currentY + 1);
                var chosen = choices.MinBy(x => x.length);
                pathPoints.Add(transformTile(new Vector2(chosen.x, chosen.y)));
                currentX = chosen.x;
                currentY = chosen.y;

                void TryChoice(int x, int y)
                {
                    if (x < 0 || y < 0 || x >= pathMatrix.GetLength(1) || y >= pathMatrix.GetLength(0))
                    {
                        return;
                    }

                    choices.Add((distanceMatrix[y, x], x, y));
                }
            }

            return new Path(pathPoints);
        }
    }

    public class Path(List<Vector2> points)
    {
        public Path Copy() => new(points);

        private int currentIndex;

        public Vector2 NextPoint => points[currentIndex];

        public bool HasReachedGoal => currentIndex >= points.Count;

        public bool HasReachedNextPosition(Vector2 position, float speed) => Utils.DistanceBetween(position, NextPoint) < speed;

        public void UpdatePosition() => currentIndex++;
    }
}
