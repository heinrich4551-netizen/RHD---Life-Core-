params ["_unit", "_job"];
if (!isServer || {isNull _unit} || {!isPlayer _unit}) exitWith {};
if (owner _unit != remoteExecutedOwner) exitWith {};
private _jobs = missionNamespace getVariable ["RHD_JOBS", createHashMap];
private _def = _jobs getOrDefault [_job, []];
if (_def isEqualTo []) exitWith {["Invalid job.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit]};
private _token = floor (random 1000000000);
_unit setVariable ["RHD_JOB", _job, true];
_unit setVariable ["RHD_WORKING", true, true];
_unit setVariable ["RHD_PAY_TOKEN", _token, false];
private _name = _def select 0;
[format ["Job changed to %1. You are now on duty.", _name], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
[_unit, _token] spawn {
    params ["_unit", "_token"];
    while {isServer && {!isNull _unit} && {alive _unit} && {_unit getVariable ["RHD_WORKING", false]} && {_unit getVariable ["RHD_PAY_TOKEN", -1] isEqualTo _token}} do {
        sleep 60;
        if (isNull _unit || {!alive _unit}) exitWith {};
        private _jobsNow = missionNamespace getVariable ["RHD_JOBS", createHashMap];
        private _jobNow = _unit getVariable ["RHD_JOB", "civ"];
        private _pay = ((_jobsNow getOrDefault [_jobNow, ["Civilian",0]]) select 1);
        if (_pay > 0) then {
            [_unit, _pay] call RHD_fnc_addCash;
            [format ["Paycheck received: $%1.", _pay], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
        };
    };
};
