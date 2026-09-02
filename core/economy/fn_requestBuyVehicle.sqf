/* RHD - LifeCore | Client vehicle purchase request */
params [["_index", -1, [0]]];
disableSerialization;

private _display = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];
private _ctrls = uiNamespace getVariable ["RHD_CTAB_CTRLS", []];
if (isNull _display || {count _ctrls < 17}) exitWith {};

private _list = _ctrls select 12;
if (_index < 0 || {_index >= lbSize _list}) exitWith {
    ["Select a vehicle first.", "error"] call RHD_fnc_notify;
};

private _entry = _list lbData _index;
if (_entry isEqualTo "") exitWith {};

[player, _entry] remoteExecCall ["RHD_fnc_shopBuyVehicle", 2];
