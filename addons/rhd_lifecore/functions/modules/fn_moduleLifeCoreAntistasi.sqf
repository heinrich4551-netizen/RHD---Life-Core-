/*
    RHD - LifeCore | MASTER 3DEN MODULE
    Author: LT. Toad

    This is the single controller for RHD LifeCore + Antistasi Ultimate.
    Place ONE copy of this module in the mission.

    The module does not replace Antistasi Ultimate's strategic engine. It
    enables the RHD Life RP stack, waits for A3A's authoritative server state,
    then attaches RHD locations/economy/crime/services to that live campaign.
*/

params [
    ["_logic", objNull, [objNull]],
    ["_activated", true, [true]]
];

if (!_activated || {isNull _logic}) exitWith {};
if (!isServer) exitWith {};

if (missionNamespace getVariable ["RHD_LIFECORE_CONTROLLER_READY", false]) exitWith {
    diag_log "[RHD-LIFECORE] Master RHD/Antistasi controller already initialized.";
};

private _hasA3A = isClass (configFile >> "CfgPatches" >> "A3A_core") && {!isNil "A3A_fnc_initServer"};
if (!_hasA3A) exitWith {
    diag_log "[RHD-LIFECORE] ERROR: Antistasi Ultimate is required for the master controller.";
};

private _read = {
    params ["_name", "_default"];
    _logic getVariable [_name, _default]
};

// Master switches.
private _settings = [
    ["economy",     ["RHD_EnableEconomy", true] call _read],
    ["jobs",        ["RHD_EnableJobs", true] call _read],
    ["industry",    ["RHD_EnableIndustry", true] call _read],
    ["rp",          ["RHD_EnableRP", true] call _read],
    ["persistence", ["RHD_EnablePersistence", true] call _read],
    ["ambient",     ["RHD_EnableAmbient", true] call _read],
    ["branding",    ["RHD_EnableBranding", true] call _read],
    ["tablet",      ["RHD_EnableTablet", true] call _read],
    ["conflict",    ["RHD_EnableConflict", true] call _read]
];

{
    missionNamespace setVariable [format ["RHD_LIFE_ENABLE_%1", toUpper (_x select 0)], (_x select 1), true];
} forEach _settings;

missionNamespace setVariable ["RHD_LIFE_SETTINGS", _settings, true];
missionNamespace setVariable ["RHD_LIFE_MODULE_READY", true, true];
missionNamespace setVariable ["RHD_LIFECORE_CONTROLLER_READY", true, true];
missionNamespace setVariable ["RHD_LIFECORE_CONTROLLER_LOGIC", _logic, true];
missionNamespace setVariable ["RHD_LIFECORE_CONTROLS_ANTISTASI", true, true];
missionNamespace setVariable ["RHD_A3A_REQUIRED", true, true];
missionNamespace setVariable ["RHD_A3A_WORLD_BRIDGE_ENABLE", true, true];
missionNamespace setVariable ["RHD_A3A_INSTALLED", true, true];
missionNamespace setVariable ["RHD_A3A_MODE", "ANTISTASI", true];

// Never start A3A from the RHD module. Native Antistasi already owns startup.
// This makes the module a bridge/controller rather than a second campaign boot.
[] spawn {
    private _deadline = time + (missionNamespace getVariable ["RHD_A3A_BRIDGE_WAIT_SECONDS", 180]);

    waitUntil {
        sleep 0.5;
        (!isNil "serverInitDone" && {serverInitDone}) || {time >= _deadline}
    };

    private _baseReady = [] call RHD_fnc_initBase;
    if (!_baseReady) then {
        diag_log "[RHD-LIFECORE] Master controller: RHD/A3A base bridge did not report ready.";
    };

    // Start the terrain-aware RHD resolver once. It consumes A3A control data
    // when available and falls back to terrain discovery when it is not.
    if (!missionNamespace getVariable ["RHD_DYNAMIC_LOCATIONS_STARTED", false]) then {
        missionNamespace setVariable ["RHD_DYNAMIC_LOCATIONS_STARTED", true, true];
        private _locationsOK = [] call RHD_fnc_dynamicLocations;
        if (!_locationsOK) then {
            missionNamespace setVariable ["RHD_DYNAMIC_LOCATIONS_STARTED", false, true];
            diag_log "[RHD-LIFECORE] Master controller: dynamic RHD locations failed to initialize.";
        } else {
            if (!missionNamespace getVariable ["RHD_DYNAMIC_LOCATION_SYNC_STARTED", false]) then {
                missionNamespace setVariable ["RHD_DYNAMIC_LOCATION_SYNC_STARTED", true, true];
                [] spawn RHD_fnc_dynamicLocationSync;
            };
        };
    };

    missionNamespace setVariable ["RHD_ANTISTASI_RUNTIME_READY", true, true];

    diag_log format [
        "[RHD-LIFECORE] Master RHD/Antistasi controller ready. Terrain=%1 A3AReady=%2 Settings=%3",
        worldName,
        missionNamespace getVariable ["RHD_A3A_BASE_READY", false],
        missionNamespace getVariable ["RHD_LIFE_SETTINGS", []]
    ];
};

true
