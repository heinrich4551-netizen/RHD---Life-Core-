private _markers = allMapMarkers select {(toLower _x find "rhd_refine_") == 0};
if (_markers isEqualTo []) exitWith {["No refinery locations are configured in 3DEN.", "error"] call RHD_fnc_notify};
private _near = _markers select {player distance2D (getMarkerPos _x) <= 12};
if (_near isEqualTo []) exitWith {["You are not at a refinery location.", "error"] call RHD_fnc_notify};
private _m = toLower (_near select 0);
private _suffix = _m select [10];
private _input = switch (_suffix) do {case "iron": {"iron_ore"}; case "copper": {"copper_ore"}; case "gold": {"gold_ore"}; case "oil": {"oil_sand"}; default {""}};
if (_input isEqualTo "") exitWith {["Invalid refinery marker. Use rhd_refine_iron/copper/gold/oil.", "error"] call RHD_fnc_notify};
[player, _input, 1, _near select 0] remoteExecCall ["RHD_fnc_refine", 2];
