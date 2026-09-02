params ["_unit", ["_amount", 100]];
if (!isServer || {isNull _unit} || {!isPlayer _unit}) exitWith {};
if (owner _unit != remoteExecutedOwner) exitWith {};
if (_amount < 1 || {_amount > 10000}) exitWith {};
private _cash = _unit getVariable ["RHD_CASH", 0];
if (_cash < _amount) exitWith {["Insufficient cash.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit]};
_unit setVariable ["RHD_CASH", _cash - floor _amount, true];
_unit setVariable ["RHD_BANK", (_unit getVariable ["RHD_BANK", 0]) + floor _amount, true];
[format ["Deposited $%1.", floor _amount], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
