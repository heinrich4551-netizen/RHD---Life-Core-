class CfgPatches
{
    class rhd_gsri_compat
    {
        name = "RHD - LifeCore | GSRI Gear Compatibility";
        author = "LT. Toad / GSRI integration";
        requiredVersion = 2.20;
        requiredAddons[] = {"gsri_equipment"};
        units[] = {};
        weapons[] = {};
    };
};

/*
    RHD curated GSRI catalog.
    The source GSRI addon remains the provider of the actual models/textures.
    This PBO supplies RHD/ACE Arsenal Extended categorisation only; it does not
    duplicate third-party PAA/P3D binaries.
*/
class XtdGearModels
{
    class CfgWeapons
    {
        class RHD_GSRI_Uniform
        {
            label = "GSRI Uniform";
            author = "GSRI";
            options[] = {"variant"};
            class variant
            {
                label = "Variant";
                values[] = {"Combat", "Rolled", "Raised Collar", "Shirt", "Gorka"};
                class Combat {label = "Combat";};
                class Rolled {label = "Rolled Sleeves";};
                class {Raised_Collar} {label = "Raised Collar";};
                class Shirt {label = "Shirt";};
                class Gorka {label = "Gorka";};
            };
        };
        class RHD_GSRI_Headgear
        {
            label = "GSRI Headgear";
            author = "GSRI";
            options[] = {"type"};
            class type
            {
                label = "Type";
                values[] = {"Helmet", "Helmet Accessories", "Light Helmet", "Modular", "Modular Advanced", "Modular Half Integral", "Modular Integral", "Beret", "Watchcap"};
            };
        };
        class RHD_GSRI_Vest
        {
            label = "GSRI Vest";
            author = "GSRI";
            options[] = {"type"};
            class type
            {
                label = "Type";
                values[] = {"Carrier", "Carrier Light", "Modular", "Modular Accessories", "Modular Reinforced", "GA Carrier", "BME Carrier", "BME Modular"};
            };
        };
    };
    class CfgVehicles
    {
        class RHD_GSRI_Backpack
        {
            label = "GSRI Backpack";
            author = "GSRI";
            options[] = {"size", "pattern"};
            class size
            {
                label = "Size";
                values[] = {"Assault", "Tactical", "Kitbag", "Carryall"};
            };
            class pattern
            {
                label = "Pattern";
                values[] = {"GSRI", "BME"};
            };
        };
    };
};

class XtdGearInfos
{
    class CfgWeapons
    {
        class GSRI_uniform
        {
            model = "RHD_GSRI_Uniform";
            variant = "Combat";
        };
        class GSRI_uniform_rolled
        {
            model = "RHD_GSRI_Uniform";
            variant = "Rolled";
        };
        class GSRI_uniform_raised_collar
        {
            model = "RHD_GSRI_Uniform";
            variant = "Raised Collar";
        };
        class GSRI_shirt_camo
        {
            model = "RHD_GSRI_Uniform";
            variant = "Shirt";
        };
        class GSRI_shirt_green
        {
            model = "RHD_GSRI_Uniform";
            variant = "Shirt";
        };
        class GSRI_gorka_camo
        {
            model = "RHD_GSRI_Uniform";
            variant = "Gorka";
        };
        class GSRI_gorka_green
        {
            model = "RHD_GSRI_Uniform";
            variant = "Gorka";
        };

        class GSRI_beret { model = "RHD_GSRI_Headgear"; type = "Beret"; };
        class GSRI_beret_gcap { model = "RHD_GSRI_Headgear"; type = "Beret"; };
        class H_watchcap_wht { model = "RHD_GSRI_Headgear"; type = "Watchcap"; };
        class GSRI_helmet { model = "RHD_GSRI_Headgear"; type = "Helmet"; };
        class GSRI_helmet_spec { model = "RHD_GSRI_Headgear"; type = "Helmet Accessories"; };
        class GSRI_helmet_light { model = "RHD_GSRI_Headgear"; type = "Light Helmet"; };
        class GSRI_helmet_modular { model = "RHD_GSRI_Headgear"; type = "Modular"; };
        class GSRI_helmet_modular_advanced { model = "RHD_GSRI_Headgear"; type = "Modular Advanced"; };
        class GSRI_helmet_modular_halfintegral { model = "RHD_GSRI_Headgear"; type = "Modular Half Integral"; };
        class GSRI_helmet_modular_integral { model = "RHD_GSRI_Headgear"; type = "Modular Integral"; };
        class GSRI_helmet_bme { model = "RHD_GSRI_Headgear"; type = "Helmet"; };
        class GSRI_helmet_bme_spec { model = "RHD_GSRI_Headgear"; type = "Helmet Accessories"; };
        class GSRI_helmet_bme_light { model = "RHD_GSRI_Headgear"; type = "Light Helmet"; };
        class GSRI_helmet_modular_bme { model = "RHD_GSRI_Headgear"; type = "Modular"; };

        class GSRI_vest_carrier { model = "RHD_GSRI_Vest"; type = "Carrier"; };
        class GSRI_vest_carrier_lite { model = "RHD_GSRI_Vest"; type = "Carrier Light"; };
        class GSRI_vest_modular { model = "RHD_GSRI_Vest"; type = "Modular"; };
        class GSRI_vest_modular_accessories { model = "RHD_GSRI_Vest"; type = "Modular Accessories"; };
        class GSRI_vest_modular_reinforced { model = "RHD_GSRI_Vest"; type = "Modular Reinforced"; };
        class GSRI_vest_ga_carrier_lite { model = "RHD_GSRI_Vest"; type = "GA Carrier"; };
        class GSRI_vest_ga_carrier { model = "RHD_GSRI_Vest"; type = "GA Carrier"; };
        class GSRI_vest_carrier_bme { model = "RHD_GSRI_Vest"; type = "BME Carrier"; };
        class GSRI_vest_carrier_bme_lite { model = "RHD_GSRI_Vest"; type = "BME Carrier"; };
        class GSRI_vest_modular_bme { model = "RHD_GSRI_Vest"; type = "BME Modular"; };
    };

    class CfgVehicles
    {
        class GSRI_AssaultPack { model = "RHD_GSRI_Backpack"; size = "Assault"; pattern = "GSRI"; };
        class GSRI_Kitbag { model = "RHD_GSRI_Backpack"; size = "Kitbag"; pattern = "GSRI"; };
        class GSRI_TacticalPack { model = "RHD_GSRI_Backpack"; size = "Tactical"; pattern = "GSRI"; };
        class GSRI_Carryall { model = "RHD_GSRI_Backpack"; size = "Carryall"; pattern = "GSRI"; };
        class GSRI_AssaultPack_bme { model = "RHD_GSRI_Backpack"; size = "Assault"; pattern = "BME"; };
        class GSRI_Kitbag_bme { model = "RHD_GSRI_Backpack"; size = "Kitbag"; pattern = "BME"; };
        class GSRI_TacticalPack_bme { model = "RHD_GSRI_Backpack"; size = "Tactical"; pattern = "BME"; };
        class GSRI_Carryall_bme { model = "RHD_GSRI_Backpack"; size = "Carryall"; pattern = "BME"; };
    };
};

class RHD_ContentCatalog
{
    class GSRI_Gear
    {
        displayName = "GSRI Gear";
        source = "https://github.com/Thibugs/GSRI-Gear";
        mirror = "https://github.com/team-gsri/mods-gear";
        providerAddon = "gsri_equipment";
        arsenalExtended = "https://github.com/jetelain/AceArsenalExtended";
        classes[] = {
            "GSRI_uniform", "GSRI_uniform_rolled", "GSRI_uniform_raised_collar",
            "GSRI_shirt_camo", "GSRI_shirt_green", "GSRI_gorka_camo", "GSRI_gorka_green",
            "GSRI_beret", "GSRI_beret_gcap", "H_watchcap_wht", "GSRI_helmet", "GSRI_helmet_spec",
            "GSRI_helmet_light", "GSRI_helmet_modular", "GSRI_helmet_modular_advanced",
            "GSRI_helmet_modular_halfintegral", "GSRI_helmet_modular_integral", "GSRI_helmet_bme",
            "GSRI_helmet_bme_spec", "GSRI_helmet_bme_light", "GSRI_helmet_modular_bme",
            "GSRI_vest_carrier", "GSRI_vest_carrier_lite", "GSRI_vest_modular",
            "GSRI_vest_modular_accessories", "GSRI_vest_modular_reinforced", "GSRI_vest_ga_carrier_lite",
            "GSRI_vest_ga_carrier", "GSRI_vest_carrier_bme", "GSRI_vest_carrier_bme_lite",
            "GSRI_vest_modular_bme", "GSRI_AssaultPack", "GSRI_Kitbag", "GSRI_TacticalPack",
            "GSRI_Carryall", "GSRI_AssaultPack_bme", "GSRI_Kitbag_bme", "GSRI_TacticalPack_bme",
            "GSRI_Carryall_bme"
        };
    };
};
