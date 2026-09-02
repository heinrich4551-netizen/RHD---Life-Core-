/*
    RHD - LifeCore | Dynamic Shop Catalog
    Author: LT. Toad

    The catalog is generated from the content actually loaded by Arma 3.
    That means base-game and loaded dependency-mod vehicles/equipment appear
    automatically without hard-coding thousands of class names.

    Returned entry format:
        [displayName, className, shopType, price]

    shopType values:
        VEHICLE | WEAPON | MAGAZINE | GLASSES | BACKPACK | ITEM
*/

params [
    ["_page", "VEHICLES", [""]]
];

private _page = toUpper _page;
private _cache = uiNamespace getVariable ["RHD_SHOP_CATALOG_CACHE", createHashMap];

private _cached = _cache getOrDefault [_page, []];
if (_cached isNotEqualTo []) exitWith {_cached};

private _result = [];

// ---------------------------------------------------------------------------
// VEHICLES: base-game + every loaded addon/mod vehicle with public scope.
// ---------------------------------------------------------------------------
if (_page isEqualTo "VEHICLES") then {
    private _classes = configClasses (configFile >> "CfgVehicles");

    {
        private _class = configName _x;
        private _scope = getNumber (_x >> "scope");
        private _name = getText (_x >> "displayName");

        if (
            _scope >= 2 &&
            {_name isNotEqualTo ""} &&
            {
                (_class isKindOf "LandVehicle") ||
                (_class isKindOf "Air") ||
                (_class isKindOf "Ship")
            }
        ) then {
            private _price = [_class, "VEHICLE"] call RHD_fnc_getShopPrice;
            if (_price > 0) then {
                _result pushBack [_name, _class, "VEHICLE", _price];
            };
        };
    } forEach _classes;
};

// ---------------------------------------------------------------------------
// EQUIPMENT: weapons, magazines, goggles and backpacks from the active modset.
// ---------------------------------------------------------------------------
if (_page isEqualTo "EQUIPMENT") then {
    private _weapons = configClasses (configFile >> "CfgWeapons");

    {
        private _class = configName _x;
        private _scope = getNumber (_x >> "scope");
        private _name = getText (_x >> "displayName");

        if (_scope >= 2 && {_name isNotEqualTo ""}) then {
            private _kind = [_class] call BIS_fnc_itemType;
            private _shopType = switch (_kind param [0, ""]) do {
                case "Weapon": {"WEAPON"};
                case "Item": {"ITEM"};
                case "Equipment": {"ITEM"};
                case "Mine": {"MAGAZINE"};
                default {""};
            };

            if (_shopType isNotEqualTo "") then {
                private _price = [_class, _shopType] call RHD_fnc_getShopPrice;
                if (_price > 0) then {
                    _result pushBack [_name, _class, _shopType, _price];
                };
            };
        };
    } forEach _weapons;

    private _magazines = configClasses (configFile >> "CfgMagazines");
    {
        private _class = configName _x;
        private _scope = getNumber (_x >> "scope");
        private _name = getText (_x >> "displayName");

        if (_scope >= 2 && {_name isNotEqualTo ""}) then {
            private _price = [_class, "MAGAZINE"] call RHD_fnc_getShopPrice;
            if (_price > 0) then {
                _result pushBack [_name, _class, "MAGAZINE", _price];
            };
        };
    } forEach _magazines;

    private _glasses = configClasses (configFile >> "CfgGlasses");
    {
        private _class = configName _x;
        private _scope = getNumber (_x >> "scope");
        private _name = getText (_x >> "displayName");

        if (_scope >= 2 && {_name isNotEqualTo ""}) then {
            private _price = [_class, "GLASSES"] call RHD_fnc_getShopPrice;
            if (_price > 0) then {
                _result pushBack [_name, _class, "GLASSES", _price];
            };
        };
    } forEach _glasses;

    private _vehicles = configClasses (configFile >> "CfgVehicles");
    {
        private _class = configName _x;
        private _scope = getNumber (_x >> "scope");
        private _name = getText (_x >> "displayName");

        if (_scope >= 2 && {_name isNotEqualTo ""} && {_class isKindOf "Bag_Base"}) then {
            private _price = [_class, "BACKPACK"] call RHD_fnc_getShopPrice;
            if (_price > 0) then {
                _result pushBack [_name, _class, "BACKPACK", _price];
            };
        };
    } forEach _vehicles;
};

_cache set [_page, _result];
uiNamespace setVariable ["RHD_SHOP_CATALOG_CACHE", _cache];
_result
