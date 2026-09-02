player setVariable ["RHD_UID", getPlayerUID player, false];
player setVariable ["RHD_CASH", 500, false];
player setVariable ["RHD_BANK", 2500, false];
player setVariable ["RHD_JOB", "civ", false];
player setVariable ["RHD_INV", createHashMap, false];
player setVariable ["RHD_LICENSES", ["driver"], false];
player setVariable ["RHD_JAILED", false, false];
player setVariable ["RHD_WORKING", false, false];

player addEventHandler ["Killed", {
    params ["_unit"];
    [_unit] spawn {
        params ["_dead"];
        sleep 1;
        if (!isNull player) then {player setVariable ["RHD_WORKING", false, false];};
    };
}];

{
    private _marker = _x;
    private _items = missionNamespace getVariable ["RHD_GATHER", createHashMap];
    private _key = toLower (_marker select [10]);
} forEach allMapMarkers select {toLower _x find "rhd_farm_" == 0 || toLower _x find "rhd_mine_" == 0};

{
    _x addAction ["Open RHD Shop", {[] call RHD_fnc_shopOpen}, nil, 1.5, true, true, "", "alive _target && _this distance _target < 4"];
} forEach (allMissionObjects "Land_InfoStand_V1_F" + allMissionObjects "Land_InfoStand_V2_F");
