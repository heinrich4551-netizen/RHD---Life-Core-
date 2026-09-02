/*
    RHD - LifeCore | SERVER BOOTSTRAP
    Author: LT. Toad
    ---------------------------------------------------------------------------
    This mission can run in two modes:
      1. STANDALONE: RHD Life RP only. No Antistasi Ultimate required.
      2. ANTISTASI: the optional 3DEN bridge connects RHD to installed A3A.

    The 3DEN Life RP Systems module is required for RHD gameplay features.
    The Antistasi bridge module is optional.
    ---------------------------------------------------------------------------
*/

if (!isServer) exitWith {};

// ============================================================================
// OPTIONAL ANTISTASI BRIDGE
// Do not block standalone missions waiting for A3A.
// ============================================================================
private _bridgeWait = missionNamespace getVariable ["RHD_A3A_BRIDGE_WAIT_SECONDS", 10];
private _bridgeDeadline = time + _bridgeWait;

waitUntil {
    sleep 0.25;
    missionNamespace getVariable ["RHD_A3A_MODULE_STARTED", false] || {time > _bridgeDeadline}
};

if (missionNamespace getVariable ["RHD_A3A_MODULE_STARTED", false]) then {
    private _baseReady = [] call RHD_fnc_initBase;

    if (!_baseReady) then {
        diag_log "[RHD-LIFECORE] WARNING: Antistasi bridge did not complete cleanly; RHD continues with its own Life RP systems.";
    };
} else {
    missionNamespace setVariable ["RHD_A3A_BASE_READY", true, true];
    missionNamespace setVariable ["RHD_A3A_INSTALLED", false, true];
    missionNamespace setVariable ["RHD_A3A_MODE", "STANDALONE", true];
    missionNamespace setVariable ["RHD_A3A_BASE_VERSION", "not connected", true];
    missionNamespace setVariable ["RHD_A3A_BASE_STARTED", false, true];
    missionNamespace setVariable ["RHD_A3A_ZONE_MARKERS", [], true];
    missionNamespace setVariable ["RHD_A3A_HQ", objNull, true];
    diag_log "[RHD-LIFECORE] No RHD Antistasi bridge module detected; starting RHD in standalone mode.";
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
