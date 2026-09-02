/*
    RHD - LifeCore | PLAYER SHORTCUT HANDLER
    Author: LT. Toad
    ---------------------------------------------------------------------------
    F6/F7/F8 are convenience shortcuts only.

    All player menus use the same cTab-backed RHD tablet. There are no
    standalone F6/F7/F8 dialogs.

    F6 = Main tablet / Status
    F7 = Jobs page
    F8 = Shop page
    ---------------------------------------------------------------------------
*/

params ["_display", "_key", "_shift", "_ctrl", "_alt"];

// F6 -> main RHD tablet.
if (_key isEqualTo 117) exitWith {
    [] call RHD_fnc_ctabOpen;
    true
};

// F7 -> open tablet, then switch to Jobs.
if (_key isEqualTo 118) exitWith {
    private _opened = [] call RHD_fnc_ctabOpen;
    if (!_opened) exitWith {true};

    [] spawn {
        waitUntil {
            uiSleep 0.01;
            count (uiNamespace getVariable ["RHD_CTAB_CTRLS", []]) >= 14
        };
        ["JOBS"] call RHD_fnc_ctabPage;
    };
    true
};

// F8 -> open tablet, then switch to Shop.
if (_key isEqualTo 119) exitWith {
    private _opened = [] call RHD_fnc_ctabOpen;
    if (!_opened) exitWith {true};

    [] spawn {
        waitUntil {
            uiSleep 0.01;
            count (uiNamespace getVariable ["RHD_CTAB_CTRLS", []]) >= 14
        };
        ["SHOP"] call RHD_fnc_ctabPage;
    };
    true
};

false
