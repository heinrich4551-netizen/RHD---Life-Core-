/*
    RHD - LifeCore | Vehicle Spawn Bridge
    Author: LT. Toad

    When Antistasi Ultimate is active, RHD uses A3A's safe vehicle spawn.
    In standalone mode, RHD uses the base-game BIS_fnc_findSafePos fallback.

    Usage:
        ["B_MRAP_01_F", getPosASL player] call RHD_fnc_antistasiSpawnVehicle;
*/

params [
    ["_vehicleClass", "", [""]],
    ["_position", [0,0,0], [[]]],
    ["_radius", 12, [0]],
    ["_attempts", 8, [0]]
];

if (!isServer) exitWith {objNull};
if (_vehicleClass isEqualTo "") exitWith {objNull};
if !(isClass (configFile >> "CfgVehicles" >> _vehicleClass)) exitWith {objNull};

private _useA3A = missionNamespace getVariable ["RHD_A3A_MODE", "STANDALONE"] isEqualTo "ANTISTASI";

if (_useA3A && {!isNil "A3A_fnc_safeVehicleSpawn"}) exitWith {
    [_vehicleClass, _position, (_radius max 0) min 100, (_attempts max 1) min 20, false] call A3A_fnc_safeVehicleSpawn
};

private _safePos = _position;
private _maxAttempts = (_attempts max 1) min 20;
private _searchRadius = (_radius max 2) min 100;

// Base-game safe-position search. The original shop centre is tried first;
// later attempts sample points around it.
for "_i" from 0 to _maxAttempts do {
    private _candidate = if (_i isEqualTo 0) then {
        _position
    } else {
        private _angle = random 360;
        private _distance = random _searchRadius;
        _position vectorAdd [sin _angle * _distance, cos _angle * _distance, 0]
    };

    private _found = [_candidate, 0, _searchRadius max 5, 5, 0, 0.25, 0] call BIS_fnc_findSafePos;
    if (_found isEqualType [] && {count _found >= 2}) exitWith {
        _safePos = ASLToATL [_found select 0, _found select 1, getTerrainHeightASL _found];
    };
};

private _vehicle = createVehicle [_vehicleClass, _safePos, [], 0, "NONE"];
if (isNull _vehicle) exitWith {objNull};

_vehicle setPosATL _safePos;
_vehicle
