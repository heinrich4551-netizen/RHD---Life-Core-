/*
    RHD - LifeCore | CONTROLLED RUNTIME BOOTSTRAP
    Author: LT. Toad

    The RHD_Module_LifeCoreAntistasi 3DEN module is the authoritative
    controller. Runtime waits for that controller instead of silently
    enabling RHD or starting/duplicating an Antistasi campaign.
*/

if (!isServer) exitWith {};

[] spawn {
    private _deadline = time + 120;

    waitUntil {
        sleep 0.5;
        missionNamespace getVariable ["RHD_LIFECORE_CONTROLLER_READY", false]
            || {time >= _deadline}
    };

    if !(missionNamespace getVariable ["RHD_LIFECORE_CONTROLLER_READY", false]) exitWith {
        diag_log "[RHD-LIFECORE] Runtime stopped: place one RHD - LifeCore | Master Life RP + Antistasi Ultimate module in the mission.";
    };

    private _hasA3A = isClass (configFile >> "CfgPatches" >> "A3A_core") && {!isNil "A3A_fnc_initServer"};
    if (!_hasA3A) exitWith {
        diag_log "[RHD-LIFECORE] Runtime stopped: Antistasi Ultimate is not loaded.";
    };

    // The master module owns the A3A hand-off and RHD/A3A bridge.
    private _baseReady = missionNamespace getVariable ["RHD_A3A_BASE_READY", false];
    if (!_baseReady) then {
        _baseReady = [] call RHD_fnc_initBase;
    };

    if (!_baseReady) exitWith {
        diag_log "[RHD-LIFECORE] Runtime stopped: RHD/A3A base bridge did not become ready.";
    };

    if (missionNamespace getVariable ["RHD_LIFE_ENABLE_ECONOMY", true]) then {
        missionNamespace setVariable ["RHD_SHOP_SERVER_READY", true, true];
    };

    if (missionNamespace getVariable ["RHD_LIFE_ENABLE_AMBIENT", true]) then {
        if (!missionNamespace getVariable ["RHD_AMBIENT_RUNTIME_STARTED", false]) then {
            missionNamespace setVariable ["RHD_AMBIENT_RUNTIME_STARTED", true, true];
            [] spawn RHD_fnc_director;
            [] spawn RHD_fnc_events;
        };
    };

    if (missionNamespace getVariable ["RHD_LIFE_ENABLE_CONFLICT", true]) then {
        if (!missionNamespace getVariable ["RHD_CONFLICT_RUNTIME_STARTED", false]) then {
            missionNamespace setVariable ["RHD_CONFLICT_RUNTIME_STARTED", true, true];
            [] spawn RHD_fnc_conflictInit;
        };
    };

    if (missionNamespace getVariable ["RHD_LIFE_ENABLE_PERSISTENCE", true]) then {
        if (!missionNamespace getVariable ["RHD_PERSISTENCE_RUNTIME_STARTED", false]) then {
            missionNamespace setVariable ["RHD_PERSISTENCE_RUNTIME_STARTED", true, true];

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
                private _interval = missionNamespace getVariable ["RHD_PERSISTENCE_SAVE_INTERVAL_SECONDS", 180];
                while {isServer && {missionNamespace getVariable ["RHD_PERSISTENCE_RUNTIME_STARTED", false]}} do {
                    sleep _interval;
                    {
                        private _uid = getPlayerUID _x;
                        if (_uid != "") then {[_uid] call RHD_fnc_savePlayer;};
                    } forEach allPlayers;
                };
            };
        };
    };

    missionNamespace setVariable ["RHD_ANTISTASI_RUNTIME_READY", true, true];
    diag_log format [
        "[RHD-LIFECORE] Controlled runtime ready: terrain=%1, locations=%2, A3A=%3",
        worldName,
        missionNamespace getVariable ["RHD_DYNAMIC_LOCATION_COUNT", 0],
        missionNamespace getVariable ["RHD_A3A_BASE_READY", false]
    ];
};
