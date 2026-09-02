/*
    RHD - LifeCore | Record a crime / district pressure event
    Server authoritative. Other server-side scripts can call this when a
    criminal action occurs.

    USAGE
    -----
    [_unit, 10] call RHD_fnc_recordCrime;
*/

params ["_unit", ["_amount", 10]];
if (!isServer || {isNull _unit}) exitWith {false};
if (_amount <= 0) exitWith {false};

private _radius = missionNamespace getVariable ["RHD_CONFLICT_ZONE_RADIUS", 400];
private _maxHeat = missionNamespace getVariable ["RHD_CONFLICT_MAX_HEAT", 100];
private _zones = allMapMarkers select {(_x find "rhd_zone_") isEqualTo 0};
private _state = missionNamespace getVariable ["RHD_CONFLICT_ZONES", createHashMap];
private _changed = false;

{
    private _marker = _x;
    if (_unit distance2D (getMarkerPos _marker) <= _radius) exitWith {
        private _old = _state getOrDefault [_marker, ["CONTESTED", 50, 100, diag_tickTime, _marker, 0, 0]];
        private _heat = ((_old param [1, 50]) + _amount) min _maxHeat;
        _old set [1, _heat];
        _state set [_marker, _old];
        _changed = true;
    };
} forEach _zones;

if (_changed) then {
    missionNamespace setVariable ["RHD_CONFLICT_ZONES", _state, true];
    publicVariable "RHD_CONFLICT_ZONES";
};

_changed
