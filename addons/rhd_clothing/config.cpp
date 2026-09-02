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
            "RHD_Outfit_Tactical_Worker"
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
};
