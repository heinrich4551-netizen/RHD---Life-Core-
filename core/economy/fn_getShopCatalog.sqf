/*
    RHD - LifeCore | Dynamic Shop Catalog
    Author: LT. Toad

    Generates the shop from the content actually loaded by Arma 3.
    Therefore base-game content and the public content supplied by loaded
    dependency mods are available automatically.

    Returned entry:
        [displayName, className, shopType, price]
*/

params [["_page", "VEHICLES", [""]]];

if !(missionNamespace getVariable ["RHD_SHOP_AUTO_IMPORT", true]) exitWith {[]};

private _page = toUpper _page;
private _cache = uiNamespace getVariable ["RHD_SHOP_CATALOG_CACHE", createHashMap];
private _cached = _cache getOrDefault [_page, []];
if (_cached isNotEqualTo []) exitWith {_cached};

private _result = [];

// ============================================================================
// VEHICLES
// ============================================================================
if (_page isEqualTo "VEHICLES") then {
    {
        private _class = configName _x;
        private _name = getText (_x >> "displayName");

        if (
            getNumber (_x >> "scope") >= 2 &&
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
    } forEach (configClasses (configFile >> "CfgVehicles"));
};

// ============================================================================
// EQUIPMENT
// ============================================================================
if (_page isEqualTo "EQUIPMENT") then {
    // Weapons, uniforms and other CfgWeapons equipment.
    {
        private _class = configName _x;
        private _name = getText (_x >> "displayName");

        if (getNumber (_x >> "scope") >= 2 && {_name isNotEqualTo ""}) then {
            private _kind = [_class] call BIS_fnc_itemType;
            private _kind0 = _kind param [0, ""];
            private _itemSubType = _kind param [1, ""];
            private _shopType = switch (_kind0) do {
                case "Weapon": {"WEAPON"};
                case "Magazine": {"MAGAZINE"};
                case "Mine": {"MAGAZINE"};
                case "Item": {"ITEM"};
                case "Equipment": {
                    if (_itemSubType isEqualTo "Uniform") then {"UNIFORM"} else {"ITEM"}
                };
                default {""};
            };

            if (_shopType isNotEqualTo "") then {
                private _price = [_class, _shopType] call RHD_fnc_getShopPrice;
                if (_price > 0) then {
                    _result pushBack [_name, _class, _shopType, _price];
                };
            };
        };
    } forEach (configClasses (configFile >> "CfgWeapons"));

    // Magazines that are not represented by CfgWeapons.
    {
        private _class = configName _x;
        private _name = getText (_x >> "displayName");
        if (getNumber (_x >> "scope") >= 2 && {_name isNotEqualTo ""}) then {
            private _price = [_class, "MAGAZINE"] call RHD_fnc_getShopPrice;
            if (_price > 0) then {
                _result pushBack [_name, _class, "MAGAZINE", _price];
            };
        };
    } forEach (configClasses (configFile >> "CfgMagazines"));

    // Goggles.
    {
        private _class = configName _x;
        private _name = getText (_x >> "displayName");
        if (getNumber (_x >> "scope") >= 2 && {_name isNotEqualTo ""}) then {
            private _price = [_class, "GLASSES"] call RHD_fnc_getShopPrice;
            if (_price > 0) then {
                _result pushBack [_name, _class, "GLASSES", _price];
            };
        };
    } forEach (configClasses (configFile >> "CfgGlasses"));

    // Backpacks are CfgVehicles but must be delivered with backpack cargo.
    {
        private _class = configName _x;
        private _name = getText (_x >> "displayName");
        if (
            getNumber (_x >> "scope") >= 2 &&
            {_name isNotEqualTo ""} &&
            {_class isKindOf "Bag_Base"}
        ) then {
            private _price = [_class, "BACKPACK"] call RHD_fnc_getShopPrice;
            if (_price > 0) then {
                _result pushBack [_name, _class, "BACKPACK", _price];
            };
        };
    } forEach (configClasses (configFile >> "CfgVehicles"));
};

// Alphabetical sort by display name where nested-array sorting is supported.
_result sort true;

_cache set [_page, _result];
uiNamespace setVariable ["RHD_SHOP_CATALOG_CACHE", _cache];
_result
