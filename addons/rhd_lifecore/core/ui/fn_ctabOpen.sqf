/*
    RHD - LifeCore | cTab Tablet Open
    Author: LT. Toad

    Opens cTab's tablet and then builds the RHD-owned player interface on it.
*/

disableSerialization;

// cTab is an external dependency. Fail cleanly if it is not loaded.
if !(isClass (configFile >> "CfgPatches" >> "ctab_core")) exitWith {
    ["cTab+ is not loaded. Install CBA_A3 and cTab+ before using the RHD tablet.", "error"] call RHD_fnc_notify;
    false
};

// Reuse the existing tablet display when it is already open.
private _display = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];

if (isNull _display) then {
    private _opened = [0, "cTab_Tablet_dlg", player, vehicle player] call cTab_fnc_open;

    if (!_opened) exitWith {
        ["RHD - LifeCore could not open the cTab tablet.", "error"] call RHD_fnc_notify;
        false
    };

    waitUntil {
        uiSleep 0.01;
        !isNull (uiNamespace getVariable ["cTab_Tablet_dlg", displayNull])
    };

    _display = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];
};

if (isNull _display) exitWith {false};

// Build the RHD tablet overlay if cTab has just opened a clean display.
private _ctrls = uiNamespace getVariable ["RHD_CTAB_CTRLS", []];
if (_ctrls isEqualTo [] || {isNull (_ctrls select 0)}) then {
    [] call RHD_fnc_ctabBuild;
};

true
