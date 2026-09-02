/*
    RHD Ambient Director
    Performance-first ambient population system.
    Server authoritative, hard caps, active-player bubble, auto cleanup.
*/
if (!isServer) exitWith {};
if (missionNamespace getVariable ["RHD_AMBIENT_RUNNING", false]) exitWith {};
missionNamespace setVariable ["RHD_AMBIENT_RUNNING", true, false];

private _maxCiviliansDay = 10;
private _maxCiviliansNight = 5;
private _maxTrafficDay = 4;
private _maxTrafficNight = 2;
private _spawnRadius = 450;
private _avoidRadius = 180;
private _despawnRadius = 1100;
private _tick = 20;

private _civClasses = ["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
private _vehicleClasses = ["C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F"];
missionNamespace setVariable ["RHD_AMBIENT_CIVS", [], false];
missionNamespace setVariable ["RHD_AMBIENT_VEHICLES", [], false];

private _ambientGroup = createGroup civilian;
_ambientGroup setBehaviourStrong "CARELESS";
_ambientGroup setCombatMode "BLUE";
missionNamespace setVariable ["RHD_AMBIENT_GROUP", _ambientGroup, false];

private _fnNearestPlayerDistance = {
    params ["_pos"];
    private _best = 99999;
    {if (alive _x) then {private _d = _x distance2D _pos; if (_d < _best) then {_best = _d;};};} forEach allPlayers;
    _best
};

private _fnRoadPos = {
    params ["_centre"];
    private _roads = (_centre nearRoads _spawnRadius) select {((_centre distance2D _x) > _avoidRadius)};
    if (_roads isEqualTo []) exitWith {[0,0,0]};
    private _pos = getPosATL (selectRandom _roads);
    _pos set [2,0];
    _pos
};

while {isServer} do {
    sleep _tick;
    private _civs = missionNamespace getVariable ["RHD_AMBIENT_CIVS", []];
    private _vehicles = missionNamespace getVariable ["RHD_AMBIENT_VEHICLES", []];
    _civs = _civs select {alive _x && {!isNull _x}};
    _vehicles = _vehicles select {alive _x && {!isNull _x}};

    {
        private _veh = _x;
        private _near = [getPosATL _veh] call _fnNearestPlayerDistance;
        private _spawned = _veh getVariable ["RHD_AMBIENT_SPAWNED", diag_tickTime];
        if (_near > _despawnRadius || {diag_tickTime - _spawned > 1200}) then {
            {if (_x getVariable ["RHD_AMBIENT", false]) then {deleteVehicle _x;};} forEach crew _veh;
            deleteVehicle _veh;
        };
    } forEach _vehicles;

    {
        private _unit = _x;
        private _near = [getPosATL _unit] call _fnNearestPlayerDistance;
        private _spawned = _unit getVariable ["RHD_AMBIENT_SPAWNED", diag_tickTime];
        if (_near > _despawnRadius || {diag_tickTime - _spawned > 1200}) then {deleteVehicle _unit;};
    } forEach _civs;

    _civs = _civs select {alive _x && {!isNull _x}};
    _vehicles = _vehicles select {alive _x && {!isNull _x}};
    if (allPlayers isEqualTo []) then {
        missionNamespace setVariable ["RHD_AMBIENT_CIVS", _civs, false];
        missionNamespace setVariable ["RHD_AMBIENT_VEHICLES", _vehicles, false];
        continue;
    };

    private _activePlayers = allPlayers select {alive _x};
    if (_activePlayers isEqualTo []) then {continue;};
    private _anchor = selectRandom _activePlayers;
    private _night = (sunOrMoon < 0.35);
    private _maxCivilians = if (_night) then {_maxCiviliansNight} else {_maxCiviliansDay};
    private _maxTraffic = if (_night) then {_maxTrafficNight} else {_maxTrafficDay};

    if ((count _civs) < _maxCivilians && {random 1 > 0.35}) then {
        private _pos = [getPosATL _anchor] call _fnRoadPos;
        if !(_pos isEqualTo [0,0,0]) then {
            private _unit = _ambientGroup createUnit [selectRandom _civClasses, _pos, [], 0, "NONE"];
            _unit setVariable ["RHD_AMBIENT", true, false];
            _unit setVariable ["RHD_AMBIENT_SPAWNED", diag_tickTime, false];
            _unit setBehaviour "CARELESS";
            _unit setCombatMode "BLUE";
            _unit allowFleeing 0;
            _unit disableAI "TARGET";
            _unit disableAI "AUTOTARGET";
            _unit disableAI "AUTOCOMBAT";
            _unit doMove (_pos getPos [40 + random 80, random 360]);
            _civs pushBack _unit;
        };
    };

    if ((count _vehicles) < _maxTraffic && {random 1 > 0.55}) then {
        private _pos = [getPosATL _anchor] call _fnRoadPos;
        if !(_pos isEqualTo [0,0,0]) then {
            private _vehicle = createVehicle [selectRandom _vehicleClasses, _pos, [], 0, "NONE"];
            _vehicle setVariable ["RHD_AMBIENT", true, false];
            _vehicle setVariable ["RHD_AMBIENT_SPAWNED", diag_tickTime, false];
            private _driver = _ambientGroup createUnit [selectRandom _civClasses, _pos, [], 0, "NONE"];
            _driver setVariable ["RHD_AMBIENT", true, false];
            _driver setVariable ["RHD_AMBIENT_SPAWNED", diag_tickTime, false];
            _driver moveInDriver _vehicle;
            _driver setBehaviour "SAFE";
            _driver setCombatMode "BLUE";
            _driver allowFleeing 0;
            _driver disableAI "TARGET";
            _driver disableAI "AUTOTARGET";
            _driver disableAI "AUTOCOMBAT";
            _driver doMove (_pos getPos [300 + random 300, getDir _vehicle]);
            _vehicles pushBack _vehicle;
            _civs pushBack _driver;
        };
    };

    missionNamespace setVariable ["RHD_AMBIENT_CIVS", _civs, false];
    missionNamespace setVariable ["RHD_AMBIENT_VEHICLES", _vehicles, false];
};
