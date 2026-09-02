/* RHD - LifeCore | Refinery Request */
if !(missionNamespace getVariable ["RHD_LIFE_ENABLE_INDUSTRY", false]) exitWith {
    ["Industry is disabled in the RHD Life RP Systems 3DEN module.", "error"] call RHD_fnc_notify;
};

private _markers = allMapMarkers select {(toLower _x find "rhd_refine_") == 0};
if (_markers isEqualTo []) exitWith {["No refinery locations are configured in 3DEN.", "error"] call RHD_fnc_notify};

private _near = _markers select {player distance2D (getMarkerPos _x) <= 12};
if (_near isEqualTo []) exitWith {["You are not at a refinery location.", "error"] call RHD_fnc_notify};

private _marker = _near select 0;
private _m = toLower _marker;
private _input = switch (true) do {
    case (_m == "rhd_refine_iron" || {_m find "rhd_refine_iron_" == 0}): {"iron_ore"};
    case (_m == "rhd_refine_copper" || {_m find "rhd_refine_copper_" == 0}): {"copper_ore"};
    case (_m == "rhd_refine_gold" || {_m find "rhd_refine_gold_" == 0}): {"gold_ore"};
    case (_m == "rhd_refine_oil" || {_m find "rhd_refine_oil_" == 0}): {"oil_sand"};
    default {""};
};

if (_input isEqualTo "") exitWith {
    ["Invalid refinery marker. Use rhd_refine_iron_<name>, copper, gold or oil.", "error"] call RHD_fnc_notify;
};

[player, _input, 1, _marker] remoteExecCall ["RHD_fnc_refine", 2];
