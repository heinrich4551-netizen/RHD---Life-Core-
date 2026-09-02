#define RHD_POLICE_VERSION 0.1.0

class CfgPatches
{
    class rhd_police_equipment
    {
        name = "RHD - LifeCore | Police Equipment";
        author = "LT. Toad";
        requiredVersion = 2.14;
        requiredAddons[] = {
            "A3_Characters_F",
            "A3_Weapons_F"
        };
        units[] = {
            "RHD_Police_Officer"
        };
        weapons[] = {
            "RHD_Police_Uniform",
            "RHD_Police_Vest",
            "RHD_Police_Cap",
            "RHD_Police_Helmet"
        };
    };
};

class CfgWeapons
{
    class Uniform_Base;
    class UniformItem;
    class Vest_Base;
    class VestItem;
    class HeadgearItem;

    class RHD_Police_Uniform : Uniform_Base
    {
        scope = 2;
        scopeArsenal = 2;
        author = "LT. Toad";
        displayName = "RHD Police Uniform";
        picture = "\rhd_police_equipment\data\ui\rhd_police_uniform_ca.paa";
        model = "\A3\Characters_F\BLUFOR\b_soldier_01.p3d";

        class ItemInfo : UniformItem
        {
            uniformModel = "\A3\Characters_F\BLUFOR\b_soldier_01.p3d";
            uniformClass = "RHD_Police_Officer";
            containerClass = "Supply40";
            mass = 40;
        };
    };

    class RHD_Police_Vest : Vest_Base
    {
        scope = 2;
        scopeArsenal = 2;
        author = "LT. Toad";
        displayName = "RHD Police Modular Carrier | Option 06";
        picture = "\rhd_police_equipment\data\ui\rhd_police_vest_ca.paa";
        model = "\A3\Characters_F\BLUFOR\equip_b_vest02.p3d";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\rhd_police_equipment\data\textures\vest\rhd_police_option06_co.paa"};

        class ItemInfo : VestItem
        {
            uniformModel = "\A3\Characters_F\BLUFOR\equip_b_vest02.p3d";
            containerClass = "Supply100";
            mass = 45;
            armor = 25;
            passThrough = 0.7;
        };
    };

    class RHD_Police_Cap : HeadgearItem
    {
        scope = 2;
        scopeArsenal = 2;
        author = "LT. Toad";
        displayName = "RHD Police Cap";
        model = "\A3\Characters_F\BLUFOR\headgear_b_cap_01.p3d";
        picture = "\rhd_police_equipment\data\ui\rhd_police_cap_ca.paa";

        class ItemInfo
        {
            mass = 6;
            uniformModel = "\A3\Characters_F\BLUFOR\headgear_b_cap_01.p3d";
            modelSides[] = {3, 2};
        };
    };

    class RHD_Police_Helmet : HeadgearItem
    {
        scope = 2;
        scopeArsenal = 2;
        author = "LT. Toad";
        displayName = "RHD Police Tactical Helmet";
        model = "\A3\Characters_F\BLUFOR\headgear_b_helmet_ballistic.p3d";
        picture = "\rhd_police_equipment\data\ui\rhd_police_helmet_ca.paa";

        class ItemInfo
        {
            mass = 30;
            uniformModel = "\A3\Characters_F\BLUFOR\headgear_b_helmet_ballistic.p3d";
            modelSides[] = {3, 2};
            armor = 10;
            passThrough = 0.5;
        };
    };
};

class CfgVehicles
{
    class B_Soldier_F;

    class RHD_Police_Officer : B_Soldier_F
    {
        scope = 1;
        scopeCurator = 0;
        author = "LT. Toad";
        displayName = "RHD Police Officer";
        uniformClass = "RHD_Police_Uniform";

        linkedItems[] = {
            "RHD_Police_Vest",
            "RHD_Police_Cap"
        };
        respawnLinkedItems[] = {
            "RHD_Police_Vest",
            "RHD_Police_Cap"
        };
    };
};

class CfgVehicles
{
    class ReammoBox_F;
    class RHD_Police_Equipment_Box : ReammoBox_F
    {
        scope = 2;
        scopeCurator = 2;
        author = "LT. Toad";
        displayName = "RHD Police Equipment Box";

        class TransportWeapons
        {
            class RHD_Police_Uniform
            {
                weapon = "RHD_Police_Uniform";
                count = 10;
            };
            class RHD_Police_Vest
            {
                weapon = "RHD_Police_Vest";
                count = 10;
            };
            class RHD_Police_Cap
            {
                weapon = "RHD_Police_Cap";
                count = 10;
            };
            class RHD_Police_Helmet
            {
                weapon = "RHD_Police_Helmet";
                count = 10;
            };
        };
    };
};
