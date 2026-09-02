class CfgPatches
{
    class rhd_clothing
    {
        name = "RHD - LifeCore Clothing";
        author = "LT. Toad";
        requiredVersion = 2.20;
        requiredAddons[] = {"A3_Characters_F", "rhd_lifecore"};
        weapons[] = {
            "RHD_Top_TShirt_Tan",
            "RHD_Top_TShirt_Olive",
            "RHD_Top_TShirt_Black",
            "RHD_Top_Polo_White",
            "RHD_Top_Polo_Burgundy",
            "RHD_Top_Polo_Blue",
            "RHD_Top_Polo_Yellow",
            "RHD_Top_Polo_Striped",
            "RHD_Pants_Casual_1",
            "RHD_Pants_Casual_2",
            "RHD_Pants_Casual_3",
            "RHD_Pants_Poor_1",
            "RHD_Pants_Poor_2",
            "RHD_Pants_Hunter_Green",
            "RHD_Pants_Hunter_Brown",
            "RHD_Pants_Worker_Coveralls"
        };
        units[] = {};
    };
};

class CfgWeapons
{
    // ---------------------------------------------------------------------
    // RHD TOPS
    // ---------------------------------------------------------------------
    // Arma 3's vanilla uniform slot is a complete outfit. These first RHD
    // entries therefore act as top-style outfit presets using stock models.
    // True independently swappable tops and pants require a custom uniform
    // model with separate upper/lower geometry.

    class U_C_Poloshirt_white;
    class U_C_Poloshirt_blue;
    class U_C_Poloshirt_burgundy;
    class U_C_Poloshirt_yellow;
    class U_C_Poloshirt_stripped;

    class RHD_Top_TShirt_Tan: U_C_Poloshirt_white
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Top | T-Shirt | Tan";
        descriptionShort = "RHD civilian top preset using a stock Arma 3 civilian uniform model.";
        hiddenSelectionsTextures[] = {"#(rgb,8,8,3)color(0.62,0.50,0.34,1)"};
    };

    class RHD_Top_TShirt_Olive: U_C_Poloshirt_white
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Top | T-Shirt | Olive";
        descriptionShort = "RHD civilian top preset using a stock Arma 3 civilian uniform model.";
        hiddenSelectionsTextures[] = {"#(rgb,8,8,3)color(0.30,0.35,0.23,1)"};
    };

    class RHD_Top_TShirt_Black: U_C_Poloshirt_white
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Top | T-Shirt | Black";
        descriptionShort = "RHD civilian top preset using a stock Arma 3 civilian uniform model.";
        hiddenSelectionsTextures[] = {"#(rgb,8,8,3)color(0.07,0.07,0.07,1)"};
    };

    class RHD_Top_Polo_White: U_C_Poloshirt_white
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Top | Polo | White";
    };

    class RHD_Top_Polo_Burgundy: U_C_Poloshirt_burgundy
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Top | Polo | Burgundy";
    };

    class RHD_Top_Polo_Blue: U_C_Poloshirt_blue
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Top | Polo | Blue";
    };

    class RHD_Top_Polo_Yellow: U_C_Poloshirt_yellow
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Top | Polo | Yellow";
    };

    class RHD_Top_Polo_Striped: U_C_Poloshirt_stripped
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Top | Polo | Striped";
    };

    // ---------------------------------------------------------------------
    // RHD PANTS / LOWER-BODY PRESETS
    // ---------------------------------------------------------------------
    // These retain the complete stock uniform silhouette because Arma 3
    // uniforms are not separate torso/leg equipment slots.

    class U_C_Man_casual_1_F;
    class U_C_Man_casual_2_F;
    class U_C_Man_casual_3_F;
    class U_C_Poor_1;
    class U_C_Poor_2;
    class U_C_HunterBody_grn;
    class U_C_HunterBody_brn;
    class U_C_WorkerCoveralls;

    class RHD_Pants_Casual_1: U_C_Man_casual_1_F
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Pants | Casual | 01";
        descriptionShort = "RHD lower-body style preset using a base-game civilian outfit.";
    };

    class RHD_Pants_Casual_2: U_C_Man_casual_2_F
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Pants | Casual | 02";
    };

    class RHD_Pants_Casual_3: U_C_Man_casual_3_F
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Pants | Casual | 03";
    };

    class RHD_Pants_Poor_1: U_C_Poor_1
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Pants | Workwear | 01";
        descriptionShort = "RHD workwear lower-body style preset using a base-game civilian outfit.";
    };

    class RHD_Pants_Poor_2: U_C_Poor_2
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Pants | Workwear | 02";
    };

    class RHD_Pants_Hunter_Green: U_C_HunterBody_grn
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Pants | Field | Hunter Green";
        descriptionShort = "RHD fieldwear lower-body style preset using a base-game hunter outfit.";
    };

    class RHD_Pants_Hunter_Brown: U_C_HunterBody_brn
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Pants | Field | Hunter Brown";
    };

    class RHD_Pants_Worker_Coveralls: U_C_WorkerCoveralls
    {
        scope = 2;
        scopeArsenal = 2;
        displayName = "RHD Pants | Mechanic | Coveralls";
        descriptionShort = "RHD mechanic/workwear preset using the Arma 3 worker coverall model.";
    };
};
