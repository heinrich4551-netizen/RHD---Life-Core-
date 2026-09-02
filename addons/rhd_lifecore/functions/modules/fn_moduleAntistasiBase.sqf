/*
    RHD - LifeCore | 3DEN MODULE: ANTISTASI ULTIMATE BRIDGE
    Author: LT. Toad

    This module is used by the bundled Altis mission and custom 3DEN missions.
    Antistasi Ultimate is required by the published RHD profile.
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

if (!_hasA3A) exitWith {
    diag_log "[RHD-LIFECORE] ERROR: Antistasi Ultimate (A3A_core) is not loaded.";
    missionNamespace setVariable ["RHD_A3A_MODE", "MISSING_DEPENDENCY", true];
};

missionNamespace setVariable ["RHD_A3A_MODE", "ANTISTASI", true];

private _autoStart = _logic getVariable ["RHD_A3A_AutoStart", true];
private _createHQ = _logic getVariable ["RHD_A3A_CreateHQ", true];
private _terrainFallback = _logic getVariable ["RHD_A3A_TerrainFallback", true];

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
    ["GENERIC"] call RHD_fnc_terrainFallback;
};

[] spawn A3A_fnc_initServer;

diag_log format [
    "[RHD-LIFECORE] Antistasi Ultimate startup requested from 3DEN bridge at %1.",
    _basePos
];
