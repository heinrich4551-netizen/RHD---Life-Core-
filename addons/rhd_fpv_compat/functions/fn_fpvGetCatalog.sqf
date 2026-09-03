/*
    Returns the FPV Crocus Enhanced classes that are actually loaded.
    Entry format matches RHD shop catalog entries:
        [displayName, className, shopType, price]
*/

params [["_type", "VEHICLES", [""]]];

private _classes = missionNamespace getVariable ["RHD_FPV_CLASSES", []];
private _mags = missionNamespace getVariable ["RHD_FPV_MAGAZINES", []];
private _result = [];

if ((toUpper _type) isEqualTo "EQUIPMENT") then {
    {
        private _cfg = configFile >> "CfgMagazines" >> _x;
        if (isClass _cfg) then {
            private _name = getText (_cfg >> "displayName");
            private _price = [_x, "MAGAZINE"] call RHD_fnc_getShopPrice;
            if (_name isNotEqualTo "" && {_price > 0}) then {
                _result pushBack [_name, _x, "MAGAZINE", _price];
            };
        };
    } forEach _mags;
} else {
    {
        private _cfg = configFile >> "CfgVehicles" >> _x;
        if (isClass _cfg) then {
            private _name = getText (_cfg >> "displayName");
            private _price = [_x, "VEHICLE"] call RHD_fnc_getShopPrice;
            if (_name isNotEqualTo "" && {_price > 0}) then {
                _result pushBack [_name, _x, "VEHICLE", _price];
            };
        };
    } forEach _classes;
};

_result sort true;
_result
