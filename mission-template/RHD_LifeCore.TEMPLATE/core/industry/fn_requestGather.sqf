private _markers = allMapMarkers select {private _m=toLower _x; (_m find "rhd_farm_") == 0 || {(_m find "rhd_mine_") == 0}};
if (_markers isEqualTo []) exitWith {["No 3DEN gathering locations are configured.", "error"] call RHD_fnc_notify};
private _near = _markers select {player distance2D (getMarkerPos _x) <= 12};
if (_near isEqualTo []) exitWith {["You are not at a configured farming/mining location.", "error"] call RHD_fnc_notify};
private _marker = _near select 0;
[player, _marker] remoteExecCall ["RHD_fnc_serverGather", 2];
