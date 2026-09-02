/*
    RHD - LifeCore | CONFLICT INITIALIZER
    Author: LT. Toad
    ---------------------------------------------------------------------------
    RHD conflict is now an RP layer around the Antistasi Ultimate campaign.

    The A3A engine owns the strategic war. RHD adds civilian/Life pressure and
    exposes district information to the cTab player tablet.

    BEGINNER EDITORS:
    Do NOT change tuning values here.
    Change them in `core/fn_init.sqf` under the Antistasi/Conflict section.
    ---------------------------------------------------------------------------
*/

if (!isServer) exitWith {false};

// Create the shared RHD district state early so the UI can safely query it.
missionNamespace setVariable ["RHD_CONFLICT_ZONES", createHashMap, true];

// Do not start a second strategic simulation. Wait for the A3A campaign core.
[] spawn {
    waitUntil {
        sleep 1;
        missionNamespace getVariable ["RHD_A3A_BASE_READY", false]
    };

    [] spawn RHD_fnc_conflictDirector;
};

true
