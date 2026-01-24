using System;
using PokemonTDEngine.Towers;

namespace PokemonTDCore.Towers
{
    public static class TowerFactory
    {
        public static Tower CreateTower(TextureHelper textureHelper, BaseTowerLogic towerLogic, GamePlayScreen gamePlayScreen)
        {
            switch (towerLogic.Stats.Id)
            {
                case TowerId.Charmander: return new Tower(textureHelper, textureHelper.Charmander, towerLogic, gamePlayScreen);
                case TowerId.Charmeleon: return new Tower(textureHelper, textureHelper.Charmeleon, towerLogic, gamePlayScreen);
                case TowerId.Charizard: return new Tower(textureHelper, textureHelper.Charizard, towerLogic, gamePlayScreen);
                case TowerId.Pichu: return new Tower(textureHelper, textureHelper.Pichu, towerLogic, gamePlayScreen);
                case TowerId.Pikachu: return new Tower(textureHelper, textureHelper.Pikachu, towerLogic, gamePlayScreen);
                case TowerId.Raichu: return new Tower(textureHelper, textureHelper.Raichu, towerLogic, gamePlayScreen);
                case TowerId.Pidgey: return new Tower(textureHelper, textureHelper.Pidgey, towerLogic, gamePlayScreen);
                case TowerId.Pidgeotto: return new Tower(textureHelper, textureHelper.Pidgeotto, towerLogic, gamePlayScreen);
                case TowerId.Pidgeot: return new Tower(textureHelper, textureHelper.Pidgeot, towerLogic, gamePlayScreen);
                case TowerId.Onix: return new Tower(textureHelper, textureHelper.Onix, towerLogic, gamePlayScreen);
                case TowerId.Steelix: return new Tower(textureHelper, textureHelper.Steelix, towerLogic, gamePlayScreen);
                case TowerId.Magikarp: return new Tower(textureHelper, textureHelper.Magikarp, towerLogic, gamePlayScreen);
                case TowerId.Gyarados: return new Tower(textureHelper, textureHelper.Gyarados, towerLogic, gamePlayScreen);
                case TowerId.Bagon: return new Tower(textureHelper, textureHelper.Bagon, towerLogic, gamePlayScreen);
                case TowerId.Shelgon: return new Tower(textureHelper, textureHelper.Shelgon, towerLogic, gamePlayScreen);
                case TowerId.Salamence: return new Tower(textureHelper, textureHelper.Salamence, towerLogic, gamePlayScreen);
                case TowerId.Exeggcute: return new Tower(textureHelper, textureHelper.Exeggcute, towerLogic, gamePlayScreen);
                case TowerId.Exeggutor: return new Tower(textureHelper, textureHelper.Exeggutor, towerLogic, gamePlayScreen);
                case TowerId.Poochyena: return new Tower(textureHelper, textureHelper.Poochyena, towerLogic, gamePlayScreen);
                case TowerId.Mightyena: return new Tower(textureHelper, textureHelper.Mightyena, towerLogic, gamePlayScreen);
                case TowerId.Gastly: return new Tower(textureHelper, textureHelper.Gastly, towerLogic, gamePlayScreen);
                case TowerId.Haunter: return new Tower(textureHelper, textureHelper.Haunter, towerLogic, gamePlayScreen);
                case TowerId.Gengar: return new Tower(textureHelper, textureHelper.Gengar, towerLogic, gamePlayScreen);
                case TowerId.Makuhita: return new Tower(textureHelper, textureHelper.Makuhita, towerLogic, gamePlayScreen);
                case TowerId.Hariyama: return new Tower(textureHelper, textureHelper.Hariyama, towerLogic, gamePlayScreen);
                case TowerId.Koffing: return new Tower(textureHelper, textureHelper.Koffing, towerLogic, gamePlayScreen);
                case TowerId.Weezing: return new Tower(textureHelper, textureHelper.Weezing, towerLogic, gamePlayScreen);
                case TowerId.Wobbuffet: return new Tower(textureHelper, textureHelper.Wobbuffet, towerLogic, gamePlayScreen);
                case TowerId.Scyther: return new Tower(textureHelper, textureHelper.Scyther, towerLogic, gamePlayScreen);
                case TowerId.Scizor: return new Tower(textureHelper, textureHelper.Scizor, towerLogic, gamePlayScreen);
                case TowerId.Articuno: return new Tower(textureHelper, textureHelper.Articuno, towerLogic, gamePlayScreen);
                case TowerId.Groudon: return new Tower(textureHelper, textureHelper.Groudon, towerLogic, gamePlayScreen);
                default: throw new Exception($"Unknown tower id {towerLogic.Stats.Id}.");
            }
        }

        public static Projectile CreateProjectile(TextureHelper textureHelper, BaseProjectile projectile, string towerId)
        {
            switch (towerId)
            {
                case TowerId.Charmander:
                case TowerId.Charmeleon: 
                    return new Projectile(textureHelper.CharmanderProjectile, projectile);
                case TowerId.Charizard: 
                    return new Projectile(textureHelper.CharizardProjectile, projectile);
                case TowerId.Pichu:
                case TowerId.Pikachu:
                case TowerId.Raichu:
                    return new Projectile(textureHelper.PikachuProjectile, projectile);
                case TowerId.Pidgey:
                case TowerId.Pidgeotto:
                case TowerId.Pidgeot:
                    return new Projectile(textureHelper.PidgeyProjectile, projectile);
                case TowerId.Onix:
                case TowerId.Steelix:
                    return new Projectile(textureHelper.OnixProjectile, projectile);
                case TowerId.Magikarp:
                case TowerId.Gyarados: 
                    return new Projectile(textureHelper.MagikarpProjectile, projectile);
                case TowerId.Bagon:
                case TowerId.Shelgon:
                case TowerId.Salamence:
                case TowerId.Groudon:
                    return new Projectile(textureHelper.BagonProjectile, projectile);
                case TowerId.Exeggcute:
                case TowerId.Exeggutor:
                    return new Projectile(textureHelper.ExeggcuteProjectile, projectile);
                case TowerId.Poochyena:
                case TowerId.Mightyena:
                    return new Projectile(textureHelper.PoochyenaProjectile, projectile);
                case TowerId.Gastly:
                case TowerId.Haunter:
                case TowerId.Gengar:
                    return new Projectile(textureHelper.GastlyProjectile, projectile);
                case TowerId.Makuhita:
                case TowerId.Hariyama:
                    return new Projectile(textureHelper.MakuhitaProjectile, projectile);
                case TowerId.Koffing:
                case TowerId.Weezing:
                    return new Projectile(textureHelper.KoffingProjectile, projectile);
                case TowerId.Wobbuffet:
                    return new Projectile(textureHelper.WobbuffetProjectile, projectile);
                case TowerId.Scyther:
                case TowerId.Scizor:
                    return new Projectile(textureHelper.ScytherProjectile, projectile);
                case TowerId.Articuno:
                    return new Projectile(textureHelper.ArticunoProjectile, projectile);
                default: 
                    throw new Exception($"Unknown tower id {towerId}.");
            }
        }
    }
}
