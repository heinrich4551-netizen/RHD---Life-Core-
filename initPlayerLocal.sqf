/*
    RHD - LifeCore | PLAYER CLIENT BOOTSTRAP
    Author: LT. Toad

    RHD-only client features are enabled by the 3DEN Life RP Systems module.
    This keeps player UI, ACE interactions and HUD setup in the editor instead
    of hidden mission startup code.
*/

waitUntil {
    sleep 0.25;
    missionNamespace getVariable ["RHD_LIFE_MODULE_READY", false]
};

// Core player identity / inventory state is part of the RHD Life layer.
[] call RHD_fnc_initPlayer;

waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call RHD_fnc_keyHandler"];

if (missionNamespace getVariable ["RHD_LIFE_ENABLE_TABLET", true]) then {
    [] call RHD_fnc_aceInit;
};

if (missionNamespace getVariable ["RHD_LIFE_ENABLE_ECONOMY", true]) then {
    // The cTab shop catalogue is generated from the active Arma modset on use.
    true
};

[] spawn {
    waitUntil {!isNull player};

    if (missionNamespace getVariable ["RHD_LIFE_ENABLE_TABLET", true]) then {
        sleep 1;
        [] call RHD_fnc_initHud;
        ["RHD - LifeCore loaded. Use ACE Self Actions -> RHD LifeCore Tablet.", "info"] call RHD_fnc_notify;
    };
};
