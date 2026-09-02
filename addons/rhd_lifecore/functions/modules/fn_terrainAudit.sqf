/*
    RHD - LifeCore | Terrain Compatibility Audit
    Author: LT. Toad

    This audit runs once during Antistasi startup and records what the active
    terrain actually provides. It does not fabricate map-specific data.
*/

if (!isServer) exitWith {false};

private _world = worldName;
private _report = createHashMap;

private _cities = "true" configClasses (configFile >> "CfgWorlds" >> _world >> "Names");
private _airportCount = count ([worldSize / 2, worldSize / 2] nearObjects ["AirportBase_F", worldSize]);
private _fuelTypes = missionNamespace getVariable [
    "RHD_GENERIC_FUEL_TYPES",
    ["Land_FuelStation_Feed_F", "Land_fs_feed_F", "Land_FuelStation_01_pump_F", "Land_FuelStation_02_pump_F", "Land_FuelStation_03_pump_F"]
];
private _antennaTypes = missionNamespace getVariable [
    "RHD_GENERIC_ANTENNA_TYPES",
    ["Land_TTowerBig_1_F", "Land_TTowerBig_2_F", "Land_Communication_F", "Land_A_TVTower_base"]
];

private _fuelCount = count (nearestObjects [[worldSize / 2, worldSize / 2], _fuelTypes, worldSize]);
private _antennaCount = count (nearestObjects [[worldSize / 2, worldSize / 2], _antennaTypes, worldSize]);

private _mapInfo = objNull;
private _mapInfoValid = false;
if (!isNil "A3A_fnc_getMapInfo") then {
    private _candidate = call A3A_fnc_getMapInfo;
    if (isClass _candidate) then {
        _mapInfo = _candidate;
        _mapInfoValid = true;
    };
};

_report set ["world", _world];
_report set ["mapInfo", _mapInfoValid];
_report set ["cityDefinitions", count _cities];
_report set ["airportObjects", _airportCount];
_report set ["fuelStations", _fuelCount];
_report set ["radioTowers", _antennaCount];
_report set ["genericFallbackEnabled", missionNamespace getVariable ["RHD_A3A_TERRAIN_FALLBACK", true]];

private _warnings = [];
if (!_mapInfoValid) then {
    _warnings pushBack "No map-specific A3A mapInfo class was detected; RHD generic fallback is active.";
};
if (_cities isEqualTo []) then {
    _warnings pushBack "CfgWorlds/Names contains no city entries; A3A city logic may need explicit terrain data.";
};
if (_fuelCount == 0) then {
    _warnings pushBack "No common fuel-station objects were found automatically.";
};
if (_antennaCount == 0) then {
    _warnings pushBack "No common radio-tower objects were found automatically.";
};

_report set ["warnings", _warnings];
missionNamespace setVariable ["RHD_A3A_TERRAIN_REPORT", _report, true];

if (_warnings isEqualTo []) then {
    diag_log format ["[RHD-LIFECORE] Terrain audit passed for %1: %2", _world, _report];
} else {
    diag_log format ["[RHD-LIFECORE] Terrain audit warnings for %1: %2", _world, _warnings];
};

_report
