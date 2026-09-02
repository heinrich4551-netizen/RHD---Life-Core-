/*
    RHD - LifeCore | Conflict Director
    Author: LT. Toad

    PURPOSE
    -------
    Adds a Life RP pressure layer around the Antistasi Ultimate strategic map.

    Antistasi owns the actual war, factions, garrisons, attacks and strategic
    control. RHD tracks a smaller local pressure value for the player tablet.

    ZONE SOURCES
    ------------
    1. A3A control markers discovered by the Antistasi bridge.
    2. Optional RHD `rhd_zone_*` markers placed by the Eden editor.

    RHD STATE
    ---------
    [Control State, Heat, Supply, Last Update, Display Name, Players Nearby, Police Nearby]
*/

if (!isServer) exitWith {false};

while {isServer} do {
    if !(missionNamespace getVariable ["RHD_CONFLICT_ENABLE", true]) then {
        sleep 10;
        continue;
    };

    private _radius = missionNamespace getVariable ["RHD_CONFLICT_ZONE_RADIUS", 400];
    private _maxHeat = missionNamespace getVariable ["RHD_CONFLICT_MAX_HEAT", 100];
    private _policeDecay = missionNamespace getVariable ["RHD_CONFLICT_HEAT_DECAY_WITH_POLICE", 1.5];
    private _quietGrowth = missionNamespace getVariable ["RHD_CONFLICT_HEAT_GROWTH_NO_POLICE", 0.25];
    private _startSupply = missionNamespace getVariable ["RHD_CONFLICT_START_SUPPLY", 100];
    private _state = missionNamespace getVariable ["RHD_CONFLICT_ZONES", createHashMap];

    private _a3aMarkers = missionNamespace getVariable ["RHD_A3A_ZONE_MARKERS", []];
    private _rhdMarkers = allMapMarkers select {(_x find "rhd_zone_") isEqualTo 0};
    private _zones = (_a3aMarkers + _rhdMarkers) arrayIntersect (_a3aMarkers + _rhdMarkers);

    {
        private _marker = _x;
        private _name = markerText _marker;
        if (_name isEqualTo "") then {_name = _marker};

        private _old = _state getOrDefault [
            _marker,
            ["CONTESTED", 50, _startSupply, diag_tickTime, _name, 0, 0]
        ];

        private _heat = _old param [1, 50];
        private _supply = _old param [2, _startSupply];

        private _near = allPlayers select {
            alive _x && {_x distance2D (getMarkerPos _marker) <= _radius}
        };

        private _police = count (_near select {
            (_x getVariable ["RHD_JOB", "civ"]) isEqualTo "police"
        });

        // Police presence cools the local Life RP pressure.
        if (_police > 0) then {
            _heat = _heat - (_policeDecay min 5);
            _supply = (_supply + (_police * 0.5)) min 100;
        } else {
            _heat = _heat + (_quietGrowth max 0);
        };

        // For Antistasi strategic markers, add the A3A global aggression as
        // background pressure without changing A3A's own control state.
        if (_marker in _a3aMarkers) then {
            private _globalAggression = missionNamespace getVariable ["aggression", 0];
            _heat = ((_heat * 0.75) + (_globalAggression * 0.25));
        };

        _heat = (_heat max 0) min _maxHeat;

        private _control = switch true do {
            case (_marker in _a3aMarkers && {!isNil "sidesX"} && {(sidesX getVariable [_marker, sideUnknown]) isEqualTo teamPlayer}): {
                "A3A CONTROLLED"
            };
            case (_heat >= 75): {"CRIMINAL PRESSURE"};
            case (_heat >= 45): {"CONTESTED"};
            default {"ORDERLY"};
        };

        _state set [
            _marker,
            [_control, _heat, _supply, diag_tickTime, _name, count _near, _police]
        ];
    } forEach _zones;

    missionNamespace setVariable ["RHD_CONFLICT_ZONES", _state, true];
    publicVariable "RHD_CONFLICT_ZONES";

    sleep (missionNamespace getVariable ["RHD_CONFLICT_UPDATE_SECONDS", 60]);
};
