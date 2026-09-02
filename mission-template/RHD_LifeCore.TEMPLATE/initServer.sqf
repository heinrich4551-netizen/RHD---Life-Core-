/*
    RHD - LifeCore | SERVER BOOTSTRAP
    Author: LT. Toad
    ---------------------------------------------------------------------------
    Published scenario: Antistasi Ultimate + RHD LifeCore.
    Antistasi Ultimate supplies the campaign state; RHD dynamically resolves
    service/economy/industry locations after A3A world initialization.
    ---------------------------------------------------------------------------
*/

if (!isServer) exitWith {};

// ============================================================================
// ANTISTASI ULTIMATE BRIDGE
// ============================================================================
private _bridgeWait = missionNamespace getVariable ["RHD_A3A_BRIDGE_WAIT_SECONDS", 180];
private _bridgeDeadline = time + _bridgeWait;

waitUntil {
    sleep 0.25;
    missionNamespace getVariable ["RHD_A3A_MODULE_STARTED", false] || {time > _bridgeDeadline}
};

if !(missionNamespace getVariable ["RHD_A3A_MODULE_STARTED", false]) exitWith {
    diag_log "[RHD-LIFECORE] ERROR: Antistasi Ultimate bridge module did not initialize.";
};

private _baseReady = [] call RHD_fnc_initBase;
if (!_baseReady) then {
    diag_log "[RHD-LIFECORE] ERROR: Antistasi Ultimate did not become ready.";
};

if !(missionNamespace getVariable ["RHD_A3A_BASE_READY", false]) exitWith {
    diag_log "[RHD-LIFECORE] ERROR: RHD startup halted because Antistasi Ultimate was not ready.";
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
// WAIT FOR TERRAIN/LOCATION RESOLUTION BEFORE STARTING SYSTEMS THAT CONSUME
// RHD MARKERS. This prevents race conditions with shops, gathering, refining
// and conflict districts.
// ============================================================================
private _locationDeadline = time + (missionNamespace getVariable ["RHD_DYNAMIC_LOCATIONS_WAIT_SECONDS", 180]);
waitUntil {
    sleep 0.25;
    missionNamespace getVariable ["RHD_DYNAMIC_LOCATIONS_READY", false] || {time > _locationDeadline}
};

if !(missionNamespace getVariable ["RHD_DYNAMIC_LOCATIONS_READY", false]) then {
    diag_log "[RHD-LIFECORE] WARNING: Dynamic locations did not complete before timeout.";
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
        private _saveInterval = missionNamespace getVariable ["RHD_PERSISTENCE_SAVE_INTERVAL_SECONDS", 180];
        while {isServer} do {
            sleep _saveInterval;
            {
                private _uid = getPlayerUID _x;
                if (_uid != "") then {
                    [_uid] call RHD_fnc_savePlayer;
                };
            } forEach allPlayers;
        };
    };
};
