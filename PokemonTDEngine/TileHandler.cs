using System.Numerics;

namespace PokemonTDEngine
{
    public class TileHandler
    {
        public const int GrassTileType = 0;

        public const int WaterTileType = 2;

        public static Vector2 SpawnStart = new(4, 1);

        public static Vector2 SpawnEnd = new(20, 11);

        protected readonly int[,] TileMap = new int[12, 22]
        {
            {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
            {1,0,0,0,0,2,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1},
            {1,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,1,1},
            {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
            {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
            {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
            {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
            {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
            {1,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1},
            {1,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1},
            {1,1,1,0,1,1,1,1,1,1,1,1,1,1,2,0,0,0,0,0,0,1},
            {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1}
        };

        public bool[,] GetBasePathmatrix(int freeTileType = GrassTileType)
        {
            var pathMatrix = new bool[TileMap.GetLength(0), TileMap.GetLength(1)];
            for (var x = 0; x < TileMap.GetLength(1); x++)
            {
                for (var y = 0; y < TileMap.GetLength(0); y++)
                {
                    pathMatrix[y, x] = TileMap[y, x] == freeTileType;
                }
            }

            return pathMatrix;
        }

        public int FieldWidth => TileMap.GetLength(1);

        public int FieldHeight => TileMap.GetLength(0);
    }
}
