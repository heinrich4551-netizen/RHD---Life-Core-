/*
    RHD - LifeCore | Conflict Layer
    Author: LT. Toad

    PURPOSE
    -------
    Adds an Antistasi-style persistent world-pressure layer to LifeCore:
    - map-defined districts using rhd_zone_* markers;
    - district heat / public-order pressure;
    - local law-enforcement presence;
    - local criminal pressure;
    - supply level used by future conflict jobs and events.

    IMPORTANT
    ---------
    This is an RHD implementation. It does not load or depend on the
    Antistasi Ultimate mission framework at runtime.
*/

if (!isServer) exitWith {false};

// ---------------------------------------------------------------------------
// BEGINNER SETTINGS
// ---------------------------------------------------------------------------
missionNamespace setVariable ["RHD_CONFLICT_ENABLE", true, true];
missionNamespace setVariable ["RHD_CONFLICT_UPDATE_SECONDS", 60, true];
missionNamespace setVariable ["RHD_CONFLICT_ZONE_RADIUS", 400, true];
missionNamespace setVariable ["RHD_CONFLICT_MAX_HEAT", 100, true];
missionNamespace setVariable ["RHD_CONFLICT_HEAT_DECAY_WITH_POLICE", 1.5, true];
missionNamespace setVariable ["RHD_CONFLICT_HEAT_GROWTH_NO_POLICE", 0.25, true];
missionNamespace setVariable ["RHD_CONFLICT_START_SUPPLY", 100, true];

missionNamespace setVariable ["RHD_CONFLICT_ZONES", createHashMap, true];

[] spawn RHD_fnc_conflictDirector;
true
