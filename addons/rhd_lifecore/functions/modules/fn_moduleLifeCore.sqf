/*
    RHD - LifeCore | 3DEN MODULE: LIFE RP SYSTEMS
    Author: LT. Toad

    This module is the on/off switch for systems that do NOT belong to
    Antistasi Ultimate. It keeps normal map configuration inside 3DEN and keeps
    the core gameplay settings in core/fn_init.sqf.

    PLACE THIS IN 3DEN
    ------------------
    Eden -> Systems -> RHD - LifeCore -> Life RP Systems

    Place one module in every mission. The module is global and publishes its
    choices so server and clients use the same configuration.
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

diag_log format [
    "[RHD-LIFECORE] Life RP 3DEN module initialized. Settings: %1",
    _settings
];
