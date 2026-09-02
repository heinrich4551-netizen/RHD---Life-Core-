/*
    RHD Ambient Events
    Rare, short-lived micro-events to make populated areas feel active.
    No mission-critical systems depend on these entities.
*/
if (!isServer) exitWith {};
if (missionNamespace getVariable ["RHD_AMBIENT_EVENTS_RUNNING", false]) exitWith {};
missionNamespace setVariable ["RHD_AMBIENT_EVENTS_RUNNING", true, false];

private _maxEvents = 2;
private _radius = 650;
private _lifetime = 420;

missionNamespace setVariable ["RHD_AMBIENT_EVENTS", [], false];

private _fnCleanup = {
    private _events = missionNamespace getVariable ["RHD_AMBIENT_EVENTS", []];
    {
        private _event = _x;
        private _objects = _event select 0;
        private _time = _event select 1;
        private _alive = _objects select {alive _x && {!isNull _x}};
        private _near = 99999;
        {
            if (alive _x) then {
                private _d = _x distance2D (getPosATL (selectRandom _objects));
                if (_d < _near) then {_near = _d;};
            };
        } forEach allPlayers;
        if (_near > 1100 || {diag_tickTime - _time > _lifetime} || {_alive isEqualTo []}) then {
            {if (!isNull _x) then {deleteVehicle _x;};} forEach _objects;
        };
    } forEach _events;
    _events = _events select {
        private _objs = _x select 0;
        (_objs findIf {!isNull _x}) > -1
    };
    missionNamespace setVariable ["RHD_AMBIENT_EVENTS", _events, false];
};

private _fnRoadPos = {
    params ["_centre"];
    private _roads = _centre nearRoads _radius;
    if (_roads isEqualTo []) exitWith {[0,0,0]};
    private _pos = getPosATL (selectRandom _roads);
    _pos set [2, 0];
    _pos
};

while {isServer} do {
    sleep 90;
    call _fnCleanup;

    private _events = missionNamespace getVariable ["RHD_AMBIENT_EVENTS", []];
    if ((count _events) >= _maxEvents) then {continue;};
    private _players = allPlayers select {alive _x};
    if (_players isEqualTo []) then {continue;};
    if (random 1 < 0.45) then {continue;};

    private _anchor = selectRandom _players;
    private _pos = [getPosATL _anchor] call _fnRoadPos;
    if (_pos isEqualTo [0,0,0]) then {continue;};

    private _vehicle = createVehicle [selectRandom ["C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_F"], _pos, [], 0, "NONE"];
    _vehicle setVariable ["RHD_AMBIENT_EVENT", true, false];
    _vehicle setFuel 0;
    _vehicle setDamage 0.25;

    private _group = createGroup civilian;
    private _person = _group createUnit [selectRandom ["C_man_1","C_man_1_1_F","C_man_1_2_F"], _pos, [], 0, "NONE"];
    _person setVariable ["RHD_AMBIENT_EVENT", true, false];
    _person setBehaviour "CARELESS";
    _person setCombatMode "BLUE";
    _person disableAI "TARGET";
    _person disableAI "AUTOTARGET";
    _person disableAI "AUTOCOMBAT";
    _person setDir (random 360);

    private _objects = [_vehicle, _person];
    if (random 1 > 0.55) then {
        private _helper = _group createUnit [selectRandom ["C_man_1","C_man_1_1_F","C_man_1_3_F"], _pos getPos [4 + random 4, random 360], [], 0, "NONE"];
        _helper setVariable ["RHD_AMBIENT_EVENT", true, false];
        _helper setBehaviour "CARELESS";
        _helper setCombatMode "BLUE";
        _helper disableAI "TARGET";
        _helper disableAI "AUTOTARGET";
        _helper disableAI "AUTOCOMBAT";
        _objects pushBack _helper;
    };

    _events pushBack [_objects, diag_tickTime];
    missionNamespace setVariable ["RHD_AMBIENT_EVENTS", _events, false];
};
