params ["_unit", "_job"];
if (!isServer || {isNull _unit} || {!isPlayer _unit}) exitWith {};
private _jobs = missionNamespace getVariable ["RHD_JOBS", createHashMap];
if (isNil {_jobs get _job}) exitWith {["Invalid job.", "error"] remoteExecCall ["RHD_fnc_notify", owner _unit]};
_unit setVariable ["RHD_JOB", _job, true];
_unit setVariable ["RHD_WORKING", false, true];
private _name = ((_jobs get _job) select 0);
[format ["Job changed to %1.", _name], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
