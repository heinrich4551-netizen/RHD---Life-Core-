disableSerialization;
private _d = findDisplay 7700;
if (isNull _d) exitWith {};
private _lb = _d displayCtrl 7703;
lbClear _lb;
private _jobs = missionNamespace getVariable ["RHD_JOBS", createHashMap];
private _keys = keys _jobs;
_keys sort true;
{
    private _def = _jobs get _x;
    private _idx = _lb lbAdd format ["%1 | Base Pay $%2", _def select 0, _def select 1];
    _lb lbSetData [_idx, _x];
} forEach _keys;
true
