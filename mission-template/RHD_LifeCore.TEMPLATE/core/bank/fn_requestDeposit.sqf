if (!hasInterface) exitWith {};
private _markers = allMapMarkers select {(_x find "rhd_bank_") isEqualTo 0};
private _near = 99999;
{
    private _d = player distance2D (getMarkerPos _x);
    if (_d < _near) then {_near = _d;};
} forEach _markers;
if (_markers isEqualTo [] || {_near > 15}) exitWith {["You must be at a marked RHD bank.", "error"] call RHD_fnc_notify;};
[player, 100] remoteExecCall ["RHD_fnc_deposit", 2];
