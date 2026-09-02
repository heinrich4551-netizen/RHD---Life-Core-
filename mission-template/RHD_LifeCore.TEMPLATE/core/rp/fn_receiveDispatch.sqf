/* Client-side dispatch receiver. */
if (!hasInterface) exitWith {};
params ["_pos", ["_message", "Incident reported"], ["_kind", "police"]];

private _title = switch (_kind) do {
    case "ems": {"EMS DISPATCH"};
    case "both": {"PUBLIC SAFETY DISPATCH"};
    default {"POLICE DISPATCH"};
};

[format ["%1 | %2", _title, _message], "info"] call RHD_fnc_notify;
private _id = format ["RHD_DISPATCH_%1_%2", floor (diag_tickTime * 10), floor random 9999];
private _marker = createMarkerLocal [_id, _pos];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal (if (_kind isEqualTo "ems") then {"mil_warning"} else {"mil_dot"});
_marker setMarkerTextLocal _title;
_marker setMarkerSizeLocal [0.75,0.75];

[_marker] spawn {
    params ["_marker"];
    sleep 300;
    deleteMarkerLocal _marker;
};
