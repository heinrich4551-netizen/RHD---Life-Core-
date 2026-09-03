/* RHD - LifeCore | Deposit | Server */
params ["_unit", ["_amount", 100]];
if (!isServer || {isNull _unit} || {!isPlayer _unit}) exitWith {};
if (owner _unit != remoteExecutedOwner) exitWith {};
if !(missionNamespace getVariable ["RHD_LIFE_ENABLE_ECONOMY", false]) exitWith {};
if (_amount < 1 || {_amount > 10000}) exitWith {};

private _bankNear = allMapMarkers findIf {
    (_x find "rhd_bank_") isEqualTo 0 && {_unit distance2D (getMarkerPos _x) <= 18}
};
if (_bankNear < 0) exitWith {
    ["You are not at an RHD bank.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

private _qty = floor _amount;
private _cash = _unit getVariable ["RHD_CASH", 0];
if (_cash < _qty) exitWith {
    ["Insufficient cash.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

_unit setVariable ["RHD_CASH", _cash - _qty, true];
_unit setVariable ["RHD_BANK", (_unit getVariable ["RHD_BANK", 0]) + _qty, true];
[format ["Deposited $%1.", _qty], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
