class CfgPatches
{
    class rhd_clothing
    {
        name = "RHD - LifeCore Clothing";
        author = "LT. Toad";
        requiredVersion = 2.20;
        requiredAddons[] = {"A3_Characters_F", "rhd_lifecore"};
        weapons[] = {
            // Civilian / workwear combined outfits
            "RHD_Outfit_TShirt_Tan_Casual",
            "RHD_Outfit_TShirt_Olive_Casual",
            "RHD_Outfit_TShirt_Black_Casual",
            "RHD_Outfit_Polo_White_Casual",
            "RHD_Outfit_Polo_Burgundy_Casual",
            "RHD_Outfit_Polo_Blue_Casual",
            "RHD_Outfit_Polo_Yellow_Casual",
            "RHD_Outfit_Polo_Striped_Casual",
            "RHD_Outfit_Field_Hunter_Green",
            "RHD_Outfit_Field_Hunter_Brown",
            "RHD_Outfit_Workwear_Poor_01",
            "RHD_Outfit_Workwear_Poor_02",
            "RHD_Outfit_Mechanic_Coveralls",

            // Tactical / field outfits
            "RHD_Outfit_Tactical_Black",
            "RHD_Outfit_Tactical_Olive",
            "RHD_Outfit_Tactical_Tan",
            "RHD_Outfit_Tactical_Grey",
            "RHD_Outfit_Tactical_Camo",
            "RHD_Outfit_Tactical_Patrol",
            "RHD_Outfit_Tactical_Contractor",
            "RHD_Outfit_Tactical_Field",
            "RHD_Outfit_Tactical_Worker",

            // RHD tactical vests — 250-load utility line
            "RHD_Vest_Plate_Ranger",
            "RHD_Vest_Plate_Multicam",
            "RHD_Vest_Plate_Black",
            "RHD_Vest_Plate_Tan",
            "RHD_Vest_Plate_Grey",
            "RHD_Vest_Plate_Woodland",
            "RHD_Vest_Medic",
            "RHD_Vest_Police",
            "RHD_Vest_Security",
            "RHD_Vest_SOF",
            "RHD_Vest_Utility",
            "RHD_Vest_Comms",
            "RHD_Vest_LMG",
            "RHD_Vest_Marksman",
            "RHD_Vest_Contractor",
            "RHD_Vest_Executive"
        };
        units[] = {};
    };
};

class CfgWeapons
{
    // =====================================================================
    // BASE-GAME CIVILIAN / WORKWEAR
    // =====================================================================
    class U_C_Poloshirt_white;
    class U_C_Poloshirt_blue;
    class U_C_Poloshirt_burgundy;
    class U_C_Poloshirt_yellow;
    class U_C_Poloshirt_stripped;
    class U_C_Man_casual_1_F;
    class U_C_Poor_1;
    class U_C_Poor_2;
    class U_C_HunterBody_grn;
    class U_C_HunterBody_brn;
    class U_C_WorkerCoveralls;

    class RHD_Outfit_TShirt_Tan_Casual: U_C_Poloshirt_white
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | T-Shirt Tan + Casual Pants";
        descriptionShort = "Civilian Life RP outfit using base-game uniform assets.";
        hiddenSelectionsTextures[] = {"#(rgb,8,8,3)color(0.62,0.50,0.34,1)"};
    };

    class RHD_Outfit_TShirt_Olive_Casual: U_C_Poloshirt_white
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | T-Shirt Olive + Casual Pants";
        descriptionShort = "Civilian Life RP outfit using base-game uniform assets.";
        hiddenSelectionsTextures[] = {"#(rgb,8,8,3)color(0.30,0.35,0.23,1)"};
    };

    class RHD_Outfit_TShirt_Black_Casual: U_C_Poloshirt_white
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | T-Shirt Black + Casual Pants";
        descriptionShort = "Civilian Life RP outfit using base-game uniform assets.";
        hiddenSelectionsTextures[] = {"#(rgb,8,8,3)color(0.07,0.07,0.07,1)"};
    };

    class RHD_Outfit_Polo_White_Casual: U_C_Man_casual_1_F
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Polo White + Casual Pants";
        descriptionShort = "Civilian polo-and-pants outfit using base-game assets.";
    };

    class RHD_Outfit_Polo_Burgundy_Casual: U_C_Poloshirt_burgundy
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Polo Burgundy + Casual Pants";
    };

    class RHD_Outfit_Polo_Blue_Casual: U_C_Poloshirt_blue
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Polo Blue + Casual Pants";
    };

    class RHD_Outfit_Polo_Yellow_Casual: U_C_Poloshirt_yellow
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Polo Yellow + Casual Pants";
    };

    class RHD_Outfit_Polo_Striped_Casual: U_C_Poloshirt_stripped
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Polo Striped + Casual Pants";
    };

    class RHD_Outfit_Field_Hunter_Green: U_C_HunterBody_grn
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Field Shirt + Hunter Green Pants";
        descriptionShort = "Field/work outfit using the Arma 3 hunter green uniform.";
    };

    class RHD_Outfit_Field_Hunter_Brown: U_C_HunterBody_brn
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Field Shirt + Hunter Brown Pants";
        descriptionShort = "Field/work outfit using the Arma 3 hunter brown uniform.";
    };

    class RHD_Outfit_Workwear_Poor_01: U_C_Poor_1
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Work Shirt + Work Pants 01";
        descriptionShort = "Civilian labor outfit for general work roles.";
    };

    class RHD_Outfit_Workwear_Poor_02: U_C_Poor_2
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Work Shirt + Work Pants 02";
        descriptionShort = "Civilian labor outfit for general work roles.";
    };

    class RHD_Outfit_Mechanic_Coveralls: U_C_WorkerCoveralls
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Mechanic Coveralls";
        descriptionShort = "Industrial/mechanic outfit using the stock worker coverall model.";
    };

    // =====================================================================
    // BASE-GAME TACTICAL / FIELD
    // =====================================================================
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
        descriptionShort = "Low-visibility tactical outfit for security, contractors and armed civilians.";
    };

    class RHD_Outfit_Tactical_Olive: U_BG_Guerilla2_1
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Olive";
        descriptionShort = "Olive field outfit for patrol and security roles.";
    };

    class RHD_Outfit_Tactical_Tan: U_BG_Guerilla2_2
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Tan";
        descriptionShort = "Tan field outfit for rural and contractor roles.";
    };

    class RHD_Outfit_Tactical_Grey: U_BG_Guerilla2_3
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Grey";
        descriptionShort = "Grey utility outfit for urban security and contractor roles.";
    };

    class RHD_Outfit_Tactical_Camo: U_BG_Guerilla3_1
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Camo";
        descriptionShort = "Camouflaged field outfit using base-game guerilla clothing.";
    };

    class RHD_Outfit_Tactical_Patrol: U_BG_Guerilla3_2
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Tactical | Patrol";
        descriptionShort = "Utility patrol outfit for field security and rural operations.";
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

    // =====================================================================
    // RHD 16-VEST LINE
    // Inspired by the supplied modular plate-carrier / chest-rig reference.
    // Each vest exposes 250 cargo-load units. RHD_PouchSlots is metadata for
    // the RHD virtual-pouch system: each pouch is one-item, zero-extra-weight.
    // Vanilla Arma still applies item mass when items are physically placed in
    // the carrier; the RHD pouch metadata is intentionally separate from that.
    // =====================================================================
    class V_PlateCarrier1_rgr;
    class V_PlateCarrier2_rgr;
    class V_PlateCarrierSpec_rgr;
    class V_PlateCarrierGL_rgr;
    class V_PlateCarrierIA1_dgtl;
    class V_PlateCarrierIA2_dgtl;
    class V_TacVest_oli;
    class V_TacVest_khk;
    class V_TacVest_blk;
    class V_TacVest_camo;
    class V_HarnessO_brn;
    class V_HarnessOGL_brn;
    class V_HarnessO_gry;
    class V_HarnessOGL_gry;
    class V_PlateCarrier3_rgr;
    class V_PlateCarrierL_CTRG;

    class RHD_Vest_Plate_Ranger: V_PlateCarrier1_rgr
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Plate Carrier Ranger";
        descriptionShort = "RHD modular ranger plate carrier with front rifle pouches, side sustainment pouches and admin pouch.";
        maximumLoad = 250;
        mass = 40;
        RHD_PouchSlots[] = {"magazine","magazine","magazine","radio","utility","medical","grenade","tool"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Plate_Multicam: V_PlateCarrier2_rgr
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Plate Carrier Multi-Terrain";
        descriptionShort = "Full-coverage multi-terrain carrier with extended side pouches and front admin pack.";
        maximumLoad = 250;
        mass = 42;
        RHD_PouchSlots[] = {"magazine","magazine","magazine","magazine","radio","medical","utility","grenade","tool"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Plate_Black: V_PlateCarrierSpec_rgr
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Plate Carrier Black";
        descriptionShort = "Low-visibility heavy carrier for security, tactical response and urban operations.";
        maximumLoad = 250;
        mass = 44;
        RHD_PouchSlots[] = {"magazine","magazine","magazine","radio","radio","medical","utility","tool"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Plate_Tan: V_PlateCarrier2_rgr
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Plate Carrier Tan";
        descriptionShort = "Tan plate carrier tuned for contractors and arid-zone operations.";
        maximumLoad = 250;
        mass = 42;
        RHD_PouchSlots[] = {"magazine","magazine","magazine","radio","utility","medical","grenade","tool"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Plate_Grey: V_TacVest_blk
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Plate Carrier Grey";
        descriptionShort = "Compact urban carrier with modular front chest rig and side pouches.";
        maximumLoad = 250;
        mass = 38;
        RHD_PouchSlots[] = {"magazine","magazine","radio","radio","medical","utility","tool"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Plate_Woodland: V_PlateCarrierIA1_dgtl
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Plate Carrier Woodland";
        descriptionShort = "Woodland-pattern carrier with broad MOLLE-compatible utility coverage.";
        maximumLoad = 250;
        mass = 42;
        RHD_PouchSlots[] = {"magazine","magazine","magazine","radio","medical","utility","grenade","tool"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Medic: V_PlateCarrierGL_rgr
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Combat Medic";
        descriptionShort = "Medical carrier emphasizing dedicated aid and utility pouches.";
        maximumLoad = 250;
        mass = 40;
        RHD_PouchSlots[] = {"medical","medical","medical","radio","magazine","utility","tool","utility"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Police: V_TacVest_oli
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Police Patrol";
        descriptionShort = "Law-enforcement patrol vest with radio, magazine, restraint and utility pouch layout.";
        maximumLoad = 250;
        mass = 36;
        RHD_PouchSlots[] = {"magazine","magazine","radio","restraint","medical","utility","tool","utility"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Security: V_TacVest_khk
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Security";
        descriptionShort = "Private security carrier with discreet radio and utility pouches.";
        maximumLoad = 250;
        mass = 34;
        RHD_PouchSlots[] = {"magazine","magazine","radio","radio","medical","utility","tool"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_SOF: V_PlateCarrier3_rgr
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Special Operations";
        descriptionShort = "Dense modular plate carrier for high-tempo tactical loadouts.";
        maximumLoad = 250;
        mass = 45;
        RHD_PouchSlots[] = {"magazine","magazine","magazine","magazine","radio","medical","grenade","utility","tool"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Utility: V_HarnessO_brn
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Utility";
        descriptionShort = "Work-ready harness with large general-purpose pouches for civilian and industrial roles.";
        maximumLoad = 250;
        mass = 30;
        RHD_PouchSlots[] = {"utility","utility","tool","radio","medical","magazine","magazine"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Comms: V_PlateCarrierIA2_dgtl
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Communications";
        descriptionShort = "Communications-focused carrier with dual radio and cable-management pouches.";
        maximumLoad = 250;
        mass = 39;
        RHD_PouchSlots[] = {"radio","radio","radio","magazine","medical","utility","tool","utility"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_LMG: V_HarnessOGL_brn
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Support Gunner";
        descriptionShort = "Support-gunner rig with expanded ammunition and sustainment pouch coverage.";
        maximumLoad = 250;
        mass = 40;
        RHD_PouchSlots[] = {"magazine","magazine","magazine","magazine","magazine","radio","utility","medical"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Marksman: V_HarnessO_gry
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Marksman";
        descriptionShort = "Lean reconnaissance carrier with balanced ammunition, radio and sustainment storage.";
        maximumLoad = 250;
        mass = 33;
        RHD_PouchSlots[] = {"magazine","magazine","radio","medical","utility","tool","grenade"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Contractor: V_PlateCarrierL_CTRG
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Contractor";
        descriptionShort = "Private contractor carrier combining rifle, communications and utility pouches.";
        maximumLoad = 250;
        mass = 37;
        RHD_PouchSlots[] = {"magazine","magazine","magazine","radio","medical","utility","tool","grenade"};
        RHD_PouchCapacity = 1;
    };

    class RHD_Vest_Executive: V_TacVest_camo
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Vest | Executive Protection";
        descriptionShort = "Low-profile protective vest for VIP and executive-security roles.";
        maximumLoad = 250;
        mass = 32;
        RHD_PouchSlots[] = {"magazine","radio","radio","medical","restraint","utility","tool"};
        RHD_PouchCapacity = 1;
    };
};
