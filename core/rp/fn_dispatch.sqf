/* RHD job dispatch router */
if (!isServer) exitWith {};
params ["_pos", ["_message", "Incident reported"], ["_kind", "police"]];

{
    private _job = _x getVariable ["RHD_JOB", "civ"];
    private _send = switch (_kind) do {
        case "ems": {_job isEqualTo "medic"};
        case "both": {_job in ["police","medic"]};
        default {_job isEqualTo "police"};
    };
    if (_send && {alive _x}) then {
        [_pos, _message, _kind] remoteExecCall ["RHD_fnc_receiveDispatch", owner _x];
    };
} forEach allPlayers;
