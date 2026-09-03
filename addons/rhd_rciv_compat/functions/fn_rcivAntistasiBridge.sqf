/*
    RHD - LifeCore | RCiv compatibility bridge

    This addon does not redistribute or modify the RCiv PBO. It integrates the
    separately installed RCiv addon with the RHD Antistasi Ultimate profile.

    Antistasi is authoritative for campaign units and AI. The bridge therefore:
      - detects A3A_core before touching RCiv settings;
      - disables RCiv's independent civilian spawner in Antistasi;
      - keeps RCiv's all-AI explosion override disabled;
      - blacklists A3A-managed civilian units from RCiv's ambient brain;
      - deactivates any RCiv civilian brain that slipped through before the
        Antistasi state became available.
*/

if (!isServer) exitWith {};

private _deadline = diag_tickTime + 60;
waitUntil {
    sleep 0.1;
    diag_tickTime >= _deadline || {!isNil "RCIV_enabled"}
};

if (isNil "RCIV_enabled") exitWith {
    diag_log "[RHD-RCIV] RCiv not detected; compatibility bridge remains idle.";
};

private _a3aDetected = isClass (configFile >> "CfgPatches" >> "A3A_core")
    || {missionNamespace getVariable ["RHD_A3A_INSTALLED", false]};

if (!_a3aDetected) exitWith {
    diag_log "[RHD-RCIV] A3A_core not detected; RCiv bridge will not change standalone behavior.";
};

// Antistasi owns civilian spawning/routines in the published RHD profile.
missionNamespace setVariable ["RCIV_spawnerEnabled", false];
missionNamespace setVariable ["RCIV_allAIReaction", false];
missionNamespace setVariable ["RCIV_makeCivsTargetable", false];
missionNamespace setVariable ["RCIV_antistasiCompat", true];

private _isA3AManagedCiv = {
    params ["_unit"];
    if (isNull _unit || {!alive _unit} || {side _unit != civilian} || {isPlayer _unit}) exitWith {false};
    if (_unit getVariable ["rciv_blacklist", false]) exitWith {true};
    if (_unit getVariable ["intemploCivil", false]) exitWith {true};
    if (_unit getVariable ["intempeloTraitor", false]) exitWith {true};
    if (_unit getVariable ["A3A_intask", false]) exitWith {true};
    if (_unit getVariable ["A3A_isCivPatrol", false]) exitWith {true};
    if (_unit getVariable ["A3A_isFleeing", false]) exitWith {true};
    false
};

private _syncBlacklist = {
    params ["_unit"];
    if !([_unit] call _isA3AManagedCiv) exitWith {};

    _unit setVariable ["rciv_blacklist", true, true];

    if (!isNil "RCIV_activeUnits") then {
        if (_unit getVariable ["rciv_active", false]) then {
            _unit setVariable ["rciv_active", false, true];
            RCIV_activeUnits = RCIV_activeUnits - [_unit];
        };
    };
};

{
    [_x] call _syncBlacklist;
} forEach allUnits;

[{
    if (isNil "RCIV_enabled") exitWith {};
    {
        [_x] call _syncBlacklist;
    } forEach allUnits;
}, 15, []] call CBA_fnc_addPerFrameHandler;

diag_log "[RHD-RCIV] RCiv Antistasi Ultimate bridge active: spawner disabled, A3A civilian exclusions enforced.";
