disableSerialization;
if (!([player] call RHD_fnc_isAdmin)) exitWith { ["RHD Admin: access denied.", "error"] call RHD_fnc_notify; };
if (!createDialog "RHD_ADMIN") exitWith {};
private _d = findDisplay 8500;
private _players = _d displayCtrl 8504;
private _actions = _d displayCtrl 8506;
private _vars = _d displayCtrl 8512;
lbClear _players;
lbClear _actions;
lbClear _vars;

{
    private _idx = _players lbAdd format ["%1 | %2", name _x, getPlayerUID _x];
    _players lbSetData [_idx, netId _x];
} forEach (allPlayers select {alive _x});

private _actionData = [
    ["info", "Player Information"],
    ["heal", "Heal / Full Restore"],
    ["kill", "Kill Player"],
    ["freeze", "Freeze / Unfreeze"],
    ["spectate", "Spectate Player"],
    ["tpTo", "Teleport To Player"],
    ["tpHere", "Teleport Player Here"],
    ["setCash", "Set Cash"],
    ["setBank", "Set Bank"],
    ["giveItem", "Give Item"],
    ["setJob", "Set Job"],
    ["repair", "Repair Vehicle"],
    ["refuel", "Refuel Vehicle"],
    ["spawnVehicle", "Spawn Vehicle"],
    ["deleteVehicle", "Delete Target Vehicle"],
    ["setTime", "Set World Time"],
    ["setWeather", "Set Weather"],
    ["announce", "Server Announcement"]
];
{
    private _idx = _actions lbAdd (_x select 1);
    _actions lbSetData [_idx, _x select 0];
} forEach _actionData;

private _items = missionNamespace getVariable ["RHD_ITEMS", createHashMap];
private _keys = keys _items; _keys sort true;
{ private _idx = _vars lbAdd format ["ITEM: %1", ((_items get _x) select 0)]; _vars lbSetData [_idx, _x]; } forEach _keys;
private _jobs = missionNamespace getVariable ["RHD_JOBS", createHashMap];
private _jobKeys = keys _jobs; _jobKeys sort true;
{ private _idx = _vars lbAdd format ["JOB: %1", ((_jobs get _x) select 0)]; _vars lbSetData [_idx, _x]; } forEach _jobKeys;

(_d displayCtrl 8510) ctrlSetText "1";
(_d displayCtrl 8515) ctrlSetText format ["RHD ADMIN | %1", name player];
true
