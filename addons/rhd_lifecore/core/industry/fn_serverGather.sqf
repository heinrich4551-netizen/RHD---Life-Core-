/*
    RHD - LifeCore | Server Gatherer
    Author: LT. Toad

    Marker naming is intentionally beginner-friendly:
        rhd_farm_apples_<name>
        rhd_farm_cannabis_<name>
        rhd_farm_coca_<name>
        rhd_farm_corn_<name>
        rhd_farm_grapes_<name>
        rhd_farm_peaches_<name>
        rhd_mine_iron_<name>
        rhd_mine_copper_<name>
        rhd_mine_gold_<name>
        rhd_mine_diamond_<name>
        rhd_mine_oil_<name>

    The old short names without the trailing <name> are also accepted.
*/

params ["_unit", "_marker"];
if (!isServer || {isNull _unit} || {!isPlayer _unit}) exitWith {};
if (owner _unit != remoteExecutedOwner) exitWith {};
if !(missionNamespace getVariable ["RHD_LIFE_ENABLE_INDUSTRY", false]) exitWith {};
if !(_marker in allMapMarkers) exitWith {};
if (_unit distance2D (getMarkerPos _marker) > 15) exitWith {};

private _m = toLower _marker;
private _item = "";

switch (true) do {
    case (_m == "rhd_farm_apples" || {_m find "rhd_farm_apples_" == 0}): {_item = "apple"};
    case (_m == "rhd_farm_apple"  || {_m find "rhd_farm_apple_"  == 0}): {_item = "apple"};
    case (_m == "rhd_farm_cannabis" || {_m find "rhd_farm_cannabis_" == 0}): {_item = "cannabis_plant"};
    case (_m == "rhd_farm_coca" || {_m find "rhd_farm_coca_" == 0}): {_item = "coca_leaf"};
    case (_m == "rhd_farm_corn" || {_m find "rhd_farm_corn_" == 0}): {_item = "corn_cob"};
    case (_m == "rhd_farm_grapes" || {_m find "rhd_farm_grapes_" == 0}): {_item = "grapes"};
    case (_m == "rhd_farm_peaches" || {_m find "rhd_farm_peaches_" == 0}): {_item = "peaches"};
    case (_m == "rhd_mine_iron" || {_m find "rhd_mine_iron_" == 0}): {_item = "iron_ore"};
    case (_m == "rhd_mine_copper" || {_m find "rhd_mine_copper_" == 0}): {_item = "copper_ore"};
    case (_m == "rhd_mine_gold" || {_m find "rhd_mine_gold_" == 0}): {_item = "gold_ore"};
    case (_m == "rhd_mine_diamond" || {_m find "rhd_mine_diamond_" == 0}): {_item = "diamond"};
    case (_m == "rhd_mine_oil" || {_m find "rhd_mine_oil_" == 0}): {_item = "oil_sand"};
};

if (_item isEqualTo "") exitWith {
    ["This 3DEN marker is not a recognized farming or mining resource.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

private _job = _unit getVariable ["RHD_JOB", "civ"];
private _allowed = if ((_m find "rhd_farm_") == 0) then {
    _job in ["farmer", "civ"]
} else {
    _job isEqualTo "miner"
};

if (!_allowed) exitWith {
    ["You do not have the correct job for this location.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

private _last = _unit getVariable ["RHD_LAST_GATHER", 0];
if (serverTime - _last < 3) exitWith {
    ["Slow down. Gathering is on cooldown.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

_unit setVariable ["RHD_LAST_GATHER", serverTime, false];

if !([_unit, _item, 1] call RHD_fnc_addItem) exitWith {};

private _items = missionNamespace getVariable ["RHD_ITEMS", createHashMap];
private _def = _items getOrDefault [_item, []];
private _name = if (_def isEqualTo []) then {_item} else {_def select 0};

[format ["Collected 1 x %1.", _name], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
