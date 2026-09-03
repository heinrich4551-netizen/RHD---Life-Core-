class CfgPatches
{
    class rhd_fpv_compat
    {
        name = "RHD - LifeCore | FPV Crocus Enhanced Compatibility";
        author = "LT. Toad / RHD integration";
        requiredVersion = 2.20;
        requiredAddons[] = {"rhd_lifecore", "BOT_FPV_Enhanced"};
        units[] = {};
        weapons[] = {};
    };
};

/*
    RHD integration for PlayerBotPro/FPV-Drone-Crocus-Enhanced.

    The FPV addon remains the provider of the actual drone models, textures,
    ammo, magazines and throwable implementation. RHD only adds the bridge:
      - stable RHD catalogue metadata for the FPV classes;
      - server-side shop price overrides;
      - RHD safe vehicle spawning, including the Antistasi Ultimate path;
      - F6/F7/F8-facing script functions without overwriting BOT_* functions.
*/
class RHD_ContentCatalog
{
    class FPV_Crocus_Enhanced
    {
        displayName = "FPV Crocus Enhanced";
        providerAddon = "BOT_FPV_Enhanced";
        source = "https://github.com/PlayerBotPro/FPV-Drone-Crocus-Enhanced/tree/test";
        classes[] = {
            "BOT_vehicle_B_FPV_AT_HD", "BOT_vehicle_B_FPV_AP_HD",
            "BOT_vehicle_O_FPV_AT_HD", "BOT_vehicle_O_FPV_AP_HD",
            "BOT_vehicle_I_FPV_AT_HD", "BOT_vehicle_I_FPV_AP_HD",
            "BOT_vehicle_C_FPV_AT_HD", "BOT_vehicle_C_FPV_AP_HD",
            "BOT_vehicle_B_FPV_AT_TI", "BOT_vehicle_B_FPV_AP_TI",
            "BOT_vehicle_O_FPV_AT_TI", "BOT_vehicle_O_FPV_AP_TI",
            "BOT_vehicle_I_FPV_AT_TI", "BOT_vehicle_I_FPV_AP_TI",
            "BOT_vehicle_C_FPV_AT_TI", "BOT_vehicle_C_FPV_AP_TI"
        };
        throwableClasses[] = {
            "BOT_magazine_FPV_AT_LD", "BOT_magazine_FPV_AP_LD",
            "BOT_magazine_FPV_AT_HD", "BOT_magazine_FPV_AP_HD",
            "BOT_magazine_FPV_AT_TI", "BOT_magazine_FPV_AP_TI"
        };
    };
};

class CfgFunctions
{
    class RHD
    {
        class FPV
        {
            file = "functions";
            class fpvInit {postInit = 1;};
            class fpvGetCatalog {};
            class fpvSpawn {};
        };
    };
};
