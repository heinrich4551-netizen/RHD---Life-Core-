private _near = (allPlayers select {alive _x && {_x != player}}) apply {_x};
_near = _near select {_x distance2D player < 8};
if (_near isEqualTo []) exitWith {["No player is close enough.", "error"] call RHD_fnc_notify};
[player, _near select 0, 250] remoteExecCall ["RHD_fnc_ticket", 2];
