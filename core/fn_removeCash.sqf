params ["_unit", "_amount"];
if (!isServer || {isNull _unit} || {_amount <= 0}) exitWith {false};
private _cash = _unit getVariable ["RHD_CASH", 0];
if (_cash < _amount) exitWith {false};
_unit setVariable ["RHD_CASH", _cash - floor _amount, true];
true
