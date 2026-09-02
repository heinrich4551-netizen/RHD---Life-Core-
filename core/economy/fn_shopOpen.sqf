/*
    RHD - LifeCore | Legacy Shop Entry
    Author: LT. Toad

    Older map actions can still call this function. It now routes into the
    single cTab player market instead of opening a separate shop dialog.
*/

disableSerialization;
if (isNull player) exitWith {false};

private _markers = allMapMarkers select {(_x find "rhd_shop_") isEqualTo 0};
private _near = _markers findIf {player distance2D (getMarkerPos _x) <= 15};

if (_near < 0) exitWith {
    ["You must be at a marked RHD shop.", "error"] call RHD_fnc_notify;
    false
};

[] call RHD_fnc_ctabOpen;
["MARKET"] call RHD_fnc_ctabPage;
true
