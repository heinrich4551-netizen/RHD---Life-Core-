params ["_unit", "_item"];
private _inv = _unit getVariable ["RHD_INV", createHashMap];
_inv getOrDefault [_item, 0]
