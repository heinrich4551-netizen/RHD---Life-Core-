/*
    RHD - LifeCore | Conflict Layer Initializer
    Author: LT. Toad

    PURPOSE
    -------
    Provides an RHD implementation of a persistent district-pressure layer.
    The design is inspired by the persistent world / territory pressure
    style used by Antistasi Ultimate, but the implementation is written for
    RHD LifeCore and does NOT load Antistasi Ultimate at runtime.

    BEGINNER SETTINGS
    -----------------
    Change the values below to control how strongly crime and police activity
    affect each rhd_zone_* district.
*/

if (!isServer) exitWith {false};

// How often the district system updates.
missionNamespace setVariable ["RHD_CONFLICT_ENABLE", true, true];
missionNamespace setVariable ["RHD_CONFLICT_UPDATE_SECONDS", 60, true];

// Radius around each rhd_zone_* marker that counts as the district.
missionNamespace setVariable ["RHD_CONFLICT_ZONE_RADIUS", 400, true];

// Heat is the district's criminal/public-order pressure from 0 to 100.
missionNamespace setVariable ["RHD_CONFLICT_MAX_HEAT", 100, true];
missionNamespace setVariable ["RHD_CONFLICT_HEAT_DECAY_WITH_POLICE", 1.5, true];
missionNamespace setVariable ["RHD_CONFLICT_HEAT_GROWTH_NO_POLICE", 0.25, true];

// Supply is a generic district resource value for future jobs/events.
missionNamespace setVariable ["RHD_CONFLICT_START_SUPPLY", 100, true];

missionNamespace setVariable ["RHD_CONFLICT_ZONES", createHashMap, true];

[] spawn RHD_fnc_conflictDirector;
true
