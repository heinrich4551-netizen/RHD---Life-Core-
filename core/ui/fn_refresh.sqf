disableSerialization;
private _d = findDisplay 7700;
if (isNull _d) exitWith {};
private _theme = profileNamespace getVariable ["RHD_UI_THEME", 0];
private _bg = switch (_theme) do {
    case 1: {[0.09,0.09,0.11,0.97]};
    case 2: {[0.02,0.05,0.03,0.96]};
    default {[0,0,0,0.84]};
};
private _accent = switch (_theme) do {
    case 1: {[0.35,0.65,0.95,1]};
    case 2: {[0.38,0.85,0.48,1]};
    default {[0.18,0.72,0.92,1]};
};
(_d displayCtrl 7701) ctrlSetBackgroundColor _bg;
(_d displayCtrl 7702) ctrlSetTextColor [0.93,0.95,0.97,1];
{(_d displayCtrl _x) ctrlSetBackgroundColor _accent; (_d displayCtrl _x) ctrlSetTextColor [1,1,1,1];} forEach [7704,7705];

private _lb = _d displayCtrl 7703;
lbClear _lb;
private _jobs = missionNamespace getVariable ["RHD_JOBS", createHashMap];
private _keys = keys _jobs;
_keys sort true;
{
    private _def = _jobs get _x;
    private _idx = _lb lbAdd format ["%1   |   Base Pay $%2 / min", _def select 0, _def select 1];
    _lb lbSetData [_idx, _x];
} forEach _keys;
true
