/*
    RHD - LifeCore | Dynamic Location Resolver
    Author: LT. Toad

    Builds the RHD service / economy / industry marker layer from the ACTIVE
    terrain and Antistasi Ultimate state. No Altis coordinates are embedded.

    Resolution order:
      1. Antistasi Ultimate mapInfo / controlsX data when available.
      2. Arma terrain city/facility/object discovery.
      3. Generic terrain scoring fallback (selectBestPlaces).

    The generated markers use the existing RHD naming contract so the existing
    economy, industry, conflict and services code works without map-specific
    coordinates in mission source.
*/

if (!isServer) exitWith {false};
if !(missionNamespace getVariable ["RHD_DYNAMIC_LOCATIONS_ENABLE", true]) exitWith {false};

private _waitUntilA3AReady = missionNamespace getVariable ["RHD_DYNAMIC_LOCATIONS_WAIT_FOR_A3A", true];
if (_waitUntilA3AReady && {!isNil "A3A_fnc_initServer"}) then {
    private _deadline = time + 180;
    waitUntil {
        sleep 0.5;
        (!isNil "serverInitDone" && {serverInitDone}) || {time >= _deadline}
    };
};

private _safeMarkerDelete = {
    {
        deleteMarker _x;
    } forEach (allMapMarkers select {
        private _m = toLower _x;
        (_m find "rhd_shop_") == 0 ||
        (_m find "rhd_bank_") == 0 ||
        (_m find "rhd_fuel_") == 0 ||
        (_m find "rhd_farm_") == 0 ||
        (_m find "rhd_mine_") == 0 ||
        (_m find "rhd_refine_") == 0 ||
        (_m find "rhd_zone_") == 0 ||
        (_m find "rhd_police_") == 0 ||
        (_m find "rhd_ems_") == 0 ||
        (_m find "rhd_jail_") == 0
    });
};

if (missionNamespace getVariable ["RHD_DYNAMIC_LOCATIONS_REPLACE_STATIC", true]) then {
    call _safeMarkerDelete;
};

private _markerCounter = 0;
private _makeMarker = {
    params ["_prefix", "_pos", "_text", "_type", "_color", ["_size", [0.9, 0.9]]];
    private _name = format ["%1%2", _prefix, _markerCounter];
    _markerCounter = _markerCounter + 1;
    private _marker = createMarker [_name, _pos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType _type;
    _marker setMarkerColor _color;
    _marker setMarkerText _text;
    _marker setMarkerSize _size;
    _marker
};

private _centers = nearestLocations [
    [worldSize / 2, worldSize / 2],
    ["NameCityCapital", "NameCity", "NameVillage", "NameLocal"],
    worldSize
];

// Prefer populated settlements and keep the resolver deterministic.
_centers = _centers select {
    private _p = locationPosition _x;
    _p distance2D [worldSize / 2, worldSize / 2] <= worldSize
};

if (_centers isEqualTo []) exitWith {
    diag_log "[RHD-LIFECORE] Dynamic location resolver found no terrain settlements.";
    missionNamespace setVariable ["RHD_DYNAMIC_LOCATIONS_READY", false, true];
    false
};

// ---------------------------------------------------------------------------
// ANTISTASI CONTROL / ZONE LAYER
// ---------------------------------------------------------------------------
private _a3aZones = [];
if (!isNil "controlsX") then {
    _a3aZones append (controlsX select {
        _x isEqualType "" && {_x in allMapMarkers}
    });
};

_a3aZones = _a3aZones arrayIntersect _a3aZones;
{
    private _pos = getMarkerPos _x;
    if ((_pos select 0) > 0 || {(_pos select 1) > 0}) then {
        ["rhd_zone_a3a_", _pos, format ["Antistasi: %1", markerText _x], "mil_objective", "ColorOPFOR", [1,1]] call _makeMarker;
    };
} forEach _a3aZones;

// If A3A has no controlsX markers yet, use the terrain's larger settlements as
// pressure districts. This remains deterministic and terrain-agnostic.
if (_a3aZones isEqualTo []) then {
    private _limit = 0;
    {
        if (_limit < 12) then {
            ["rhd_zone_", locationPosition _x, text _x, "mil_objective", "ColorOrange", [0.9,0.9]] call _makeMarker;
            _limit = _limit + 1;
        };
    } forEach _centers;
};

// ---------------------------------------------------------------------------
// SHOPS / BANKS / FUEL / SERVICES
// ---------------------------------------------------------------------------
private _idx = 0;
{
    private _pos = locationPosition _x;
    private _town = text _x;
    if (_town isEqualTo "") then {_town = format ["District %1", _idx + 1]};

    ["rhd_shop_", _pos, format ["RHD Shop | %1", _town], "hd_objective", "ColorBlue"] call _makeMarker;

    // Major settlements receive a bank and public service hub.
    if ((_idx mod 2) == 0 || {_idx == 0}) then {
        ["rhd_bank_", _pos vectorAdd [12, 0, 0], format ["RHD Bank | %1", _town], "hd_objective", "ColorGreen"] call _makeMarker;
        ["rhd_police_", _pos vectorAdd [-12, 0, 0], format ["Police | %1", _town], "hd_objective", "ColorBlue"] call _makeMarker;
        ["rhd_ems_", _pos vectorAdd [0, 12, 0], format ["EMS | %1", _town], "hd_objective", "ColorPink"] call _makeMarker;
        ["rhd_jail_", _pos vectorAdd [0, -12, 0], format ["Jail | %1", _town], "hd_objective", "ColorRed"] call _makeMarker;
    };
    _idx = _idx + 1;
} forEach _centers;

private _fuelTypes = [];
if (!isNil "A3A_fnc_getMapInfo") then {
    private _mapInfo = call A3A_fnc_getMapInfo;
    if (isClass _mapInfo) then {
        _fuelTypes = getArray (_mapInfo >> "fuelStationTypes");
    };
};

if (_fuelTypes isEqualTo []) then {
    _fuelTypes = [
        "Land_FuelStation_Feed_F",
        "Land_fs_feed_F",
        "Land_FuelStation_01_pump_F",
        "Land_FuelStation_02_pump_F",
        "Land_FuelStation_03_pump_F",
        "Land_Fuelstation"
    ];
};

private _fuelObjects = nearestObjects [[worldSize / 2, worldSize / 2], _fuelTypes, worldSize];
private _fuelCount = 0;
{
    if (_fuelCount < 24) then {
        ["rhd_fuel_", getPosATL _x, "Fuel Station", "hd_fuel", "ColorYellow"] call _makeMarker;
        _fuelCount = _fuelCount + 1;
    };
} forEach _fuelObjects;

if (_fuelCount == 0) then {
    private _fallbackFuel = _centers select [0, (count _centers) min 8];
    {
        ["rhd_fuel_", locationPosition _x vectorAdd [20, 0, 0], format ["Fuel | %1", text _x], "hd_fuel", "ColorYellow"] call _makeMarker;
    } forEach _fallbackFuel;
};

private _bankPositions = [];
if (!isNil "A3A_fnc_getMapInfo") then {
    private _mapInfo = call A3A_fnc_getMapInfo;
    if (isClass _mapInfo) then {
        _bankPositions = getArray (_mapInfo >> "banks");
    };
};

// A3A mapInfo banks are preferred. If the active terrain has none defined,
// the major settlement bank markers above remain the valid RHD fallback.
if !(_bankPositions isEqualTo []) then {
    {
        if (_x isEqualType [] && {count _x >= 2}) then {
            private _p = +_x;
            if (count _p < 3) then {_p pushBack 0};
            ["rhd_bank_a3a_", _p, "Antistasi Bank", "hd_objective", "ColorGreen"] call _makeMarker;
        };
    } forEach _bankPositions;
};

// ---------------------------------------------------------------------------
// INDUSTRY: FARMING / MINING / REFINING
// ---------------------------------------------------------------------------
private _chooseTerrainPos = {
    params ["_origin", "_radius", "_expression", ["_fallbackOffset", [0,0,0]]];
    private _candidates = selectBestPlaces [_origin, _radius, _expression, 50, 12];
    if (_candidates isEqualTo []) exitWith {_origin vectorAdd _fallbackOffset};
    ((_candidates select 0) select 0) vectorAdd [0, 0, 0]
};

private _resourceTownPositions = [];
{
    _resourceTownPositions pushBack (locationPosition _x);
} forEach (_centers select [0, (count _centers) min 12]);

private _farmDefs = [
    ["apples", "Apple Orchard", "meadow - 2*houses - 6*sea"],
    ["cannabis", "Cannabis Field", "forest + meadow - 2*houses - 6*sea"],
    ["coca", "Coca Field", "forest - 2*houses - 6*sea"],
    ["corn", "Corn Field", "meadow - 2*houses - 6*sea"],
    ["grapes", "Grape Vineyard", "meadow + hills - 2*houses - 6*sea"],
    ["peaches", "Peach Orchard", "meadow + forest - 2*houses - 6*sea"]
];

private _farmIndex = 0;
{
    private _townPos = _resourceTownPositions select (_farmIndex mod (count _resourceTownPositions));
    private _pos = [_townPos, 4500, (_x select 2), [450, 0, 0]] call _chooseTerrainPos;
    [format ["rhd_farm_%1_", _x select 0], _pos, _x select 1, "hd_dot", "ColorOrange"] call _makeMarker;
    _farmIndex = _farmIndex + 1;
} forEach _farmDefs;

private _mineDefs = [
    ["iron", "Iron Mine"],
    ["copper", "Copper Mine"],
    ["gold", "Gold Mine"],
    ["diamond", "Diamond Mine"],
    ["oil", "Oil Sand Site"]
];
private _mineIndex = 0;
{
    private _townPos = _resourceTownPositions select ((_mineIndex + 2) mod (count _resourceTownPositions));
    private _expr = if ((_mineIndex mod 2) == 0) then {
        "2*hills - 2*houses - 6*sea"
    } else {
        "hills + meadow - 2*houses - 6*sea"
    };
    private _offset = [800 + (_mineIndex * 150), 600, 0];
    private _pos = [_townPos, 5500, _expr, _offset] call _chooseTerrainPos;
    [format ["rhd_mine_%1_", _x select 0], _pos, _x select 1, "hd_dot", "ColorGrey"] call _makeMarker;
    _mineIndex = _mineIndex + 1;
} forEach _mineDefs;

// Put refineries on real industrial objects when available, then fall back to
// the industrial side of a major settlement.
private _industrialTypes = [
    "Land_IndustrialBuilding_01_F",
    "Land_i_Shed_Ind_F",
    "Land_Ind_Workshop01_01_F",
    "Land_Ind_Workshop01_02_F",
    "Land_u_Shed_Ind_F",
    "Land_Factory_Main_01_F"
];
private _industrialObjects = nearestObjects [[worldSize / 2, worldSize / 2], _industrialTypes, worldSize];
private _refineryDefs = [["iron", "Iron Refinery"], ["copper", "Copper Refinery"], ["gold", "Gold Refinery"], ["oil", "Oil Refinery"]];
private _refineryIndex = 0;
{
    private _pos = if (_industrialObjects isNotEqualTo []) then {
        getPosATL (_industrialObjects select (_refineryIndex mod (count _industrialObjects)))
    } else {
        (locationPosition (_centers select (_refineryIndex mod (count _centers)))) vectorAdd [30, 30, 0]
    };
    [format ["rhd_refine_%1_", _x select 0], _pos, _x select 1, "hd_factory", "ColorBrown"] call _makeMarker;
    _refineryIndex = _refineryIndex + 1;
} forEach _refineryDefs;

missionNamespace setVariable ["RHD_DYNAMIC_LOCATIONS_READY", true, true];
missionNamespace setVariable ["RHD_DYNAMIC_LOCATION_COUNT", _markerCounter, true];
missionNamespace setVariable ["RHD_DYNAMIC_LOCATION_TERRAIN", worldName, true];
missionNamespace setVariable ["RHD_DYNAMIC_LOCATION_A3A", !isNil "A3A_fnc_initServer", true];

diag_log format [
    "[RHD-LIFECORE] Dynamic locations ready: terrain=%1, markers=%2, A3A=%3",
    worldName,
    _markerCounter,
    !isNil "A3A_fnc_initServer"
];

true
