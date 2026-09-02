/*
    RHD - LifeCore | Antistasi Vehicle Spawn Bridge
    Author: LT. Toad

    Uses Antistasi Ultimate's collision-aware vehicle spawning instead of
    duplicating vehicle-placement logic inside RHD.

    Usage:
        ["B_MRAP_01_F", getPosASL player] call RHD_fnc_antistasiSpawnVehicle;
*/

params [["_vehicleClass", "", [""]], ["_position", [0,0,0], [[]]], ["_radius", 12, [0]], ["_attempts", 8, [0]]];

if (!isServer) exitWith {objNull};
if (!missionNamespace getVariable ["RHD_A3A_BASE_READY", false]) exitWith {objNull};
if (isNil "A3A_fnc_safeVehicleSpawn") exitWith {objNull};
if (_vehicleClass isEqualTo "") exitWith {objNull};
if !(isClass (configFile >> "CfgVehicles" >> _vehicleClass)) exitWith {objNull};

[_vehicleClass, _position, (_radius max 0) min 100, (_attempts max 1) min 20, false] call A3A_fnc_safeVehicleSpawn
