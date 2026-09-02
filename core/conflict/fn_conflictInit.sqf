/*
    RHD - LifeCore | CONFLICT INITIALIZER
    Author: LT. Toad
    ---------------------------------------------------------------------------
    This is the startup hook for the RHD district-pressure system.

    BEGINNER EDITORS:
    Do NOT change tuning values here.
    Change conflict settings in `core/fn_init.sqf` under
    "ANTISTASI-STYLE DISTRICT PRESSURE" so all easy-to-edit server settings
    stay in one location.

    The system is RHD-owned and only inspired by persistent-world pressure
    concepts from Antistasi Ultimate. Antistasi Ultimate is not loaded.
    ---------------------------------------------------------------------------
*/

if (!isServer) exitWith {false};

// Create the shared district state before the director starts.
missionNamespace setVariable ["RHD_CONFLICT_ZONES", createHashMap, true];

[] spawn RHD_fnc_conflictDirector;
true
