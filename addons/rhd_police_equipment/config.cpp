#define RHD_POLICE_VERSION "0.1.0-design"

class CfgPatches
{
    class rhd_police_equipment
    {
        name = "RHD - LifeCore | Police Equipment";
        author = "LT. Toad";
        requiredVersion = 2.20;
        requiredAddons[] =
        {
            "rhd_lifecore",
            "A3_Characters_F",
            "A3_Weapons_F"
        };
        units[] =
        {
            "RHD_Police_Officer"
        };
        weapons[] =
        {
            "RHD_Police_Uniform",
            "RHD_Police_Vest",
            "RHD_Police_Vest_Patrol",
            "RHD_Police_Vest_Tactical",
            "RHD_Police_Vest_Supervisor",
            "RHD_Police_Vest_Response",
            "RHD_Police_DutyBelt",
            "RHD_Police_Cap",
            "RHD_Police_Helmet",
            "RHD_Police_Radio"
        };
    };
};

class CfgFactionClasses
{
    class RHD_LifeCore_Police
    {
        displayName = "RHD - LifeCore | Police";
        priority = 1;
        side = 1;
    };
};

class CfgWeapons
{
    class Uniform_Base;
    class UniformItem;
    class Vest_Base;
    class VestItem;
    class HeadgearItem;
    class ItemCore;

    // Design-phase placeholders. Final model paths and hiddenSelections are intentionally
    // omitted until the reference option is selected and the P3D is finalized.

    class RHD_Police_Uniform : Uniform_Base
    {
        scope = 1;
        displayName = "RHD Police Uniform (Design)";
        author = "LT. Toad";
        class ItemInfo : UniformItem
        {
            uniformClass = "RHD_Police_Officer";
            containerClass = "Supply40";
            mass = 40;
        };
    };

    class RHD_Police_Vest : Vest_Base
    {
        scope = 1;
        displayName = "RHD Police Modular Carrier (Design)";
        author = "LT. Toad";
        class ItemInfo : VestItem
        {
            containerClass = "Supply100";
            mass = 45;
            armor = 25;
            passThrough = 0.70;
        };
    };

    class RHD_Police_Vest_Patrol : RHD_Police_Vest
    {
        scope = 1;
        displayName = "RHD Police Carrier | Patrol";
    };

    class RHD_Police_Vest_Tactical : RHD_Police_Vest
    {
        scope = 1;
        displayName = "RHD Police Carrier | Tactical";
    };

    class RHD_Police_Vest_Supervisor : RHD_Police_Vest
    {
        scope = 1;
        displayName = "RHD Police Carrier | Supervisor";
    };

    class RHD_Police_Vest_Response : RHD_Police_Vest
    {
        scope = 1;
        displayName = "RHD Police Carrier | Response";
    };

    class RHD_Police_DutyBelt : Vest_Base
    {
        scope = 1;
        displayName = "RHD Police Duty Belt (Design)";
        author = "LT. Toad";
    };

    class RHD_Police_Cap : ItemCore
    {
        scope = 1;
        displayName = "RHD Police Cap (Design)";
        author = "LT. Toad";
        class ItemInfo : HeadgearItem
        {
            mass = 6;
        };
    };

    class RHD_Police_Helmet : ItemCore
    {
        scope = 1;
        displayName = "RHD Police Tactical Helmet (Design)";
        author = "LT. Toad";
        class ItemInfo : HeadgearItem
        {
            mass = 30;
            armor = 10;
            passThrough = 0.50;
        };
    };

    class RHD_Police_Radio : ItemCore
    {
        scope = 1;
        displayName = "RHD Police Radio (Design)";
        author = "LT. Toad";
    };
};

class CfgVehicles
{
    class B_Soldier_F;

    class RHD_Police_Officer : B_Soldier_F
    {
        scope = 1;
        displayName = "RHD Police Officer (Design)";
        faction = "RHD_LifeCore_Police";
        uniformClass = "RHD_Police_Uniform";
    };
};
