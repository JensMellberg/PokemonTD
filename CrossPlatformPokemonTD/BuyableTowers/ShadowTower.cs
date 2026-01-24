using System;
using System.Collections.Generic;
using System.Numerics;
using PokemonTDCore.InformationSquare;
using PokemonTDCore.Towers;
using PokemonTDEngine;
using PokemonTDEngine.Towers;

namespace PokemonTDCore.BuyableTowers
{
    public class ShadowTower(TextureReference texture, Vector2 position, TowerStats towerStats, GameEngine gameEngine, RangeCircle rangeCircle, BuyableTower source, GamePlayScreen gamePlayScreen)
        : ClickableGameObject(position, texture, Utils.DefaultSize), IInformationSource
    {
        public override bool HasStaticPosition => false;

        private Vector2 actualPosition = position;

        private bool mayPlace;

        protected override Microsoft.Xna.Framework.Color Color => mayPlace ? base.Color : Microsoft.Xna.Framework.Color.Red;

        public IInformationSource RedirectToSource { get; private set; } = null;

        public bool IsCurrentlyInformationSource { set; private get; }

        private float totalDragDistance = 0f;

        protected override void OnPress(Vector2 position)
        {
            
        }

        public override void OnDrag(Vector2 delta, Vector2 position)
        {
            var previousPosition = Position;
            actualPosition += delta;
            totalDragDistance += delta.Length();
            var tile = GameEngine.TranslateToTile(actualPosition);
            Position = GameEngine.TranslateFromTile(tile);
            rangeCircle.Position += Position - previousPosition;

            mayPlace = gameEngine.IsFreeTile(tile, towerStats.BuildableTileType);
        }

        protected override void OnPressRelease(Vector2 position)
        {
            ShouldDispose = true;
            rangeCircle.ShouldDispose = true;
            if (totalDragDistance < Utils.DefaultSize.X)
            {
                RedirectToSource = source;
                return;
            }

            var tile = GameEngine.TranslateToTile(position);
            var placedTower = gameEngine.TryPlaceTower(towerStats.Id, tile);
            IInformationSource redirectSource = source;

            if (placedTower != null)
            {
                EventTracker.BuildTower(towerStats.Id, tile, gameEngine);
                redirectSource = gamePlayScreen.CreateTower(placedTower);
            }

            RedirectToSource = redirectSource;
        }

        public List<DrawableGameObject> CreateItems() => [];
    }
}
