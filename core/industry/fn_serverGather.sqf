params ["_unit", "_marker"];
if (!isServer || {isNull _unit} || {!isPlayer _unit}) exitWith {};
if !(_marker in allMapMarkers) exitWith {};
if (_unit distance2D (getMarkerPos _marker) > 15) exitWith {};
private _m = toLower _marker;
private _item = switch (_m) do {
    case "rhd_farm_apples": {"apple"}; case "rhd_farm_apple": {"apple"}; case "rhd_farm_cannabis": {"cannabis_plant"};
    case "rhd_farm_coca": {"coca_leaf"}; case "rhd_farm_corn": {"corn_cob"}; case "rhd_farm_grapes": {"grapes"}; case "rhd_farm_peaches": {"peaches"};
    case "rhd_mine_iron": {"iron_ore"}; case "rhd_mine_copper": {"copper_ore"}; case "rhd_mine_gold": {"gold_ore"};
    case "rhd_mine_diamond": {"diamond"}; case "rhd_mine_oil": {"oil_sand"}; default {""}
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
