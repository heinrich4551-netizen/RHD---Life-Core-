/*
    RHD - LifeCore | 3DEN MODULE: ANTISTASI ULTIMATE BASE
    Author: LT. Toad

    PLACE IN 3DEN
    --------------
    Systems -> RHD - LifeCore -> Antistasi Ultimate Base

    This module is the mission's explicit A3A startup switch. It does not
    replace or duplicate the Antistasi strategic engine.
*/

params [
    ["_logic", objNull, [objNull]],
    ["_activated", true, [true]]
];

if (!_activated || {isNull _logic}) exitWith {};
if (!isServer) exitWith {};

if (missionNamespace getVariable ["RHD_A3A_MODULE_STARTED", false]) exitWith {
    diag_log "[RHD-LIFECORE] Antistasi startup module already activated.";
};

if !(isClass (configFile >> "CfgPatches" >> "A3A_core")) exitWith {
    diag_log "[RHD-LIFECORE] ERROR: Antistasi Ultimate is not loaded.";
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
    diag_log "[RHD-LIFECORE] Antistasi auto-start disabled on the 3DEN module.";
};

private _basePos = getPosATL _logic;
private _baseDir = getDir _logic;

// Host-mission anchors expected by the A3A server initializer.
if (_createHQ) then {
    private _newAnchor = {
        params ["_class", "_offset"];
        private _obj = createVehicle [_class, _basePos vectorAdd _offset, [], 0, "CAN_COLLIDE"];
        _obj setDir _baseDir;
        _obj enableSimulationGlobal false;
        _obj
    };

    if (isNil "boxX" || {isNull boxX}) then {
        boxX = ["B_supplyCrate_F", [3, 0, 0]] call _newAnchor;
        publicVariable "boxX";
    };

    if (isNil "vehicleBox" || {isNull vehicleBox}) then {
        vehicleBox = ["B_supplyCrate_F", [0, 3, 0]] call _newAnchor;
        publicVariable "vehicleBox";
    };

    if (isNil "mapX" || {isNull mapX}) then {
        mapX = ["Land_MapBoard_F", [-3, 0, 0]] call _newAnchor;
        publicVariable "mapX";
    };

    if (isNil "flagX" || {isNull flagX}) then {
        flagX = ["FlagCarrierWhite_F", [0, -3, 0]] call _newAnchor;
        publicVariable "flagX";
    };

    // Do not create a fake Petros class. A3A owns Petros and initializes the
    // correct campaign object from its loaded templates during startup.
};

// Required A3A marker names if the host mission does not already contain them.
if !("respawn_guerrila" in allMapMarkers) then {
    private _respawn = createMarker ["respawn_guerrila", _basePos];
    _respawn setMarkerText "RHD Campaign Start";
};

if !("Synd_HQ" in allMapMarkers) then {
    private _hq = createMarker ["Synd_HQ", _basePos];
    _hq setMarkerText "Antistasi HQ";
};

// This file lives inside the compiled RHD addon PBO, so use the canonical
// addon prefix emitted in $PBOPREFIX$.
if (_terrainFallback) then {
    ["GENERIC"] call compileFinal preprocessFileLineNumbers "\\rhd\\addons\\rhd_lifecore\\functions\\modules\\fn_terrainFallback.sqf";
};

// Start the actual Antistasi Ultimate campaign. A3A owns all strategic logic.
[] spawn A3A_fnc_initServer;

diag_log format [
    "[RHD-LIFECORE] Antistasi Ultimate startup requested from 3DEN module at %1.",
    _basePos
];
