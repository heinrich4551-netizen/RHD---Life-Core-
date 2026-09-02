/*
    RHD - LifeCore | 3DEN MODULE: ANTISTASI ULTIMATE BASE
    Author: LT. Toad

    PURPOSE
    -------
    This module is the real startup switch for the Antistasi Ultimate campaign.
    RHD does NOT start a second strategic simulation.

    PLACE THIS IN 3DEN
    ------------------
    Eden -> Systems -> RHD - LifeCore -> Antistasi Ultimate Base

    Put it at the intended HQ / campaign start position.

    The module creates only the small set of mission anchors that the A3A
    campaign expects from the host mission, then starts A3A_fnc_initServer.
    All strategic systems remain owned by Antistasi Ultimate.
*/

params [
    ["_logic", objNull, [objNull]],
    ["_activated", true, [true]]
];

if (!_activated || {isNull _logic}) exitWith {};
if (!isServer) exitWith {};

// Prevent accidental double-starts if the module is triggered twice.
if (missionNamespace getVariable ["RHD_A3A_MODULE_STARTED", false]) exitWith {
    diag_log "[RHD-LIFECORE] Antistasi startup module was already activated.";
};

if !(isClass (configFile >> "CfgPatches" >> "A3A_core")) exitWith {
    diag_log "[RHD-LIFECORE] ERROR: Antistasi Ultimate is not loaded. Install the required A3A addon before starting the mission.";
};

if (isNil "A3A_fnc_initServer") exitWith {
    diag_log "[RHD-LIFECORE] ERROR: A3A_fnc_initServer is unavailable.";
};

missionNamespace setVariable ["RHD_A3A_MODULE_STARTED", true, true];
missionNamespace setVariable ["RHD_A3A_MODULE_LOGIC", _logic, true];

private _autoStart = _logic getVariable ["RHD_A3A_AutoStart", true];
private _createHQ = _logic getVariable ["RHD_A3A_CreateHQ", true];
private _terrainFallback = _logic getVariable ["RHD_A3A_TerrainFallback", true];

if (!_autoStart) exitWith {
    diag_log "[RHD-LIFECORE] Antistasi module placed with campaign auto-start disabled.";
};

// ---------------------------------------------------------------------------
// REQUIRED HOST-MISSION ANCHORS
// ---------------------------------------------------------------------------
// A3A's server initializer expects these mission objects to exist because it
// positions/uses them during HQ setup. The campaign later replaces/repositions
// Petros as part of its normal startup.
private _basePos = getPosATL _logic;
private _baseDir = getDir _logic;

private _newAnchor = {
    params ["_class", "_offset", ["_simulation", false]];
    private _p = _basePos vectorAdd _offset;
    private _obj = createVehicle [_class, _p, [], 0, "CAN_COLLIDE"];
    _obj setDir _baseDir;
    if (!_simulation) then {_obj enableSimulationGlobal false};
    _obj
};

if (_createHQ) then {
    if (isNil "boxX" || {isNull boxX}) then {
        boxX = ["B_supplyCrate_F", [3, 0, 0], false] call _newAnchor;
        publicVariable "boxX";
    };

    if (isNil "vehicleBox" || {isNull vehicleBox}) then {
        vehicleBox = ["B_supplyCrate_F", [0, 3, 0], false] call _newAnchor;
        publicVariable "vehicleBox";
    };

    if (isNil "mapX" || {isNull mapX}) then {
        mapX = ["Land_MapBoard_F", [-3, 0, 0], false] call _newAnchor;
        publicVariable "mapX";
    };

    if (isNil "flagX" || {isNull flagX}) then {
        flagX = ["FlagCarrierWhite_F", [0, -3, 0], false] call _newAnchor;
        publicVariable "flagX";
    };

    // Petros is re-created by A3A_fnc_createPetros after campaign save setup.
    if (isNil "petros" || {isNull petros}) then {
        private _group = createGroup [independent, true];
        petros = _group createUnit [
            "a3a_unit_reb_petros",
            _basePos vectorAdd [0, 6, 0],
            [],
            0,
            "NONE"
        ];
        publicVariable "petros";
    };
};

// ---------------------------------------------------------------------------
// REQUIRED MARKERS
// ---------------------------------------------------------------------------
if !("respawn_guerrila" in allMapMarkers) then {
    private _respawn = createMarker ["respawn_guerrila", _basePos];
    _respawn setMarkerType "Empty";
    _respawn setMarkerText "RHD Campaign Start";
};

if !("Synd_HQ" in allMapMarkers) then {
    private _hqMarker = createMarker ["Synd_HQ", _basePos];
    _hqMarker setMarkerType "Empty";
    _hqMarker setMarkerText "Antistasi HQ";
};

// ---------------------------------------------------------------------------
// TERRAIN COMPATIBILITY
// ---------------------------------------------------------------------------
if (_terrainFallback) then {
    ["GENERIC"] call compileFinal preprocessFileLineNumbers "addons\\rhd_lifecore\\functions\\modules\\fn_terrainFallback.sqf";
};

// The A3A campaign owns the actual startup sequence.
[] spawn A3A_fnc_initServer;

diag_log format [
    "[RHD-LIFECORE] Antistasi Ultimate startup requested from 3DEN module at %1.",
    _basePos
];
