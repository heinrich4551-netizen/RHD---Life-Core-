#include "version.hpp"

class CfgPatches
{
    class rhd_clothing
    {
        name = "RHD - LifeCore Clothing";
        author = "LT. Toad";
        requiredVersion = 2.20;
        requiredAddons[] = {"A3_Characters_F", "rhd_lifecore"};
        weapons[] = {
            "RHD_Outfit_Tactical_Black",
            "RHD_Outfit_Tactical_Olive",
            "RHD_Outfit_Tactical_Tan",
            "RHD_Outfit_Tactical_Grey",
            "RHD_Outfit_Tactical_Camo",
            "RHD_Outfit_Tactical_Patrol",
            "RHD_Outfit_Tactical_Contractor",
            "RHD_Outfit_Tactical_Field",
            "RHD_Outfit_Tactical_Worker"
        };
        units[] = {};
    };
};

class CfgWeapons
{
    // Base-game uniform parents only. No third-party clothing dependency.
    class U_BG_Guerilla1_1;
    class U_BG_Guerilla2_1;
    class U_BG_Guerilla2_2;
    class U_BG_Guerilla2_3;
    class U_BG_Guerilla3_1;
    class U_BG_Guerilla3_2;
    class U_IG_Guerilla2_2;
    class U_IG_Guerilla2_3;
    class U_IG_Guerilla3_1;

    class RHD_Outfit_Tactical_Black: U_BG_Guerilla1_1
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Black";
        descriptionShort = "Low-visibility tactical civilian/contractor outfit using Arma 3 base-game uniform assets.";
    };

    class RHD_Outfit_Tactical_Olive: U_BG_Guerilla2_1
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Olive";
        descriptionShort = "Olive tactical field outfit using Arma 3 base-game assets.";
    };

    class RHD_Outfit_Tactical_Tan: U_BG_Guerilla2_2
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Tan";
        descriptionShort = "Tan tactical field outfit using Arma 3 base-game assets.";
    };

    class RHD_Outfit_Tactical_Grey: U_BG_Guerilla2_3
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Grey";
        descriptionShort = "Grey tactical field outfit using Arma 3 base-game assets.";
    };

    class RHD_Outfit_Tactical_Camo: U_BG_Guerilla3_1
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Camo";
        descriptionShort = "Camouflaged tactical field outfit using Arma 3 base-game assets.";
    };

    class RHD_Outfit_Tactical_Patrol: U_BG_Guerilla3_2
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Patrol";
        descriptionShort = "Utility patrol outfit using Arma 3 base-game assets.";
    };

    class RHD_Outfit_Tactical_Contractor: U_IG_Guerilla2_2
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Contractor";
        descriptionShort = "Contractor-style tactical outfit for private security and armed civilian roles.";
    };

    class RHD_Outfit_Tactical_Field: U_IG_Guerilla2_3
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Field";
        descriptionShort = "General-purpose field outfit for expedition, security and rural roles.";
    };

    class RHD_Outfit_Tactical_Worker: U_IG_Guerilla3_1
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Utility Worker";
        descriptionShort = "Rugged utility outfit for industrial, mining and maintenance roles.";
    };
};
