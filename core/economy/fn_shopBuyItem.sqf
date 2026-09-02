/*
    RHD - LifeCore | EQUIPMENT SHOP PURCHASE
    Server-side validation for base-game and loaded-mod equipment.
*/

params [
    ["_unit", objNull, [objNull]],
    ["_class", "", [""]],
    ["_type", "ITEM", [""]]
];

if (!isServer || {isNull _unit} || {!isPlayer _unit}) exitWith {};
if (owner _unit != remoteExecutedOwner) exitWith {};
if (_class isEqualTo "") exitWith {};
if !(missionNamespace getVariable ["RHD_LIFE_ENABLE_ECONOMY", true]) exitWith {};

private _shopMarkers = allMapMarkers select {(_x find "rhd_shop_") isEqualTo 0};
if !(_shopMarkers findIf {_unit distance2D (getMarkerPos _x) <= 15} >= 0) exitWith {
    ["You must be at an RHD shop.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

private _typeUpper = toUpper _type;
private _cfg = switch (_typeUpper) do {
    case "MAGAZINE": {configFile >> "CfgMagazines" >> _class};
    case "GLASSES": {configFile >> "CfgGlasses" >> _class};
    case "BACKPACK": {configFile >> "CfgVehicles" >> _class};
    default {configFile >> "CfgWeapons" >> _class};
};

if !(isClass _cfg) exitWith {
    ["That item is not available in the loaded game/mod set.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};
if (getNumber (_cfg >> "scope") < 2) exitWith {
    ["That item is not public.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

if (_typeUpper isEqualTo "BACKPACK" && {!(_class isKindOf "Bag_Base")}) exitWith {};

private _price = [_class, _typeUpper] call RHD_fnc_getShopPrice;
if (_price <= 0) exitWith {};

private _cash = _unit getVariable ["RHD_CASH", 0];
if (_cash < _price) exitWith {
    [format ["You need $%1. Your cash is $%2.", _price, _cash], "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

// Charge only after the class and shop position are fully validated.
_unit setVariable ["RHD_CASH", _cash - _price, true];

[_class, _typeUpper] remoteExecCall ["RHD_fnc_shopDeliverItem", owner _unit];

[format ["Purchased %1 for $%2.", getText (_cfg >> "displayName"), _price], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
