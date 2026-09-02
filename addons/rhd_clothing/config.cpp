#include "version.hpp"

class CfgPatches
{
    class rhd_clothing
    {
        name = "RHD - LifeCore Clothing";
        author = "LT. Toad";
        requiredVersion = 2.20;
        requiredAddons[] = {"A3_Characters_F", "rhd_lifecore"};
        weapons[] = {
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
            "RHD_Outfit_Mechanic_Coveralls"
        };
        units[] = {};
    };
};

class CfgWeapons
{
    // =====================================================================
    // RHD COMBINED CLOTHING
    // =====================================================================
    // Arma 3's vanilla uniform slot is a complete shirt/trouser/footwear
    // outfit. These entries intentionally expose complete combinations rather
    // than separate shirt and pants inventory items.

    class U_C_Poloshirt_white;
    class U_C_Poloshirt_blue;
    class U_C_Poloshirt_burgundy;
    class U_C_Poloshirt_yellow;
    class U_C_Poloshirt_stripped;
    class U_C_Man_casual_1_F;
    class U_C_Man_casual_2_F;
    class U_C_Man_casual_3_F;
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
        descriptionShort = "Complete RHD civilian outfit combining a tan casual top style with matching stock-game trousers.";
        hiddenSelectionsTextures[] = {"#(rgb,8,8,3)color(0.62,0.50,0.34,1)"};
    };

    class RHD_Outfit_TShirt_Olive_Casual: U_C_Poloshirt_white
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | T-Shirt Olive + Casual Pants";
        descriptionShort = "Complete RHD civilian outfit combining an olive casual top style with stock-game trousers.";
        hiddenSelectionsTextures[] = {"#(rgb,8,8,3)color(0.30,0.35,0.23,1)"};
    };

    class RHD_Outfit_TShirt_Black_Casual: U_C_Poloshirt_white
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | T-Shirt Black + Casual Pants";
        descriptionShort = "Complete RHD civilian outfit combining a black casual top style with stock-game trousers.";
        hiddenSelectionsTextures[] = {"#(rgb,8,8,3)color(0.07,0.07,0.07,1)"};
    };

    class RHD_Outfit_Polo_White_Casual: U_C_Man_casual_1_F
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Polo White + Casual Pants";
        descriptionShort = "Complete RHD civilian polo-and-pants outfit.";
    };

    class RHD_Outfit_Polo_Burgundy_Casual: U_C_Poloshirt_burgundy
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Polo Burgundy + Casual Pants";
        descriptionShort = "Complete RHD civilian polo-and-pants outfit.";
    };

    class RHD_Outfit_Polo_Blue_Casual: U_C_Poloshirt_blue
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Polo Blue + Casual Pants";
        descriptionShort = "Complete RHD civilian polo-and-pants outfit.";
    };

    class RHD_Outfit_Polo_Yellow_Casual: U_C_Poloshirt_yellow
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Polo Yellow + Casual Pants";
        descriptionShort = "Complete RHD civilian polo-and-pants outfit.";
    };

    class RHD_Outfit_Polo_Striped_Casual: U_C_Poloshirt_stripped
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Polo Striped + Casual Pants";
        descriptionShort = "Complete RHD civilian polo-and-pants outfit.";
    };

    class RHD_Outfit_Field_Hunter_Green: U_C_HunterBody_grn
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Field Shirt + Hunter Green Pants";
        descriptionShort = "Complete RHD field/work outfit using the Arma 3 hunter green uniform.";
    };

    class RHD_Outfit_Field_Hunter_Brown: U_C_HunterBody_brn
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Field Shirt + Hunter Brown Pants";
        descriptionShort = "Complete RHD field/work outfit using the Arma 3 hunter brown uniform.";
    };

    class RHD_Outfit_Workwear_Poor_01: U_C_Poor_1
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Work Shirt + Work Pants 01";
        descriptionShort = "Complete RHD workwear outfit for civilian jobs and general labor.";
    };

    class RHD_Outfit_Workwear_Poor_02: U_C_Poor_2
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Work Shirt + Work Pants 02";
        descriptionShort = "Complete RHD workwear outfit for civilian jobs and general labor.";
    };

    class RHD_Outfit_Mechanic_Coveralls: U_C_WorkerCoveralls
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Outfit | Mechanic Shirt + Pants | Coveralls";
        descriptionShort = "Complete RHD mechanic/workshop outfit using the stock worker coverall model.";
    };
};
