disableSerialization;

if !(isClass (configFile >> "CfgPatches" >> "ctab_core")) exitWith {
    ["cTab is not loaded. Install/enable cTab+ and CBA_A3 to use the RHD tablet.", "error"] call RHD_fnc_notify;
    false
};

private _display = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];
if (isNull _display) then {
    private _opened = [0, "cTab_Tablet_dlg", player, vehicle player] call cTab_fnc_open;
    if (!_opened) exitWith {false};
    waitUntil {uiSleep 0.01; !isNull (uiNamespace getVariable ["cTab_Tablet_dlg", displayNull])};
    _display = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];
};

if (isNull _display) exitWith {false};

[] call RHD_fnc_ctabBuild;
true
