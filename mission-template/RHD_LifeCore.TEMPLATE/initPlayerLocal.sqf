/*
    RHD - LifeCore | PLAYER CLIENT BOOTSTRAP
    Author: LT. Toad

    The RHD Life RP Systems 3DEN module is required for player features.
*/

private _moduleTimeout = missionNamespace getVariable ["RHD_STANDALONE_INIT_TIMEOUT_SECONDS", 15];
private _moduleDeadline = time + _moduleTimeout;

waitUntil {
    sleep 0.25;
    missionNamespace getVariable ["RHD_LIFE_MODULE_READY", false] || {time > _moduleDeadline}
};

if !(missionNamespace getVariable ["RHD_LIFE_MODULE_READY", false]) exitWith {
    diag_log "[RHD-LIFECORE] ERROR: RHD Life RP Systems module was not initialized. Place one RHD Life RP Systems module in 3DEN.";
};

// RHD player identity/inventory starts only after the Life module is enabled.
[] call RHD_fnc_initPlayer;

waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call RHD_fnc_keyHandler"];

// ACE setup is optional; the RHD function performs its own presence check.
[] call RHD_fnc_aceInit;

[] spawn {
    waitUntil {!isNull player};

    if (missionNamespace getVariable ["RHD_LIFE_ENABLE_TABLET", true]) then {
        sleep 1;
        [] call RHD_fnc_initHud;
        ["RHD - LifeCore loaded. Use the configured RHD tablet access path.", "info"] call RHD_fnc_notify;
    };
};
