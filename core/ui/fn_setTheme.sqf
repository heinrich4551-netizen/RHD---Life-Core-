params [["_theme",0]];
_theme = floor _theme max 0 min 2;
profileNamespace setVariable ["RHD_UI_THEME", _theme];
saveProfileNamespace;
private _name = switch (_theme) do {
    case 1: {"TABLET SLATE"};
    case 2: {"MINIMAL OPS"};
    default {"CLASSIC LIFE"};
};
[format ["RHD UI theme changed to %1.", _name], "success"] call RHD_fnc_notify;

if (!isNull findDisplay 7600) then {[] call RHD_fnc_openMenu;};
if (!isNull findDisplay 7700) then {[] call RHD_fnc_refresh;};
if (!isNull findDisplay 7805) then {[] call RHD_fnc_shopOpen;};
true
