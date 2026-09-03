/*
    RHD - LifeCore | ADDON RUNTIME BOOTSTRAP
    Author: LT. Toad

    Makes RHD Life RP operate when loaded alongside an existing Antistasi
    Ultimate mission. The bundled 3DEN mission still uses its modules, but
    native A3A missions do not need RHD modules placed in Eden.
*/

if (!isServer) exitWith {};

[] spawn {
    private _hasA3A = isClass (configFile >> "CfgPatches" >> "A3A_core") && {!isNil "A3A_fnc_initServer"};

    if (!_hasA3A) exitWith {
        diag_log "[RHD-LIFECORE] Addon runtime: Antistasi Ultimate not detected; waiting for the mission Life RP module.";
    };

    // Native Antistasi missions do not contain the RHD 3DEN Life module.
    // Enable the full RHD RP stack automatically in that case.
    if !(missionNamespace getVariable ["RHD_LIFE_MODULE_READY", false]) then {
        {
            missionNamespace setVariable [format ["RHD_LIFE_ENABLE_%1", _x], true, true];
        } forEach [
            "ECONOMY",
            "JOBS",
            "INDUSTRY",
            "RP",
            "PERSISTENCE",
            "AMBIENT",
            "BRANDING",
            "TABLET",
            "CONFLICT"
        ];
        missionNamespace setVariable ["RHD_LIFE_MODULE_READY", true, true];
        missionNamespace setVariable ["RHD_LIFE_AUTO_ANTISTASI", true, true];
        diag_log "[RHD-LIFECORE] Addon runtime: auto-enabled RHD Life RP for native Antistasi Ultimate.";
    };

    // Never start Antistasi a second time. Attach to the already-running A3A
    // campaign and wait for its authoritative world state.
    private _baseReady = [] call RHD_fnc_initBase;
    if (!_baseReady) exitWith {
        diag_log "[RHD-LIFECORE] Addon runtime: RHD/A3A bridge initialization failed.";
    };

    if (!missionNamespace getVariable ["RHD_DYNAMIC_LOCATIONS_STARTED", false]) then {
        missionNamespace setVariable ["RHD_DYNAMIC_LOCATIONS_STARTED", true, true];
        private _locationsOK = [] call RHD_fnc_dynamicLocations;
        if (!_locationsOK) then {
            missionNamespace setVariable ["RHD_DYNAMIC_LOCATIONS_STARTED", false, true];
            diag_log "[RHD-LIFECORE] Addon runtime: dynamic RP locations failed to initialize.";
        };
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
        "[RHD-LIFECORE] Native Antistasi runtime ready: terrain=%1, locations=%2, A3A=%3",
        worldName,
        missionNamespace getVariable ["RHD_DYNAMIC_LOCATION_COUNT", 0],
        missionNamespace getVariable ["RHD_A3A_BASE_READY", false]
    ];
};
