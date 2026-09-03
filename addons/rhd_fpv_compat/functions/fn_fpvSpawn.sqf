/*
    Server-side FPV purchase/spawn helper for RHD F6/F7/F8 integrations.

    Usage from a menu:
        [player, "BOT_vehicle_B_FPV_AT_HD"] remoteExecCall ["RHD_fnc_fpvSpawn", 2];

    This function deliberately routes through RHD_fnc_antistasiSpawnVehicle,
    so Antistasi Ultimate gets its safe vehicle spawn path instead of a second
    competing spawn implementation.
*/

params [
    ["_unit", objNull, [objNull]],
    ["_class", "", [""]]
];

if (!isServer || {isNull _unit} || {!isPlayer _unit}) exitWith {};
if (_class isEqualTo "") exitWith {};

private _allowed = missionNamespace getVariable ["RHD_FPV_CLASSES", []];
if !(_class in _allowed) exitWith {
    ["That FPV configuration is not available.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

if !(missionNamespace getVariable ["RHD_LIFE_ENABLE_ECONOMY", true]) exitWith {
    ["The RHD economy is disabled.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

private _price = [_class, "VEHICLE"] call RHD_fnc_getShopPrice;
private _cash = _unit getVariable ["RHD_CASH", 0];
if (_cash < _price) exitWith {
    [format ["You need $%1 to deploy this FPV.", _price], "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

private _pos = getPosATL _unit;
private _vehicle = [_class, _pos, 15, 10] call RHD_fnc_antistasiSpawnVehicle;
if (isNull _vehicle) exitWith {
    ["No safe FPV deployment point was found.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];
};

_unit setVariable ["RHD_CASH", _cash - _price, true];
_vehicle setDir (getDir _unit);
_vehicle setFuel 1;
_vehicle setVariable ["RHD_OWNER_UID", getPlayerUID _unit, true];
_vehicle setVariable ["RHD_PURCHASE_PRICE", _price, true];
_vehicle setVariable ["RHD_FPV_RHD_PURCHASE", true, true];
_vehicle setVariable ["RHD_FPV_PROVIDER", "BOT_FPV_Enhanced", true];

[format ["Deployed %1 for $%2.", getText (configFile >> "CfgVehicles" >> _class >> "displayName"), _price], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
_vehicle
