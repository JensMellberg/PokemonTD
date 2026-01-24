using System.Collections.Generic;

namespace PokemonTDCore.InformationSquare
{
    public interface IInformationSource
    {
        public List<DrawableGameObject> CreateItems();

        public bool ShouldDispose { get; }

        public IInformationSource RedirectToSource { get; }

        public bool IsCurrentlyInformationSource { set; }
    }
}
