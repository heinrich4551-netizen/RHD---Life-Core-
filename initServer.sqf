/*
    RHD - LifeCore | SERVER BOOTSTRAP
    Author: LT. Toad
    ---------------------------------------------------------------------------
    BASE
    ----
    RHD waits for the Antistasi Ultimate campaign core and then starts the
    Life RP layer around that world state.

    NORMAL SERVER OWNERS:
    You normally do not need to edit this file.

    USE INSTEAD:
    - core/fn_init.sqf       -> jobs, items, prices, admins and tuning
    - 3DEN_SETUP.md          -> map locations, district markers and billboards
    - ANTISTASI_BASE.md      -> how the A3A foundation is used
    ---------------------------------------------------------------------------
*/

// ============================================================================
// ANTISTASI ULTIMATE BASE
// ============================================================================
[] spawn {
    private _baseReady = [] call RHD_fnc_initBase;

    if (!_baseReady) exitWith {
        diag_log "[RHD-LIFECORE] Server startup stopped because the Antistasi Ultimate base was not ready.";
    };

    // ========================================================================
    // RHD BRANDING
    // ========================================================================
    [] spawn {
        sleep 1;
        [] call compileFinal preprocessFileLineNumbers "core\\branding\\fn_applyBillboards.sqf";
    };

    // ========================================================================
    // AMBIENT WORLD SYSTEMS
    // ========================================================================
    [] spawn RHD_fnc_director; // Ambient civilians / traffic.
    [] spawn RHD_fnc_events;   // Rare roadside micro-events.
};

// ============================================================================
// PLAYER PERSISTENCE
// ============================================================================
// Life RP data is kept separate from the Antistasi campaign save so each layer
// can evolve without corrupting the other. The world/war state remains A3A.
addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner"];

    if (_uid isEqualTo "") exitWith {};

    [_uid] spawn {
        params ["_uid"];
        sleep 5;
        [_uid] call RHD_fnc_loadPlayer;
    };
}];

addMissionEventHandler ["PlayerDisconnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner"];

    if (_uid isEqualTo "") exitWith {};
    [_uid] call RHD_fnc_savePlayer;
}];

// Periodic autosave protects Life RP data during long server sessions.
[] spawn {
    while {isServer} do {
        sleep 180;

        {
            private _uid = getPlayerUID _x;

            if (_uid != "") then {
                [_uid] call RHD_fnc_savePlayer;
            };
        } forEach allPlayers;
    };
};
