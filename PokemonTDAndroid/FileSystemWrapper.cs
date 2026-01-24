using System;
using Android.Content;
using PokemonTDCore;
using System.IO;

namespace PokemonTDAndroid
{
    internal class FileSystemWrapper(Context context) : IFileSystemWrapper
    {
        private string FilePath(string fileName) => Path.Combine(context.FilesDir.AbsolutePath, fileName);

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
            File.WriteAllText(FilePath(file), content);
        }
    }
}
