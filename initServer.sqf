[] call RHD_fnc_init;

addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner"];
    if (_uid isEqualTo "") exitWith {};
    [_uid] call RHD_fnc_loadPlayer;
}];

addMissionEventHandler ["PlayerDisconnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner"];
    if (_uid isEqualTo "") exitWith {};
    [_uid] call RHD_fnc_savePlayer;
}];
