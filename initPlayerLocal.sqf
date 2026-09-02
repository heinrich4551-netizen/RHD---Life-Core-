/*
    RHD - LifeCore | PLAYER CLIENT BOOTSTRAP
    Author: LT. Toad

    RHD-only client features are enabled by the 3DEN Life RP Systems module.
*/

waitUntil {
    sleep 0.25;
    missionNamespace getVariable ["RHD_LIFE_MODULE_READY", false]
};

// RHD player identity/inventory only starts when the Life module exists.
[] call RHD_fnc_initPlayer;

waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call RHD_fnc_keyHandler"];

// ACE setup is always called so the separate admin surface still works even
// when the server owner disables the player tablet in 3DEN.
[] call RHD_fnc_aceInit;

[] spawn {
    waitUntil {!isNull player};

    if (missionNamespace getVariable ["RHD_LIFE_ENABLE_TABLET", true]) then {
        sleep 1;
        [] call RHD_fnc_initHud;
        ["RHD - LifeCore loaded. Use ACE Self Actions -> RHD LifeCore Tablet.", "info"] call RHD_fnc_notify;
    };
};
