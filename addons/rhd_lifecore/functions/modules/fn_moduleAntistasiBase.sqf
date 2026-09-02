/*
    RHD - LifeCore | 3DEN MODULE: ANTISTASI ULTIMATE BRIDGE
    Author: LT. Toad

    PLACE IN 3DEN
    --------------
    Systems -> RHD - LifeCore -> Antistasi Ultimate Bridge

    Antistasi Ultimate is optional. When A3A_core is present, this module
    bridges RHD to the installed Antistasi campaign. When A3A is absent, the
    module simply enables the standalone RHD LifeCore runtime.
*/

params [
    ["_logic", objNull, [objNull]],
    ["_activated", true, [true]]
];

if (!_activated || {isNull _logic}) exitWith {};
if (!isServer) exitWith {};

if (missionNamespace getVariable ["RHD_A3A_MODULE_STARTED", false]) exitWith {
    diag_log "[RHD-LIFECORE] Antistasi bridge module already activated.";
};

missionNamespace setVariable ["RHD_A3A_MODULE_STARTED", true, true];
missionNamespace setVariable ["RHD_A3A_MODULE_LOGIC", _logic, true];

private _hasA3A = isClass (configFile >> "CfgPatches" >> "A3A_core") && {!isNil "A3A_fnc_initServer"};
missionNamespace setVariable ["RHD_A3A_INSTALLED", _hasA3A, true];

private _autoStart = _logic getVariable ["RHD_A3A_AutoStart", true];
private _createHQ = _logic getVariable ["RHD_A3A_CreateHQ", true];
private _terrainFallback = _logic getVariable ["RHD_A3A_TerrainFallback", true];

// Without Antistasi Ultimate, this module is a harmless standalone-mode gate.
if (!_hasA3A) exitWith {
    missionNamespace setVariable ["RHD_A3A_MODE", "STANDALONE", true];
    diag_log "[RHD-LIFECORE] Antistasi Ultimate not installed; continuing in standalone RHD mode.";
};

missionNamespace setVariable ["RHD_A3A_MODE", "ANTISTASI", true];

if (!_autoStart) exitWith {
    diag_log "[RHD-LIFECORE] Antistasi auto-start disabled on the 3DEN bridge module.";
};

private _basePos = getPosATL _logic;
private _baseDir = getDir _logic;

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
};

if !("respawn_guerrila" in allMapMarkers) then {
    private _respawn = createMarker ["respawn_guerrila", _basePos];
    _respawn setMarkerText "RHD Campaign Start";
};

if !("Synd_HQ" in allMapMarkers) then {
    private _hq = createMarker ["Synd_HQ", _basePos];
    _hq setMarkerText "Antistasi HQ";
};

if (_terrainFallback) then {
    ["GENERIC"] call compileFinal preprocessFileLineNumbers "\\rhd\\addons\\rhd_lifecore\\functions\\modules\\fn_terrainFallback.sqf";
};

[] spawn A3A_fnc_initServer;

diag_log format [
    "[RHD-LIFECORE] Antistasi Ultimate startup requested from 3DEN bridge at %1.",
    _basePos
];
