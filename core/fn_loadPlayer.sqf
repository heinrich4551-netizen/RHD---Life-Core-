params ["_uid"];
if (!isServer || {_uid isEqualTo ""}) exitWith {false};
private _unit = objNull;
{
    if (getPlayerUID _x isEqualTo _uid) exitWith {_unit = _x};
} forEach allPlayers;
if (isNull _unit) exitWith {false};
private _data = profileNamespace getVariable [format ["RHD_SAVE_%1", _uid], []];
if (_data isEqualTo []) exitWith {true};
if (count _data >= 6) then {
    _unit setVariable ["RHD_CASH", _data select 0, true];
    _unit setVariable ["RHD_BANK", _data select 1, true];
    _unit setVariable ["RHD_JOB", _data select 2, true];
    _unit setVariable ["RHD_INV", _data select 3, true];
    _unit setVariable ["RHD_LICENSES", _data select 4, true];
    _unit setVariable ["RHD_JAILED", _data select 5, true];
};
true
