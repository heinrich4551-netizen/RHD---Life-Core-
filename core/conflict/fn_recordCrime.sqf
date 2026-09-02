/*
    RHD - LifeCore | Record a crime / district pressure event
    Author: LT. Toad

    Server authoritative. This updates the local RHD district pressure AND,
    when Antistasi Ultimate is ready, feeds the crime into the A3A aggression
    system so criminal activity has consequences in the wider campaign.

    USAGE
    -----
    [_unit, 10] call RHD_fnc_recordCrime;
*/

params ["_unit", ["_amount", 10]];

if (!isServer || {isNull _unit}) exitWith {false};
if (!(_amount isEqualType 0) || {!finite _amount}) exitWith {false};
if (_amount <= 0) exitWith {false};

// ============================================================================
// RHD LOCAL DISTRICT PRESSURE
// ============================================================================
private _radius = missionNamespace getVariable ["RHD_CONFLICT_ZONE_RADIUS", 400];
private _maxHeat = missionNamespace getVariable ["RHD_CONFLICT_MAX_HEAT", 100];
private _zones = allMapMarkers select {(_x find "rhd_zone_") isEqualTo 0};
private _state = missionNamespace getVariable ["RHD_CONFLICT_ZONES", createHashMap];
private _changed = false;

{
    private _marker = _x;

    if (_unit distance2D (getMarkerPos _marker) <= _radius) exitWith {
        private _old = _state getOrDefault [
            _marker,
            ["CONTESTED", 50, 100, diag_tickTime, _marker, 0, 0]
        ];

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

// ============================================================================
// ANTISTASI ULTIMATE CAMPAIGN PRESSURE
// ============================================================================
if (missionNamespace getVariable ["RHD_A3A_BASE_READY", false]) then {
    private _duration = missionNamespace getVariable ["RHD_A3A_CRIME_AGGRESSION_MINUTES", 10];
    [_amount, _duration] call RHD_fnc_addAggression;
};

_changed
