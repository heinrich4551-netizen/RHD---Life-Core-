disableSerialization;
if (!([player] call RHD_fnc_isAdmin)) exitWith {["Admin access denied.","error"] call RHD_fnc_notify};
private _d = findDisplay 8500;
if (isNull _d) exitWith {};
private _players = _d displayCtrl 8504;
private _actions = _d displayCtrl 8506;
private _vars = _d displayCtrl 8512;
private _value = ctrlText (_d displayCtrl 8510);
private _pidx = lbCurSel _players;
private _aidx = lbCurSel _actions;
private _vidx = lbCurSel _vars;
if (_pidx < 0 || {_aidx < 0}) exitWith {["Select a player and an admin action.","warning"] call RHD_fnc_notify};
private _targetNetId = _players lbData _pidx;
private _action = _actions lbData _aidx;
private _selection = if (_vidx >= 0) then {_vars lbData _vidx} else {""};
[player, _targetNetId, _action, _value, _selection] remoteExecCall ["RHD_fnc_execute", 2];
true
