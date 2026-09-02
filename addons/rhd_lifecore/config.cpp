#define RHD_VERSION_TEXT "2.1.0-A3A"

class CfgPatches
{
    class rhd_lifecore
    {
        name = "RHD - LifeCore";
        author = "LT. Toad";
        requiredVersion = 2.14;
        requiredAddons[] = {"A3A_core", "cba_main", "ace_main", "ctab_core"};
        units[] = {
            "RHD_Module_AntistasiBase",
            "RHD_Module_LifeCore"
        };
        weapons[] = {};
    };
};

class CfgFactionClasses
{
    class RHD_LifeCore
    {
        displayName = "RHD - LifeCore";
        priority = 1;
        side = 7;
    };
};

class CfgFunctions
{
    class RHD
    {
        class Modules
        {
            file = "\rhd_lifecore\functions\modules";
            class moduleAntistasiBase {};
            class moduleLifeCore {};
        };
    };
};

class CfgVehicles
{
    class Module_F;

    class RHD_Module_AntistasiBase: Module_F
    {
        scope = 2;
        scopeCurator = 2;
        displayName = "RHD - LifeCore | Antistasi Ultimate Base";
        icon = "iconObjectCircle";
        portrait = "iconObjectCircle";
        category = "RHD_LifeCore";
        function = "RHD_fnc_moduleAntistasiBase";
        isGlobal = 1;
        isTriggerActivated = 1;
        author = "LT. Toad";

        class Attributes
        {
            class RHD_A3A_AutoStart
            {
                displayName = "Start Antistasi Campaign";
                tooltip = "Starts the Antistasi Ultimate campaign engine from this mission module.";
                property = "RHD_A3A_AutoStart";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_A3A_AutoStart', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };

            class RHD_A3A_CreateHQ
            {
                displayName = "Create Safe HQ Anchors";
                tooltip = "Creates the editor-independent HQ anchor objects required by Antistasi. They are repositioned by A3A when the campaign starts.";
                property = "RHD_A3A_CreateHQ";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_A3A_CreateHQ', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };

            class RHD_A3A_TerrainFallback
            {
                displayName = "Enable Generic Terrain Fallback";
                tooltip = "Installs the RHD terrain adapter before campaign startup so unsupported terrain data can fall back to generic Arma detection.";
                property = "RHD_A3A_TerrainFallback";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_A3A_TerrainFallback', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };
        };
    };

    class RHD_Module_LifeCore: Module_F
    {
        scope = 2;
        scopeCurator = 2;
        displayName = "RHD - LifeCore | Life RP Systems";
        icon = "iconObjectCircle";
        portrait = "iconObjectCircle";
        category = "RHD_LifeCore";
        function = "RHD_fnc_moduleLifeCore";
        isGlobal = 1;
        isTriggerActivated = 1;
        author = "LT. Toad";

        class Attributes
        {
            class RHD_EnableEconomy
            {
                displayName = "Enable Economy / Shops";
                tooltip = "Enables RHD virtual shops plus the dynamic base/mod vehicle and equipment catalogue.";
                property = "RHD_EnableEconomy";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableEconomy', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };

            class RHD_EnableJobs
            {
                displayName = "Enable Jobs";
                tooltip = "Enables the civilian, farmer, miner, refiner, police and EMS job systems.";
                property = "RHD_EnableJobs";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableJobs', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };

            class RHD_EnableIndustry
            {
                displayName = "Enable Farming / Mining / Refining";
                tooltip = "Enables RHD gathering and refining features configured by Eden markers.";
                property = "RHD_EnableIndustry";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableIndustry', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };

            class RHD_EnableRP
            {
                displayName = "Enable Police / EMS / RP";
                tooltip = "Enables Life RP services, tickets, medical actions and dispatch systems.";
                property = "RHD_EnableRP";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableRP', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };

            class RHD_EnablePersistence
            {
                displayName = "Enable Life RP Persistence";
                tooltip = "Saves and loads RHD cash, bank, job and inventory independently from the Antistasi campaign save.";
                property = "RHD_EnablePersistence";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_EnablePersistence', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };

            class RHD_EnableAmbient
            {
                displayName = "Enable Ambient Life";
                tooltip = "Enables RHD civilian traffic and small roadside incidents.";
                property = "RHD_EnableAmbient";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableAmbient', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };

            class RHD_EnableBranding
            {
                displayName = "Enable RHD Billboard Branding";
                tooltip = "Automatically applies the RHD - LifeCore artwork to normal Land_Billboard_F objects.";
                property = "RHD_EnableBranding";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableBranding', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };

            class RHD_EnableTablet
            {
                displayName = "Enable cTab Player Tablet";
                tooltip = "Adds the RHD player tablet to ACE Self Actions.";
                property = "RHD_EnableTablet";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableTablet', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };

            class RHD_EnableConflict
            {
                displayName = "Enable Life District Pressure";
                tooltip = "Enables RHD-only civilian crime pressure around rhd_zone_* markers; strategic control remains A3A-owned.";
                property = "RHD_EnableConflict";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableConflict', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };
        };
    };
};
