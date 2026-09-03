/*
    RHD - LifeCore | VEHICLE SHOP PURCHASE
    Server-side only. The server validates the shop distance, vehicle class and
    price, then uses the Antistasi collision-safe spawn bridge.
*/

params [
    ["_unit", objNull, [objNull]],
    ["_class", "", [""]]
];

if (!isServer || {isNull _unit} || {!isPlayer _unit}) exitWith {};
if (owner _unit != remoteExecutedOwner) exitWith {};
if (_class isEqualTo "") exitWith {};

if !(missionNamespace getVariable ["RHD_LIFE_ENABLE_ECONOMY", true]) exitWith {};
if !(missionNamespace getVariable ["RHD_A3A_BASE_READY", false]) exitWith {
    ["The Antistasi campaign is still starting. Vehicle shops are not ready yet.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

private _shopMarkers = allMapMarkers select {(_x find "rhd_shop_") isEqualTo 0};
private _nearShop = _shopMarkers select { _unit distance2D (getMarkerPos _x) <= 15 };
if (_nearShop isEqualTo []) exitWith {
    ["You must be at an RHD vehicle shop.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

private _cfg = configFile >> "CfgVehicles" >> _class;
if !(isClass _cfg) exitWith { ["That vehicle is not available.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit]; };
if (getNumber (_cfg >> "scope") < 2) exitWith { ["That vehicle is not public.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit]; };

private _isVehicle = (_class isKindOf "LandVehicle") || (_class isKindOf "Air") || (_class isKindOf "Ship");
if (!_isVehicle) exitWith { ["That class cannot be sold as a vehicle.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit]; };

private _price = [_class, "VEHICLE"] call RHD_fnc_getShopPrice;
if (_price <= 0) exitWith {};

private _cash = _unit getVariable ["RHD_CASH", 0];
if (_cash < _price) exitWith {
    [format ["You need $%1. Your cash is $%2.", _price, _cash], "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

private _spawnPos = getMarkerPos (_nearShop select 0);
private _vehicle = [_class, _spawnPos, 12, 10] call RHD_fnc_antistasiSpawnVehicle;
if (isNull _vehicle) exitWith {
    ["No safe vehicle spawn point was found at this shop. Move vehicles away and try again.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

_unit setVariable ["RHD_CASH", _cash - _price, true];
_vehicle setDir (getDir _unit);
_vehicle setFuel 1;
_vehicle setVariable ["RHD_OWNER_UID", getPlayerUID _unit, true];
_vehicle setVariable ["RHD_PURCHASE_PRICE", _price, true];
_vehicle setVariable ["RHD_SHOP_PURCHASE", true, true];

[format ["Purchased %1 for $%2.", getText (_cfg >> "displayName"), _price], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
