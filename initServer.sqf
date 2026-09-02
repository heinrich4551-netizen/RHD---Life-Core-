/* RHD server bootstrap */

[] spawn RHD_fnc_director;
[] spawn RHD_fnc_events;

addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner"];
    if (_uid isEqualTo "") exitWith {};
    [_uid] spawn {params ["_uid"]; sleep 2; [_uid] call RHD_fnc_loadPlayer;};
}];

addMissionEventHandler ["PlayerDisconnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner"];
    if (_uid isEqualTo "") exitWith {};
    [_uid] call RHD_fnc_savePlayer;
}];

[] spawn {
    while {isServer} do {
        sleep 180;
        {private _uid = getPlayerUID _x; if (_uid != "") then {[_uid] call RHD_fnc_savePlayer};} forEach allPlayers;
    };
};
