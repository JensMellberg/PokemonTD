using PokemonTDCore;
using System;
using System.IO;

namespace PokemonTDDesktop
{
    public class FileSystemWrapper() : IFileSystemWrapper
    {
        private static string FilePath(string fileName) =>
            Path.Combine(FolderPath, fileName);
        private static string FolderPath =>
            Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "PokemonTD");

        public string Read(string file)
        {
            if (!File.Exists(FilePath(file)))
            {
                return null;
            }

            return File.ReadAllText(FilePath(file));
        }

        public void Write(string file, string content)
        {
            if (!Directory.Exists(FolderPath))
            {
                Directory.CreateDirectory(FolderPath);
            }

            File.WriteAllText(FilePath(file), content);
        }
    }
}
