class CfgPatches
{
    class rhd_backpacks
    {
        name = "RHD - LifeCore Backpacks";
        author = "LT. Toad";
        requiredVersion = 2.20;
        requiredAddons[] = {"A3_Characters_F"};
        units[] = {};
        weapons[] = {};
    };
};

class CfgVehicles
{
    class B_AssaultPack_khk;
    class B_AssaultPack_rgr;
    class B_AssaultPack_sgg;
    class B_AssaultPack_mcamo;
    class B_TacticalPack_blk;
    class B_TacticalPack_rgr;
    class B_TacticalPack_oli;
    class B_FieldPack_oli;
    class B_FieldPack_ocamo;
    class B_Kitbag_rgr;
    class B_Kitbag_cbr;
    class B_Carryall_khk;
    class B_Carryall_mcamo;
    class B_Carryall_oli;

    // 1
    class RHD_Bag_Ranger: B_AssaultPack_rgr
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Ranger Green";
        descriptionShort = "Compact modular tactical daypack in ranger green.";
        maximumLoad = 150;
        mass = 25;
    };

    // 2
    class RHD_Bag_Multicam: B_AssaultPack_mcamo
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Multi-Terrain";
        descriptionShort = "Modular field pack in multi-terrain camouflage.";
        maximumLoad = 150;
        mass = 25;
    };

    // 3
    class RHD_Bag_Black: B_TacticalPack_blk
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Black";
        descriptionShort = "Low-visibility tactical backpack for urban operations.";
        maximumLoad = 150;
        mass = 25;
    };

    // 4
    class RHD_Bag_Tan: B_AssaultPack_khk
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Coyote Tan";
        descriptionShort = "Arid-zone modular assault pack in coyote tan.";
        maximumLoad = 150;
        mass = 25;
    };

    // 5
    class RHD_Bag_Grey: B_AssaultPack_sgg
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Wolf Grey";
        descriptionShort = "Urban utility pack in subdued grey.";
        maximumLoad = 150;
        mass = 25;
    };

    // 6
    class RHD_Bag_Woodland: B_FieldPack_ocamo
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Woodland";
        descriptionShort = "Rugged woodland field pack for outdoor operations.";
        maximumLoad = 150;
        mass = 25;
    };

    // 7
    class RHD_Bag_Medic: B_TacticalPack_oli
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Medic";
        descriptionShort = "Medical-response pack with high-access utility profile.";
        maximumLoad = 150;
        mass = 25;
    };

    // 8
    class RHD_Bag_Police: B_AssaultPack_sgg
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Police";
        descriptionShort = "Patrol backpack for police and emergency services.";
        maximumLoad = 150;
        mass = 25;
    };

    // 9
    class RHD_Bag_Security: B_TacticalPack_blk
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Security";
        descriptionShort = "Private-security pack with modular utility profile.";
        maximumLoad = 150;
        mass = 25;
    };

    // 10
    class RHD_Bag_SOF: B_TacticalPack_rgr
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | SOF";
        descriptionShort = "Compact special-operations pack for extended field use.";
        maximumLoad = 150;
        mass = 25;
    };

    // 11
    class RHD_Bag_Utility: B_FieldPack_oli
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Utility";
        descriptionShort = "General-purpose industrial and civilian utility pack.";
        maximumLoad = 150;
        mass = 25;
    };

    // 12
    class RHD_Bag_Comms: B_Kitbag_rgr
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Comms";
        descriptionShort = "Communications-oriented field pack with modular organization.";
        maximumLoad = 150;
        mass = 25;
    };

    // 13
    class RHD_Bag_LMG: B_Kitbag_cbr
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | LMG Support";
        descriptionShort = "Heavy support pack suited to sustained ammunition carriage.";
        maximumLoad = 150;
        mass = 25;
    };

    // 14
    class RHD_Bag_Marksman: B_Carryall_khk
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Marksman";
        descriptionShort = "Expanded field pack for reconnaissance and marksman roles.";
        maximumLoad = 150;
        mass = 25;
    };

    // 15
    class RHD_Bag_Contractor: B_Carryall_mcamo
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Contractor";
        descriptionShort = "Contractor-style modular pack in multi-terrain camouflage.";
        maximumLoad = 150;
        mass = 25;
    };

    // 16
    class RHD_Bag_Executive: B_Carryall_oli
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Backpack | Executive";
        descriptionShort = "Discrete executive protection backpack with subdued utility styling.";
        maximumLoad = 150;
        mass = 25;
    };
};
