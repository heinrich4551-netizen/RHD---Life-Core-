/*
    RHD - LifeCore | SERVER BOOTSTRAP
    Author: LT. Toad
    ---------------------------------------------------------------------------
    SERVER STARTUP ORDER
    --------------------
    1. 3DEN Antistasi Ultimate Base module starts the A3A campaign.
    2. RHD waits for A3A serverInitDone.
    3. 3DEN Life RP Systems module decides which RHD-only systems start.

    This file intentionally contains no map coordinates or shop locations.
    ---------------------------------------------------------------------------
*/

if (!isServer) exitWith {};

// ============================================================================
// WAIT FOR THE 3DEN ANTISTASI BASE MODULE
// ============================================================================
private _moduleDeadline = time + 120;
waitUntil {
    sleep 0.25;
    missionNamespace getVariable ["RHD_A3A_MODULE_STARTED", false] || {time > _moduleDeadline}
};

if !(missionNamespace getVariable ["RHD_A3A_MODULE_STARTED", false]) exitWith {
    diag_log "[RHD-LIFECORE] ERROR: Place the RHD - LifeCore | Antistasi Ultimate Base module in 3DEN.";
};

// Wait for the actual Antistasi campaign to complete its own startup.
private _baseReady = [] call RHD_fnc_initBase;
if (!_baseReady) exitWith {
    diag_log "[RHD-LIFECORE] ERROR: Antistasi Ultimate did not reach serverInitDone. RHD startup cancelled.";
};

// ============================================================================
// WAIT FOR THE 3DEN RHD LIFE MODULE
// ============================================================================
private _lifeDeadline = time + 60;
waitUntil {
    sleep 0.25;
    missionNamespace getVariable ["RHD_LIFE_MODULE_READY", false] || {time > _lifeDeadline}
};

if !(missionNamespace getVariable ["RHD_LIFE_MODULE_READY", false]) exitWith {
    diag_log "[RHD-LIFECORE] ERROR: Place the RHD - LifeCore | Life RP Systems module in 3DEN.";
};

// ============================================================================
// RHD-ONLY SYSTEMS
// ============================================================================
if (missionNamespace getVariable ["RHD_LIFE_ENABLE_BRANDING", true]) then {
    [] spawn {
        sleep 1;
        [] call compileFinal preprocessFileLineNumbers "core\\branding\\fn_applyBillboards.sqf";
    };
};

if (missionNamespace getVariable ["RHD_LIFE_ENABLE_ECONOMY", true]) then {
    // The actual catalogue is generated locally from the active Arma modset.
    missionNamespace setVariable ["RHD_SHOP_SERVER_READY", true, true];
};

if (missionNamespace getVariable ["RHD_LIFE_ENABLE_AMBIENT", true]) then {
    [] spawn RHD_fnc_director;
    [] spawn RHD_fnc_events;
};

if (missionNamespace getVariable ["RHD_LIFE_ENABLE_CONFLICT", true]) then {
    [] spawn RHD_fnc_conflictInit;
};

// ============================================================================
// LIFE RP PERSISTENCE
// ============================================================================
if (missionNamespace getVariable ["RHD_LIFE_ENABLE_PERSISTENCE", true]) then {
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
};
