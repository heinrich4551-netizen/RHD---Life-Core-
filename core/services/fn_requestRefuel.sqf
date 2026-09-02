if (!hasInterface) exitWith {};
private _vehicle = vehicle player;
if (_vehicle isEqualTo player || {!alive _vehicle} || {!((driver _vehicle) isEqualTo player)}) exitWith {
    ["You must be driving a vehicle to refuel.", "error"] call RHD_fnc_notify;
};
private _markers = allMapMarkers select {(_x find "rhd_fuel_") isEqualTo 0};
if (_markers isEqualTo []) exitWith {["No fuel station is configured on this terrain.", "error"] call RHD_fnc_notify;};
private _nearMarker = [_markers, {player distance2D (getMarkerPos _x)}, "ASCEND"] call BIS_fnc_sortBy;
private _marker = if (_nearMarker isEqualTo []) then {""} else {_nearMarker select 0};
if (_marker isEqualTo "" || {player distance2D (getMarkerPos _marker) > 15}) exitWith {
    ["You must be at a marked RHD fuel station.", "error"] call RHD_fnc_notify;
};
[_vehicle, _marker] remoteExecCall ["RHD_fnc_refuel", 2];
