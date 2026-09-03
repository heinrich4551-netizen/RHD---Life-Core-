/*
    RHD - LifeCore | Dynamic Location Synchronizer
    Author: LT. Toad

    Keeps the RHD location layer synchronized with the live Antistasi Ultimate
    campaign after initial world generation. The synchronizer never replaces
    A3A's strategic locations; it mirrors the live A3A controlled-location set
    into RHD-prefixed district markers and refreshes the public location registry.
*/

if (!isServer) exitWith {false};

private _interval = missionNamespace getVariable ["RHD_DYNAMIC_LOCATION_REFRESH_SECONDS", 60];
if (_interval < 15) then {_interval = 15};

private _readLocations = {
    private _registry = createHashMap;
    private _prefixes = [
        ["shops", "rhd_shop_"],
        ["banks", "rhd_bank_"],
        ["fuel", "rhd_fuel_"],
        ["farms", "rhd_farm_"],
        ["mines", "rhd_mine_"],
        ["refineries", "rhd_refine_"],
        ["police", "rhd_police_"],
        ["ems", "rhd_ems_"],
        ["jails", "rhd_jail_"],
        ["zones", "rhd_zone_"]
    ];

    {
        private _key = _x select 0;
        private _prefix = _x select 1;
        private _names = allMapMarkers select {
            private _n = toLower _x;
            (_n find _prefix) == 0
        };
        _registry set [_key, _names];
    } forEach _prefixes;

    _registry
};

private _syncA3AZones = {
    private _a3aReady = missionNamespace getVariable ["RHD_A3A_BASE_READY", false];
    if (!_a3aReady) exitWith {false};

    private _controlled = [];

    // A3A's authoritative strategic location objects are represented by
    // controlsX. Only mirror valid marker names that currently exist.
    if (!isNil "controlsX") then {
        {
            if (_x isEqualType "" && {_x in allMapMarkers}) then {
                _controlled pushBackUnique _x;
            };
        } forEach controlsX;
    };

    missionNamespace setVariable ["RHD_A3A_ZONE_MARKERS", _controlled, true];

    // Rebuild only the RHD A3A mirror markers. Never delete native A3A markers.
    {
        if ((toLower _x) find "rhd_zone_a3a_" == 0) then {
            deleteMarker _x;
        };
    } forEach (+allMapMarkers);

    private _index = 0;
    {
        private _pos = getMarkerPos _x;
        private _name = format ["rhd_zone_a3a_%1", _index];
        private _m = createMarker [_name, _pos];
        _m setMarkerShape "ELLIPSE";
        _m setMarkerSize [250, 250];
        _m setMarkerAlpha 0.18;
        _m setMarkerText (format ["Antistasi District %1", _index + 1]);
        _index = _index + 1;
    } forEach _controlled;

    missionNamespace setVariable ["RHD_A3A_DYNAMIC_ZONE_COUNT", count _controlled, true];
    true
};

while {isServer && {missionNamespace getVariable ["RHD_DYNAMIC_LOCATIONS_ENABLE", true]}} do {
    [] call _syncA3AZones;

    private _registry = [] call _readLocations;
    missionNamespace setVariable ["RHD_LOCATION_REGISTRY", _registry, true];
    missionNamespace setVariable ["RHD_DYNAMIC_LOCATION_COUNT", {
        private _total = 0;
        {
            _total = _total + count (_registry getOrDefault [_x, []]);
        } forEach ["shops","banks","fuel","farms","mines","refineries","police","ems","jails","zones"];
        _total
    }, false] call BIS_fnc_call;

    publicVariable "RHD_LOCATION_REGISTRY";
    publicVariable "RHD_DYNAMIC_LOCATION_COUNT";

    sleep _interval;
};

true
