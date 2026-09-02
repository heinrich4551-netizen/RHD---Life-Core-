/*
    RHD - LifeCore | Antistasi Ultimate optional bridge
    Author: LT. Toad

    Antistasi Ultimate is an optional enhancement. RHD always initializes its
    own Life RP systems; when A3A is present this bridge exposes the campaign
    state to RHD without replacing the A3A strategic engine.
*/

if (!isServer) exitWith {false};

private _hasA3A = isClass (configFile >> "CfgPatches" >> "A3A_core") && {!isNil "A3A_fnc_initServer"};

if (!_hasA3A) exitWith {
    missionNamespace setVariable ["RHD_A3A_BASE_READY", true, true];
    missionNamespace setVariable ["RHD_A3A_INSTALLED", false, true];
    missionNamespace setVariable ["RHD_A3A_MODE", "STANDALONE", true];
    missionNamespace setVariable ["RHD_A3A_BASE_VERSION", "not installed", true];
    missionNamespace setVariable ["RHD_A3A_BASE_STARTED", false, true];
    missionNamespace setVariable ["RHD_A3A_ZONE_MARKERS", [], true];
    missionNamespace setVariable ["RHD_A3A_HQ", objNull, true];
    diag_log "[RHD-LIFECORE] Antistasi Ultimate absent; RHD continues in standalone mode.";
    true
};

missionNamespace setVariable ["RHD_A3A_INSTALLED", true, true];
missionNamespace setVariable ["RHD_A3A_MODE", "ANTISTASI", true];

private _timeout = time + 180;
waitUntil {
    sleep 0.5;
    (!isNil "serverInitDone" && {serverInitDone}) || {time > _timeout}
};

if (isNil "serverInitDone" || {!serverInitDone}) exitWith {
    diag_log "[RHD-LIFECORE] WARNING: Antistasi was loaded but did not report serverInitDone; continuing RHD in degraded A3A mode.";
    missionNamespace setVariable ["RHD_A3A_BASE_READY", true, true];
    missionNamespace setVariable ["RHD_A3A_BASE_STARTED", false, true];
    missionNamespace setVariable ["RHD_A3A_BASE_VERSION", missionNamespace getVariable ["A3A_serverVersion", "unknown"], true];
    missionNamespace setVariable ["RHD_A3A_ZONE_MARKERS", [], true];
    missionNamespace setVariable ["RHD_A3A_HQ", if (isNil "petros") then {objNull} else {petros}, true];
    true
};

missionNamespace setVariable ["RHD_A3A_BASE_READY", true, true];
missionNamespace setVariable [
    "RHD_A3A_BASE_VERSION",
    missionNamespace getVariable ["A3A_serverVersion", "unknown"],
    true
];
missionNamespace setVariable ["RHD_A3A_BASE_STARTED", true, true];
missionNamespace setVariable ["RHD_A3A_ZONE_MARKERS", [], true];
missionNamespace setVariable [
    "RHD_A3A_HQ",
    if (isNil "petros") then {objNull} else {petros},
    true
];

[] spawn {
    private _deadline = time + 30;

    waitUntil {
        sleep 1;
        (!isNil "controlsX") || {time > _deadline}
    };

    private _markers = [];

    if (!isNil "controlsX") then {
        _markers append (controlsX select {
            _x isEqualType "" && {_x in allMapMarkers}
        });
    };

    _markers append (allMapMarkers select {
        (_x find "rhd_zone_") isEqualTo 0
    });

    _markers = _markers arrayIntersect _markers;
    missionNamespace setVariable ["RHD_A3A_ZONE_MARKERS", _markers, true];
};

true
