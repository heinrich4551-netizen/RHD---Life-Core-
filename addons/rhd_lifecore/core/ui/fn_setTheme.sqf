/*
    RHD - LifeCore | UI Theme Selection
    Author: LT. Toad

    Theme selection is stored in the player's profile namespace.
    The RHD tablet is built on cTab, so there is no legacy F6 dialog to reopen.
*/

params [["_theme", 0]];

// Only allow the three RHD themes defined by this framework.
_theme = (floor _theme) max 0 min 2;
profileNamespace setVariable ["RHD_UI_THEME", _theme];
saveProfileNamespace;

private _name = switch (_theme) do {
    case 1: {"TABLET SLATE"};
    case 2: {"MINIMAL OPS"};
    default {"CLASSIC LIFE"};
};

// Refresh the current cTab page when the tablet is open.
private _display = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];
if (!isNull _display) then {
    private _ctrls = uiNamespace getVariable ["RHD_CTAB_CTRLS", []];
    if (count _ctrls >= 14) then {
        ["STATUS"] call RHD_fnc_ctabPage;
    };
};

[format ["RHD - LifeCore UI theme: %1", _name], "success"] call RHD_fnc_notify;
true
