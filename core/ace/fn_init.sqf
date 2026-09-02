if (!hasInterface) exitWith {};
if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {};

private _adminAction = [
    "RHD_Admin",
    "RHD Administration",
    "\a3\ui_f\data\IGUI\Cfg\Actions\gear_ca.paa",
    {[] call RHD_fnc_adminOpenMenu},
    {[_player] call RHD_fnc_isAdmin},
    {},
    [],
    [0,0,0],
    2
] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _adminAction] call ace_interact_menu_fnc_addActionToObject;

private _emsAction = [
    "RHD_EmsTreat",
    "RHD EMS: Treat Patient",
    "\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca.paa",
    {[_target] remoteExecCall ["RHD_fnc_heal", 2]},
    {(_player getVariable ["RHD_JOB","civ"]) isEqualTo "medic" && {alive _target} && {[_player,_target,[]] call ace_common_fnc_canInteractWith}},
    {},
    [],
    [0,0,0],
    3
] call ace_interact_menu_fnc_createAction;
[player, 0, ["ACE_TapShoulderRight"], _emsAction] call ace_interact_menu_fnc_addActionToObject;

private _adminVehicleAction = [
    "RHD_AdminVehicle",
    "RHD Vehicle Controls",
    "\a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa",
    {[] call RHD_fnc_adminOpenMenu},
    {[_player] call RHD_fnc_isAdmin && {vehicle _player != _player}},
    {},
    [],
    [0,0,0],
    2
] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _adminVehicleAction] call ace_interact_menu_fnc_addActionToObject;

missionNamespace setVariable ["RHD_ACE_READY", true, false];
true
