/*
    RHD - LifeCore | SERVER BOOTSTRAP
    Author: LT. Toad
    ---------------------------------------------------------------------------
    This file starts the server-side RHD systems and persistence routines.

    NORMAL SERVER OWNERS:
    You normally do not need to edit this file.

    USE INSTEAD:
    - core/fn_init.sqf       -> jobs, items, prices, admins and tuning
    - 3DEN_SETUP.md          -> map locations and district markers
    ---------------------------------------------------------------------------
*/

// ============================================================================
// AMBIENT WORLD SYSTEMS
// ============================================================================
[] spawn RHD_fnc_director; // Ambient civilians / traffic.
[] spawn RHD_fnc_events;   // Rare roadside micro-events.

// ============================================================================
// PLAYER PERSISTENCE
// ============================================================================
addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner"];

    if (_uid isEqualTo "") exitWith {};

    // Give the player object a moment to initialize before loading saved data.
    [_uid] spawn {
        params ["_uid"];
        sleep 2;
        [_uid] call RHD_fnc_loadPlayer;
    };
}];

addMissionEventHandler ["PlayerDisconnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner"];

    if (_uid isEqualTo "") exitWith {};

    // Save immediately when a player leaves.
    [_uid] call RHD_fnc_savePlayer;
}];

// Periodic autosave protects player data during long server sessions.
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
