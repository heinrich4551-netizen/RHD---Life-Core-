/*
    RHD - LifeCore | Server Bootstrap
    Author: LT. Toad

    This file starts the server-side RHD systems and persistence loop.
    Normal server owners usually do not need to edit this file.
*/

// Ambient civilians / traffic.
[] spawn RHD_fnc_director;

// Rare roadside micro-events.
[] spawn RHD_fnc_events;

// ---------------------------------------------------------------------------
// PLAYER PERSISTENCE
// ---------------------------------------------------------------------------
addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner"];

    if (_uid isEqualTo "") exitWith {};

    // Give the player object a moment to initialize before loading data.
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
