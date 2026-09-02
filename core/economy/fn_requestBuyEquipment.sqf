/* RHD - LifeCore | Client equipment purchase request */
params [["_index", -1, [0]]];
disableSerialization;

private _display = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];
private _ctrls = uiNamespace getVariable ["RHD_CTAB_CTRLS", []];
if (isNull _display || {count _ctrls < 10}) exitWith {};

private _list = _ctrls select 9;
if (_index < 0 || {_index >= lbSize _list}) exitWith {
    ["Select an item first.", "error"] call RHD_fnc_notify;
};

private _entry = _list lbData _index;
if (_entry isEqualTo "") exitWith {};

private _parts = _entry splitString "|";
if (count _parts < 2) exitWith {
    ["Invalid shop entry.", "error"] call RHD_fnc_notify;
};

[player, _parts select 0, _parts select 1] remoteExecCall ["RHD_fnc_shopBuyItem", 2];
