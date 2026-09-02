/*
    RHD - LifeCore | Generic Terrain Adapter
    Author: LT. Toad

    This is a compatibility shim, not a replacement for Antistasi mapInfo.

    When a terrain has no A3A mapInfo entry, Antistasi's normal mapInfo lookup
    can return an invalid config entry. RHD supplies a generic mission-local
    fallback with empty special-location lists and broad Arma object types.

    Supported behavior on an unmapped terrain:
    - Cities are discovered by A3A's normal CfgWorlds/Names logic.
    - Fuel stations, banks and radio towers can be discovered generically.
    - Core strategic systems still come from Antistasi Ultimate itself.

    A map-specific A3A mapInfo definition always wins over this fallback.
*/

params [["_mode", "GENERIC", [""]]];
if (_mode != "GENERIC") exitWith {false};

if (isNil "A3A_fnc_getMapInfo") exitWith {false};

// Preserve the original A3A function exactly once per mission.
if (isNil "RHD_A3A_ORIGINAL_GETMAPINFO") then {
    missionNamespace setVariable ["RHD_A3A_ORIGINAL_GETMAPINFO", A3A_fnc_getMapInfo, false];
};

private _original = missionNamespace getVariable ["RHD_A3A_ORIGINAL_GETMAPINFO", {}];

A3A_fnc_getMapInfo = {
    private _original = missionNamespace getVariable ["RHD_A3A_ORIGINAL_GETMAPINFO", {}];
    private _result = call _original;

    if (isClass _result) then {
        _result
    } else {
        missionConfigFile >> "A3A" >> "mapInfo" >> "generic"
    };
};

// Sensible generic world discovery lists. These are used by the mission-local
// fallback mapInfo class when the terrain is not covered by A3A mapInfo.
missionNamespace setVariable [
    "RHD_GENERIC_FUEL_TYPES",
    [
        "Land_FuelStation_Feed_F",
        "Land_fs_feed_F",
        "Land_FuelStation_01_pump_F",
        "Land_FuelStation_02_pump_F",
        "Land_FuelStation_03_pump_F",
        "Land_A_FuelStation_Feed",
        "Land_Ind_FuelStation_Feed_EP1",
        "Land_Fuelstation"
    ],
    false
];

missionNamespace setVariable [
    "RHD_GENERIC_ANTENNA_TYPES",
    [
        "Land_TTowerBig_1_F",
        "Land_TTowerBig_2_F",
        "Land_Communication_F",
        "Land_A_TVTower_base",
        "Land_vn_tower_signal_01"
    ],
    false
];

true
