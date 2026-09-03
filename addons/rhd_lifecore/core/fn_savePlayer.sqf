params ["_uid"];
if (!isServer || {_uid isEqualTo ""}) exitWith {false};
private _unit = objNull;
{
    if (getPlayerUID _x isEqualTo _uid) exitWith {_unit = _x};
} forEach allPlayers;
if (isNull _unit) exitWith {false};
private _data = [
    _unit getVariable ["RHD_CASH", 0],
    _unit getVariable ["RHD_BANK", 0],
    _unit getVariable ["RHD_JOB", "civ"],
    _unit getVariable ["RHD_INV", createHashMap],
    _unit getVariable ["RHD_LICENSES", ["driver"]],
    _unit getVariable ["RHD_JAILED", false]
];
profileNamespace setVariable [format ["RHD_SAVE_%1", _uid], _data];
saveProfileNamespace;
true
