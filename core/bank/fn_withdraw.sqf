params ["_unit", ["_amount", 100]];
if (!isServer || {isNull _unit} || {!isPlayer _unit}) exitWith {};
if (_amount < 1 || {_amount > 10000}) exitWith {};
private _bank = _unit getVariable ["RHD_BANK", 0];
if (_bank < _amount) exitWith {["Insufficient bank balance.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit]};
_unit setVariable ["RHD_BANK", _bank - floor _amount, true];
_unit setVariable ["RHD_CASH", (_unit getVariable ["RHD_CASH", 0]) + floor _amount, true];
[format ["Withdrew $%1.", floor _amount], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
