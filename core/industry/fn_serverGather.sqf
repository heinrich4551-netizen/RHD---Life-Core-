params ["_unit", "_marker"];
if (!isServer || {isNull _unit} || {!isPlayer _unit}) exitWith {};
if !(_marker in allMapMarkers) exitWith {};
if (_unit distance2D (getMarkerPos _marker) > 15) exitWith {};
private _m = toLower _marker;
private _item = "";
if ((_m find "rhd_farm_") == 0) then {
    private _suffix = _m select [9];
    _item = switch (_suffix) do {
        case "apples": {"apple"}; case "apple": {"apple"}; case "cannabis": {"cannabis_plant"};
        case "coca": {"coca_leaf"}; case "corn": {"corn_cob"}; case "grapes": {"grapes"}; case "peaches": {"peaches"}; default {""}
    };
} else {
    if ((_m find "rhd_mine_") == 0) then {
        private _suffix = _m select [9];
        _item = switch (_suffix) do {
            case "iron": {"iron_ore"}; case "copper": {"copper_ore"}; case "gold": {"gold_ore"};
            case "diamond": {"diamond"}; case "oil": {"oil_sand"}; default {""}
        };
    };
};
if (_item isEqualTo "") exitWith {};
private _job = _unit getVariable ["RHD_JOB", "civ"];
private _allowed = if ((_m find "rhd_farm_") == 0) then {_job isEqualTo "farmer" || _job isEqualTo "civ"} else {_job isEqualTo "miner"};
if (!_allowed) exitWith {["You do not have the correct job for this location.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit]};
private _last = _unit getVariable ["RHD_LAST_GATHER", 0];
if (serverTime - _last < 3) exitWith {["Slow down. Gathering is on cooldown.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit]};
_unit setVariable ["RHD_LAST_GATHER", serverTime, false];
[_unit, _item, 1] call RHD_fnc_addItem;
private _name = ((missionNamespace getVariable ["RHD_ITEMS", createHashMap]) get _item) select 0;
[format ["Collected 1 x %1.", _name], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
