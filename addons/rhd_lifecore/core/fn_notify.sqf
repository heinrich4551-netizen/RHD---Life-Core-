params ["_message", ["_type", "info"]];
private _title = switch (_type) do {
    case "error": {"RHD LIFE | ERROR"};
    case "success": {"RHD LIFE | SUCCESS"};
    default {"RHD LIFE"};
};
systemChat format ["%1: %2", _title, _message];
