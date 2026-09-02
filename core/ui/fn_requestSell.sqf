params ["_index"];
disableSerialization;
private _display = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];
private _ctrls = uiNamespace getVariable ["RHD_CTAB_CTRLS", []];
if (isNull _display || {count _ctrls < 9}) exitWith {};
private _lb = _ctrls select 8;
if (_index < 0 || {_index >= lbSize _lb}) exitWith {["Select an item first.", "error"] call RHD_fnc_notify};
private _item = _lb lbData _index;
[player, _item, 1] remoteExecCall ["RHD_fnc_serverSell", 2];
