disableSerialization;
if (isNull player) exitWith {};
private _markers = allMapMarkers select {(_x find "rhd_shop_") isEqualTo 0};
private _near = 99999;
{
    private _d = player distance2D (getMarkerPos _x);
    if (_d < _near) then {_near = _d;};
} forEach _markers;
if (_markers isEqualTo [] || {_near > 15}) exitWith {
    ["You must be at a marked RHD shop.", "error"] call RHD_fnc_notify;
};
createDialog "RHD_F8";
private _lb = (findDisplay 7805) displayCtrl 7808;
lbClear _lb;
private _items = missionNamespace getVariable ["RHD_ITEMS", createHashMap];
private _keys = keys _items;
_keys sort true;
{
    private _def = _items get _x;
    private _name = _def select 0;
    private _buy = _def select 1;
    private _sell = _def select 2;
    private _idx = _lb lbAdd format ["%1 | Buy $%2 | Sell $%3", _name, _buy, _sell];
    _lb lbSetData [_idx, _x];
} forEach _keys;
true
