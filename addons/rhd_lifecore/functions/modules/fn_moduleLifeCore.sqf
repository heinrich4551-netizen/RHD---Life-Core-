/*
    RHD - LifeCore | 3DEN MODULE: LIFE RP SYSTEMS
    Author: LT. Toad

    This module enables the RHD Life RP systems and starts the terrain-aware
    location resolver. Location placement is server-authoritative and is
    synchronized to the live Antistasi Ultimate campaign state.
*/

params [
    ["_logic", objNull, [objNull]],
    ["_activated", true, [true]]
];

if (!_activated || {isNull _logic}) exitWith {};

private _settings = [
    ["economy",     _logic getVariable ["RHD_EnableEconomy", true]],
    ["jobs",        _logic getVariable ["RHD_EnableJobs", true]],
    ["industry",    _logic getVariable ["RHD_EnableIndustry", true]],
    ["rp",          _logic getVariable ["RHD_EnableRP", true]],
    ["persistence", _logic getVariable ["RHD_EnablePersistence", true]],
    ["ambient",     _logic getVariable ["RHD_EnableAmbient", true]],
    ["branding",    _logic getVariable ["RHD_EnableBranding", true]],
    ["tablet",      _logic getVariable ["RHD_EnableTablet", true]],
    ["conflict",    _logic getVariable ["RHD_EnableConflict", true]]
];

missionNamespace setVariable ["RHD_LIFE_MODULE_READY", true, true];
missionNamespace setVariable ["RHD_LIFE_MODULE_LOGIC", _logic, true];
missionNamespace setVariable ["RHD_LIFE_SETTINGS", _settings, true];

{
    private _name = _x select 0;
    private _enabled = _x select 1;
    missionNamespace setVariable [format ["RHD_LIFE_ENABLE_%1", toUpper _name], _enabled, true];
} forEach _settings;

// Resolve the initial map layer once. The resolver itself waits for
// Antistasi Ultimate's authoritative world initialization when configured.
if (isServer && {missionNamespace getVariable ["RHD_DYNAMIC_LOCATIONS_ENABLE", true]}) then {
    if (!missionNamespace getVariable ["RHD_DYNAMIC_LOCATIONS_STARTED", false]) then {
        missionNamespace setVariable ["RHD_DYNAMIC_LOCATIONS_STARTED", true, true];
        [] spawn {
            sleep 1;
            private _ok = [] call RHD_fnc_dynamicLocations;
            if (_ok) then {
                // Keep A3A control districts and the RHD location registry in
                // sync for the life of the server.
                if (!missionNamespace getVariable ["RHD_DYNAMIC_LOCATION_SYNC_STARTED", false]) then {
                    missionNamespace setVariable ["RHD_DYNAMIC_LOCATION_SYNC_STARTED", true, true];
                    [] spawn RHD_fnc_dynamicLocationSync;
                };
            } else {
                missionNamespace setVariable ["RHD_DYNAMIC_LOCATIONS_STARTED", false, true];
            };
        };
    };
};

diag_log format [
    "[RHD-LIFECORE] Life RP 3DEN module initialized. Settings: %1",
    _settings
];
