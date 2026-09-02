if (!hasInterface) exitWith {};
private _vehicle = vehicle player;
if (_vehicle isEqualTo player || {!alive _vehicle} || {!((driver _vehicle) isEqualTo player)}) exitWith {
    ["You must be driving a vehicle to refuel.", "error"] call RHD_fnc_notify;
};
private _markers = allMapMarkers select {(_x find "rhd_fuel_") isEqualTo 0};
if (_markers isEqualTo []) exitWith {["No fuel station is configured on this terrain.", "error"] call RHD_fnc_notify;};
private _marker = "";
private _distance = 99999;
{
    private _d = player distance2D (getMarkerPos _x);
    if (_d < _distance) then {_distance = _d; _marker = _x;};
} forEach _markers;
if (_marker isEqualTo "" || {_distance > 15}) exitWith {
    ["You must be at a marked RHD fuel station.", "error"] call RHD_fnc_notify;
};
[_vehicle, _marker] remoteExecCall ["RHD_fnc_refuel", 2];
