namespace PokemonTDCore
{
    public interface IFileSystemWrapper
    {
        public void Write(string file, string content);

        public string Read(string file);
    }
}
