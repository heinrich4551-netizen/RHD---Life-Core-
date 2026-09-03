/*
    RHD - LifeCore | Dynamic Shop Price
    Author: LT. Toad

    Calculates a deterministic price for base-game and loaded-mod content.
    Server re-calculates the price before every purchase, so the client can
    never choose its own price.

    Optional manual overrides are configured in core/fn_init.sqf:
        RHD_SHOP_PRICE_OVERRIDES
*/

params [
    ["_class", "", [""]],
    ["_type", "ITEM", [""]]
];

if (_class isEqualTo "") exitWith {0};

private _overrides = missionNamespace getVariable [
    "RHD_SHOP_PRICE_OVERRIDES",
    createHashMap
];

private _override = _overrides getOrDefault [_class, -1];
if (_override isEqualType 0 && {_override >= 0}) exitWith {round _override};

private _config = switch (toUpper _type) do {
    case "VEHICLE": {configFile >> "CfgVehicles" >> _class};
    case "BACKPACK": {configFile >> "CfgVehicles" >> _class};
    case "MAGAZINE": {configFile >> "CfgMagazines" >> _class};
    case "GLASSES": {configFile >> "CfgGlasses" >> _class};
    default {configFile >> "CfgWeapons" >> _class};
};

if !(isClass _config) exitWith {0};
if (getNumber (_config >> "scope") < 2) exitWith {0};

private _mass = getNumber (_config >> "mass");
private _cost = getNumber (_config >> "cost");

private _price = switch (toUpper _type) do {
    case "VEHICLE": {
        // Vehicle prices are deliberately readable and easy to tune.
        private _raw = 2500 + (_cost max 100) * 20 + (_mass max 0) * 8;
        _raw max 2500
    };
    default {
        private _raw = 100 + (_cost max 0) * 4 + (_mass max 0) * 3;
        _raw max 100
    };
};

private _multiplier = if ((toUpper _type) isEqualTo "VEHICLE") then {
    missionNamespace getVariable ["RHD_SHOP_VEHICLE_PRICE_MULTIPLIER", 1]
} else {
    missionNamespace getVariable ["RHD_SHOP_ITEM_PRICE_MULTIPLIER", 1]
};

private _maxPrice = if ((toUpper _type) isEqualTo "VEHICLE") then {
    missionNamespace getVariable ["RHD_SHOP_MAX_VEHICLE_PRICE", 2500000]
} else {
    missionNamespace getVariable ["RHD_SHOP_MAX_ITEM_PRICE", 100000]
};

(round (_price * (_multiplier max 0.01))) min _maxPrice
