params [["_theme",0]];
_theme = (floor _theme) max 0 min 2;
profileNamespace setVariable ["RHD_UI_THEME", _theme];
saveProfileNamespace;
private _name = switch (_theme) do {
    case 1: {"TABLET SLATE"};
    case 2: {"MINIMAL OPS"};
    default {"CLASSIC LIFE"};
};

private _wasF6 = !isNull findDisplay 7600;
if (_wasF6) then {
    closeDialog 0;
    sleep 0.05;
    [] call RHD_fnc_openMenu;
};
[format ["RHD UI theme: %1", _name], "success"] call RHD_fnc_notify;
true
