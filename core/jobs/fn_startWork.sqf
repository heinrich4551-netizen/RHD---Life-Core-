disableSerialization;
private _display = findDisplay 7700;
if (isNull _display) exitWith {};
private _lb = _display displayCtrl 7703;
private _index = lbCurSel _lb;
if (_index < 0) exitWith {["Select a job first.", "error"] call RHD_fnc_notify};
private _job = _lb lbData _index;
[player, _job] remoteExecCall ["RHD_fnc_setJob", 2];
closeDialog 0;
