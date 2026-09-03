#define RHD_VERSION_TEXT "2.2.2"

class CfgPatches
{
    class rhd_lifecore
    {
        name = "RHD - LifeCore";
        author = "LT. Toad";
        requiredVersion = 2.20;
        requiredAddons[] = {"cba_main", "ctab_core", "A3A_core"};
        units[] = {"RHD_Module_AntistasiBase","RHD_Module_LifeCore"};
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
            // Relative paths keep the addon self-contained inside its PBO.
            file = "functions/modules";
            class moduleAntistasiBase {};
            class moduleLifeCore {};
            class dynamicLocations {server = 1;};
            class dynamicLocationSync {server = 1;};
            class terrainAudit {server = 1;};
            class terrainFallback {};
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
        displayName = "RHD - LifeCore | Antistasi Ultimate Bridge";
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
                displayName = "Start / Bridge Antistasi Ultimate";
                tooltip = "The RHD Workshop scenario requires Antistasi Ultimate and bridges RHD to the installed A3A campaign.";
                property = "RHD_A3A_AutoStart";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_A3A_AutoStart', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };
            class RHD_A3A_CreateHQ
            {
                displayName = "Create Antistasi HQ Anchors";
                tooltip = "Creates host anchors at the Eden module location for the RHD/A3A bridge.";
                property = "RHD_A3A_CreateHQ";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_A3A_CreateHQ', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };
            class RHD_A3A_TerrainFallback
            {
                displayName = "Enable Antistasi Terrain Adapter";
                tooltip = "Applies the RHD terrain adapter before the A3A campaign starts when needed.";
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
                tooltip = "Enables the virtual market plus dynamic vehicle/equipment catalogues.";
                property = "RHD_EnableEconomy"; control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableEconomy', _value, true]";
                defaultValue = "true"; typeName = "BOOL";
            };
            class RHD_EnableJobs
            {
                displayName = "Enable Jobs";
                tooltip = "Enables civilian, farmer, miner, refiner, police and EMS jobs.";
                property = "RHD_EnableJobs"; control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableJobs', _value, true]";
                defaultValue = "true"; typeName = "BOOL";
            };
            class RHD_EnableIndustry
            {
                displayName = "Enable Farming / Mining / Refining";
                tooltip = "Enables gathering and refining at Eden-configured locations.";
                property = "RHD_EnableIndustry"; control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableIndustry', _value, true]";
                defaultValue = "true"; typeName = "BOOL";
            };
            class RHD_EnableRP
            {
                displayName = "Enable Police / EMS / RP";
                tooltip = "Enables Life RP services, tickets, treatment and dispatch.";
                property = "RHD_EnableRP"; control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableRP', _value, true]";
                defaultValue = "true"; typeName = "BOOL";
            };
            class RHD_EnablePersistence
            {
                displayName = "Enable Life RP Persistence";
                tooltip = "Saves RHD cash, bank, job and virtual inventory server-side.";
                property = "RHD_EnablePersistence"; control = "Checkbox";
                expression = "_this setVariable ['RHD_EnablePersistence', _value, true]";
                defaultValue = "true"; typeName = "BOOL";
            };
            class RHD_EnableAmbient
            {
                displayName = "Enable Ambient Life";
                tooltip = "Enables RHD civilian traffic and roadside incident behavior.";
                property = "RHD_EnableAmbient"; control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableAmbient', _value, true];";
                defaultValue = "true"; typeName = "BOOL";
            };
            class RHD_EnableBranding
            {
                displayName = "Enable RHD Billboard Branding";
                tooltip = "Applies the supplied RHD artwork to supported Land_Billboard_F objects.";
                property = "RHD_EnableBranding"; control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableBranding', _value, true];";
                defaultValue = "true"; typeName = "BOOL";
            };
            class RHD_EnableTablet
            {
                displayName = "Enable cTab Player Tablet";
                tooltip = "Uses the required cTab+ tablet surface for the RHD player interface.";
                property = "RHD_EnableTablet"; control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableTablet', _value, true];";
                defaultValue = "true"; typeName = "BOOL";
            };
            class RHD_EnableConflict
            {
                displayName = "Enable Life District Pressure";
                tooltip = "Enables civilian crime/heat pressure around rhd_zone_* markers.";
                property = "RHD_EnableConflict"; control = "Checkbox";
                expression = "_this setVariable ['RHD_EnableConflict', _value, true];";
                defaultValue = "true"; typeName = "BOOL";
            };
        };
    };
};
