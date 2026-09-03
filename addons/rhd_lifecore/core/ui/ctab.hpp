/*
    RHD cTab PLAYER TABLET UI
    ---------------------------------------------------------------------------
    This file contains only the RHD controls placed on cTab's tablet display.

    BEGINNER EDITORS:
    - You normally do not need to change this file.
    - Change page text/buttons in core/ui/fn_ctabPage.sqf.
    - Change tablet layout here only if you understand Arma UI coordinates.

    Each control has a unique IDC in the 9800+ range so it does not collide
    with normal RHD dialogs.
    ---------------------------------------------------------------------------
*/

// Tablet background panel.
class RHD_CTAB_Background: RscText
{
    idc = 9800;
    colorBackground[] = {.015,.025,.035,.82};
};

// Tablet title/header.
class RHD_CTAB_Title: RscText
{
    idc = 9801;
    sizeEx = .027;
    colorBackground[] = {.04,.16,.23,.96};
    colorText[] = {.90,.96,1,1};
};

// Page navigation buttons.
class RHD_CTAB_Nav: RscButton
{
    sizeEx = .018;
    colorBackground[] = {.05,.20,.28,.95};
    colorBackgroundActive[] = {.10,.38,.50,1};
    colorText[] = {1,1,1,1};
};

// Main page content area.
class RHD_CTAB_Content: RscStructuredText
{
    idc = 9807;
    colorBackground[] = {.01,.02,.03,.88};
    colorText[] = {.90,.94,.98,1};
    sizeEx = .020;
};

// List control used by jobs and shop pages.
class RHD_CTAB_List: RscListbox
{
    idc = 9808;
    sizeEx = .018;
    colorBackground[] = {.02,.03,.04,.96};
    colorSelect[] = {1,1,1,1};
    colorSelectBackground[] = {.08,.30,.40,1};
};

// Primary/secondary page action buttons.
class RHD_CTAB_Button: RscButton
{
    sizeEx = .017;
    colorBackground[] = {.06,.28,.36,.96};
    colorBackgroundActive[] = {.10,.42,.52,1};
    colorText[] = {1,1,1,1};
};

// Small status line at the bottom of the tablet page.
class RHD_CTAB_Status: RscText
{
    idc = 9811;
    sizeEx = .016;
    colorText[] = {.50,.80,.90,1};
};
