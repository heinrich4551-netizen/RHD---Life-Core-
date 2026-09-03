private _near = allPlayers select {alive _x && {_x != player} && {_x distance2D player < 8}};
if (_near isEqualTo []) exitWith {["No patient is close enough.", "error"] call RHD_fnc_notify};
[player, _near select 0] remoteExecCall ["RHD_fnc_heal", 2];
