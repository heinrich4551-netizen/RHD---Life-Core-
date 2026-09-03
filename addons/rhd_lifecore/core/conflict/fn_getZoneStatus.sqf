/*
    RHD - LifeCore | Get district status

    Returns a compact array:
        [districtName, controlState, heat, supply, playersNearby, policeNearby]

    USAGE
    -----
    ["rhd_zone_kavala"] call RHD_fnc_getZoneStatus;
*/

params ["_marker"];

private _zones = missionNamespace getVariable ["RHD_CONFLICT_ZONES", createHashMap];
private _data = _zones getOrDefault [_marker, []];
if (_data isEqualTo []) exitWith {[]};

[
    _data param [4, _marker],
    _data param [0, "UNKNOWN"],
    round (_data param [1, 0]),
    round (_data param [2, 0]),
    _data param [5, 0],
    _data param [6, 0]
]
