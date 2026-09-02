params ["_medic", "_target"];
if (!isServer || {isNull _medic} || {isNull _target}) exitWith {};
if (!isPlayer _medic || {!isPlayer _target} || {!alive _target}) exitWith {};
if !(_medic getVariable ["RHD_JOB", "civ"] isEqualTo "medic") exitWith {};
if (_medic distance2D _target > 10) exitWith {};
_target setDamage 0;
["EMS treatment complete.", "success"] remoteExecCall ["RHD_fnc_notify", owner _target];
["Patient treated.", "success"] remoteExecCall ["RHD_fnc_notify", owner _medic];
