[] call RHD_fnc_initPlayer;

waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call RHD_fnc_keyHandler"];

[] call RHD_fnc_aceInit;

[] spawn {
    waitUntil {!isNull player};
    sleep 1;
    [] call RHD_fnc_initHud;
    sleep 1;
    ["RHD Life loaded. Player interface is on cTab; admins use the ACE RHD Administration control.", "info"] call RHD_fnc_notify;
};
