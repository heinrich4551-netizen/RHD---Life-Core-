/*
    RHD - LifeCore | Server-side Administrator Dispatcher
    Author: LT. Toad

    All privileged actions are validated on the server.
    Vehicle spawning uses the Antistasi Ultimate collision-aware spawn routine
    when the A3A campaign base is ready.
*/

if (!isServer) exitWith {};

params ["_adminOwner", "_targetNetId", "_action", ["_value", ""], ["_selection", ""]];

// ============================================================================
// ADMIN AUTHENTICATION
// ============================================================================
private _admins = missionNamespace getVariable ["RHD_ADMIN_UIDS", []];
private _adminCandidates = allPlayers select {owner _x isEqualTo _adminOwner};
if (_adminCandidates isEqualTo []) exitWith {};

private _admin = _adminCandidates select 0;
private _adminUID = getPlayerUID _admin;
if (_adminUID isEqualTo "" || {!(_adminUID in _admins)}) exitWith {};

private _target = objectFromNetId _targetNetId;

if (isNull _target && {!(_action in ["setTime", "setWeather", "announce", "spawnVehicle"])}) exitWith {};

// ============================================================================
// ADMIN ACTIONS
// ============================================================================
switch (_action) do {

    case "info": {
        private _msg = format [
            "%1 | UID %2 | Job %3 | Cash $%4 | Bank $%5",
            name _target,
            getPlayerUID _target,
            _target getVariable ["RHD_JOB", "civ"],
            _target getVariable ["RHD_CASH", 0],
            _target getVariable ["RHD_BANK", 0]
        ];

        [_msg, "info"] remoteExecCall ["RHD_fnc_notify", _adminOwner];
    };

    case "heal": {
        if (alive _target) then {
            _target setDamage 0;
            _target setVariable ["ACE_isUnconscious", false, true];
            ["Player restored.", "success"] remoteExecCall ["RHD_fnc_notify", _adminOwner];
        };
    };

    case "kill": {
        if (alive _target) then {
            _target setDamage 1;
        };
    };

    case "freeze": {
        private _newState = !(_target getVariable ["RHD_ADMIN_FROZEN", false]);
        _target setVariable ["RHD_ADMIN_FROZEN", _newState, true];
        [_newState] remoteExecCall ["RHD_fnc_adminFreeze", owner _target];
    };

    case "tpTo": {
        _admin setPosATL (getPosATL _target);
    };

    case "tpHere": {
        _target setPosATL (getPosATL _admin);
    };

    case "setCash": {
        private _value = (parseNumber _value) max 0 min 100000000;
        _target setVariable ["RHD_CASH", _value, true];
    };

    case "setBank": {
        private _value = (parseNumber _value) max 0 min 100000000;
        _target setVariable ["RHD_BANK", _value, true];
    };

    case "giveItem": {
        private _items = missionNamespace getVariable ["RHD_ITEMS", createHashMap];
        if (_items getOrDefault [_selection, []] isNotEqualTo []) then {
            private _count = ((parseNumber _value) floor) max 1 min 1000;
            [_target, _selection, _count] call RHD_fnc_addItem;
        };
    };

    case "setJob": {
        private _jobs = missionNamespace getVariable ["RHD_JOBS", createHashMap];
        if (_jobs getOrDefault [_selection, []] isNotEqualTo []) then {
            _target setVariable ["RHD_JOB", _selection, true];
            _target setVariable ["RHD_WORKING", true, true];
        };
    };

    case "repair": {
        private _veh = if (!isNull _target && {vehicle _target != _target}) then {
            vehicle _target
        } else {
            vehicle _admin
        };

        if (!isNull _veh && {_veh != _admin}) then {
            _veh setDamage 0;
        };
    };

    case "refuel": {
        private _veh = if (!isNull _target && {vehicle _target != _target}) then {
            vehicle _target
        } else {
            vehicle _admin
        };

        if (!isNull _veh && {_veh != _admin}) then {
            _veh setFuel 1;
        };
    };

    case "spawnVehicle": {
        private _class = _value;

        if (
            _class isEqualType "" &&
            {_class != ""} &&
            {isClass (configFile >> "CfgVehicles" >> _class)}
        ) then {
            private _veh = [_class, getPosATL _admin, 12, 8] call RHD_fnc_antistasiSpawnVehicle;

            if (isNull _veh) then {
                // Fall back to a simple server spawn only if the A3A base is
                // unavailable. This keeps the admin tool usable during setup.
                _veh = createVehicle [_class, getPosATL _admin, [], 6, "NONE"];
            };

            _veh setDir getDir _admin;
            _veh setFuel 1;
        };
    };

    case "deleteVehicle": {
        private _veh = if (!isNull _target && {vehicle _target != _target}) then {
            vehicle _target
        } else {
            objNull
        };

        if (!isNull _veh) then {
            deleteVehicle _veh;
        };
    };

    case "setTime": {
        private _time = (parseNumber _value) max 0 min 23.99;
        private _hour = floor _time;
        private _minute = floor ((_time - _hour) * 60);
        private _date = date;

        _date set [3, _hour];
        _date set [4, _minute];
        setDate _date;
    };

    case "setWeather": {
        private _weather = (parseNumber _value) max 0 min 1;
        0 setOvercast _weather;
        0 setRain _weather;
        0 setFog _weather;
        forceWeatherChange;
    };

    case "spectate": {
        if (!isNull _target) then {
            [_target] remoteExecCall ["RHD_fnc_adminSpectate", _adminOwner];
        };
    };

    case "announce": {
        if (_value isEqualType "" && {_value != ""}) then {
            [_value, "info"] remoteExecCall ["RHD_fnc_notify", -2];
        };
    };
};
