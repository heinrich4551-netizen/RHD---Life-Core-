/*
    RHD - LifeCore | ACE3 Integration
    Author: LT. Toad
    ---------------------------------------------------------------------------
    ACE3 provides contextual interaction menus.

    PLAYER:
    ACE Self Actions -> RHD Life Tablet

    ADMIN:
    ACE Self Actions -> RHD Administration

    Admin access is checked by Steam64 UID. No admin item or dedicated admin
    keyboard shortcut is required.
    ---------------------------------------------------------------------------
*/

if (!hasInterface) exitWith {};
if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {};

// ============================================================================
// PLAYER TABLET
// ============================================================================
private _playerTabletAction = [
    "RHD_PlayerTablet",
    "RHD LifeCore Tablet",
    "\\a3\\ui_f\\data\\IGUI\\Cfg\\Actions\\showmap_ca.paa",
    {[] call RHD_fnc_ctabOpen},
    {alive _player},
    {},
    [],
    [0,0,0],
    2
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _playerTabletAction] call ace_interact_menu_fnc_addActionToObject;

// ============================================================================
// ADMINISTRATION
// ============================================================================
private _adminAction = [
    "RHD_Admin",
    "RHD Administration",
    "\\a3\\ui_f\\data\\IGUI\\Cfg\\Actions\\gear_ca.paa",
    {[] call RHD_fnc_adminOpenMenu},
    {[_player] call RHD_fnc_isAdmin},
    {},
    [],
    [0,0,0],
    2
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _adminAction] call ace_interact_menu_fnc_addActionToObject;

// ============================================================================
// EMS / MEDICAL ROLEPLAY
// ============================================================================
private _emsAction = [
    "RHD_EmsTreat",
    "RHD EMS: Treat Patient",
    "\\a3\\ui_f\\data\\IGUI\\Cfg\\Actions\\heal_ca.paa",
    {[_target] remoteExecCall ["RHD_fnc_heal", 2]},
    {
        (_player getVariable ["RHD_JOB", "civ"]) isEqualTo "medic"
        && {alive _target}
        && {[_player, _target, []] call ace_common_fnc_canInteractWith}
    },
    {},
    [],
    [0,0,0],
    3
] call ace_interact_menu_fnc_createAction;

["CAManBase", 0, ["ACE_TapShoulderRight"], _emsAction, true] call ace_interact_menu_fnc_addActionToClass;

missionNamespace setVariable ["RHD_ACE_READY", true, false];
true
