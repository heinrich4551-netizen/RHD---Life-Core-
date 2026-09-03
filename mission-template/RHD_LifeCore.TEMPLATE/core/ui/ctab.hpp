/*
    RHD cTab PLAYER TABLET UI
    ---------------------------------------------------------------------------
    Self-contained RHD UI controls. This file does not inherit from global
    Rsc* classes, preventing config-order/base-class errors.
*/

class RHD_CTAB_RscText
{
    access = 0;
    type = 0;
    idc = -1;
    style = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    text = "";
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    shadow = 0;
};

class RHD_CTAB_RscStructuredText
{
    access = 0;
    type = 13;
    idc = -1;
    style = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    font = "PuristaMedium";
    size = 0.04;
    sizeEx = 0.04;
    text = "";
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    shadow = 0;
};

class RHD_CTAB_RscListbox
{
    access = 0;
    type = 5;
    idc = -1;
    style = 16;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    rowHeight = 0.04;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0.3};
    colorSelect[] = {1,1,1,1};
    colorSelectBackground[] = {0.2,0.2,0.2,1};
};

class RHD_CTAB_RscButton
{
    access = 0;
    type = 1;
    idc = -1;
    style = 2;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    text = "";
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0.5};
    colorBackgroundActive[] = {0.2,0.2,0.2,0.8};
};

class RHD_CTAB_Background: RHD_CTAB_RscText
{
    idc = 9800;
    colorBackground[] = {.015,.025,.035,.82};
};

class RHD_CTAB_Title: RHD_CTAB_RscText
{
    idc = 9801;
    sizeEx = .027;
    colorBackground[] = {.04,.16,.23,.96};
    colorText[] = {.90,.96,1,1};
};

class RHD_CTAB_Nav: RHD_CTAB_RscButton
{
    sizeEx = .018;
    colorBackground[] = {.05,.20,.28,.95};
    colorBackgroundActive[] = {.10,.38,.50,1};
    colorText[] = {1,1,1,1};
};

class RHD_CTAB_Content: RHD_CTAB_RscStructuredText
{
    idc = 9807;
    colorBackground[] = {.01,.02,.03,.88};
    colorText[] = {.90,.94,.98,1};
    sizeEx = .020;
};

class RHD_CTAB_List: RHD_CTAB_RscListbox
{
    idc = 9808;
    sizeEx = .018;
    colorBackground[] = {.02,.03,.04,.96};
    colorSelect[] = {1,1,1,1};
    colorSelectBackground[] = {.08,.30,.40,1};
};

class RHD_CTAB_Button: RHD_CTAB_RscButton
{
    sizeEx = .017;
    colorBackground[] = {.06,.28,.36,.96};
    colorBackgroundActive[] = {.10,.42,.52,1};
    colorText[] = {1,1,1,1};
};

class RHD_CTAB_Status: RHD_CTAB_RscText
{
    idc = 9811;
    sizeEx = .016;
    colorText[] = {.50,.80,.90,1};
};
