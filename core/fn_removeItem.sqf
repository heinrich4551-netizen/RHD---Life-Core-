params ["_unit", "_item", ["_amount", 1]];
if (isNull _unit || {_amount <= 0}) exitWith {false};
private _inv = _unit getVariable ["RHD_INV", createHashMap];
private _have = _inv getOrDefault [_item, 0];
private _qty = floor _amount;
if (_have < _qty) exitWith {false};
private _left = _have - _qty;
if (_left <= 0) then {_inv deleteAt _item} else {_inv set [_item, _left]};
_unit setVariable ["RHD_INV", _inv, true];
true
