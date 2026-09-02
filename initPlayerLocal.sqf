[] call RHD_fnc_initPlayer;

waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call RHD_fnc_keyHandler"];

player addAction ["Open RHD Player Menu", {[] call RHD_fnc_openMenu}, nil, 1.5, false, false, "", "true", 5, false, ""];

[] spawn {
    waitUntil {!isNull player};
    sleep 2;
    ["Welcome to RHD Life. F6 Player | F7 Jobs | F8 Shop", "info"] call RHD_fnc_notify;
};
