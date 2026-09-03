class CfgPatches
{
    class rhd_rciv_compat
    {
        name = "RHD - LifeCore | RCiv Compatibility";
        author = "LT. Toad";
        requiredVersion = 2.20;
        requiredAddons[] = {"cba_main", "A3A_core", "RCiv"};
        units[] = {};
        weapons[] = {};
    };
};

class CfgFunctions
{
    class RHD
    {
        class RCivCompat
        {
            file = "functions";
            class rcivAntistasiBridge {postInit = 1; server = 1;};
        };
    };
};
