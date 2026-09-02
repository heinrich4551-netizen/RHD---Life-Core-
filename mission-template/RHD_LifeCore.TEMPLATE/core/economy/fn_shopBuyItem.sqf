/*
    RHD - LifeCore | EQUIPMENT SHOP PURCHASE
    Author: LT. Toad

    Server-side validation for base-game and loaded-mod equipment.
    Purchased content is placed in a server-created ground holder so the
    transaction does not depend on a client-callable "give item" function.
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

// Prepare the delivery before charging the player.
private _holderPos = _unit modelToWorld [0, 1.2, 0.1];
private _holder = createVehicle ["GroundWeaponHolder_Simple", _holderPos, [], 0, "CAN_COLLIDE"];
if (isNull _holder) exitWith {
    ["The shop could not prepare the purchase. No money was taken.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

switch (_typeUpper) do {
    case "WEAPON": {_holder addWeaponCargoGlobal [_class, 1];};
    case "MAGAZINE": {_holder addMagazineCargoGlobal [_class, 1];};
    case "BACKPACK": {_holder addBackpackCargoGlobal [_class, 1];};
    default {_holder addItemCargoGlobal [_class, 1];};
};

_unit setVariable ["RHD_CASH", _cash - _price, true];
_holder setVariable ["RHD_SHOP_OWNER_UID", getPlayerUID _unit, true];
_holder setVariable ["RHD_SHOP_PRICE", _price, true];
_holder setVariable ["RHD_SHOP_PURCHASE", true, true];

[format ["Purchased %1 for $%2. Your purchase is at your feet.", getText (_cfg >> "displayName"), _price], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
