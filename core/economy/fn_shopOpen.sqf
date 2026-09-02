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
private _d = findDisplay 7805;
private _theme = profileNamespace getVariable ["RHD_UI_THEME", 0];
private _bg = switch (_theme) do {
    case 1: {[0.09,0.09,0.11,0.97]};
    case 2: {[0.02,0.05,0.03,0.96]};
    default {[0,0,0,0.86]};
};
private _accent = switch (_theme) do {
    case 1: {[0.35,0.65,0.95,1]};
    case 2: {[0.38,0.85,0.48,1]};
    default {[0.18,0.72,0.92,1]};
};
(_d displayCtrl 7806) ctrlSetBackgroundColor _bg;
(_d displayCtrl 7807) ctrlSetTextColor [0.93,0.95,0.97,1];
{(_d displayCtrl _x) ctrlSetBackgroundColor _accent; (_d displayCtrl _x) ctrlSetTextColor [1,1,1,1];} forEach [7809,7810,7811];
private _lb = _d displayCtrl 7808;
lbClear _lb;
private _items = missionNamespace getVariable ["RHD_ITEMS", createHashMap];
private _keys = keys _items;
_keys sort true;
{
    private _def = _items get _x;
    private _name = _def select 0;
    private _buy = _def select 1;
    private _sell = _def select 2;
    private _idx = _lb lbAdd format ["%1    |    BUY $%2    |    SELL $%3", _name, _buy, _sell];
    _lb lbSetData [_idx, _x];
} forEach _keys;
true
