/*
    RHD - LifeCore | Player Shortcut Handler
    Author: LT. Toad

    These are convenience shortcuts only.
    All player menus are the same cTab-backed RHD tablet; no separate menu
    dialogs are opened here.

    F6 = main RHD tablet
    F7 = Jobs page
    F8 = Shop page
*/

params ["_display", "_key", "_shift", "_ctrl", "_alt"];

// F6 opens the RHD tablet.
if (_key isEqualTo 117) exitWith {
    [] call RHD_fnc_ctabOpen;
    true
};

// F7 opens the same tablet on the Jobs page.
if (_key isEqualTo 118) exitWith {
    [] call RHD_fnc_ctabOpen;
    [] spawn {
        waitUntil {
            uiSleep 0.01;
            count (uiNamespace getVariable ["RHD_CTAB_CTRLS", []]) >= 14
        };
        ["JOBS"] call RHD_fnc_ctabPage;
    };
    true
};

// F8 opens the same tablet on the Shop page.
if (_key isEqualTo 119) exitWith {
    [] call RHD_fnc_ctabOpen;
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
