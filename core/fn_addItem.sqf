params ["_unit", "_item", ["_amount", 1]];
if (isNull _unit || {_amount <= 0}) exitWith {false};
private _items = missionNamespace getVariable ["RHD_ITEMS", createHashMap];
private _def = _items getOrDefault [_item, []];
if (_def isEqualTo []) exitWith {false};
private _inv = _unit getVariable ["RHD_INV", createHashMap];
_inv set [_item, (_inv getOrDefault [_item, 0]) + floor _amount];
_unit setVariable ["RHD_INV", _inv, true];
true
