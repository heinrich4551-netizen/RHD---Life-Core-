params ["_index"];
if (!hasInterface) exitWith {};
private _display = findDisplay 7805;
if (isNull _display) exitWith {};
private _lb = _display displayCtrl 7808;
if (_index < 0 || {_index >= lbSize _lb}) exitWith {};
private _item = _lb lbData _index;
[player, _item, 1] remoteExecCall ["RHD_fnc_buy", 2];
