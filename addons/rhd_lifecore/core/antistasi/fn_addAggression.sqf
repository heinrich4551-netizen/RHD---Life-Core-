/*
    RHD - LifeCore | Antistasi Aggression Bridge
    Author: LT. Toad

    Adds criminal-pressure consequences to the Antistasi campaign AI system.

    Usage:
        [5] call RHD_fnc_antistasiAddAggression;

    RHD amount is deliberately translated into a small Occupant aggression hit.
    This keeps normal Life RP crime meaningful without overwhelming Antistasi's
    balance system.
*/

params [["_amount", 0, [0]], ["_minutes", 10, [0]]];

if (!isServer) exitWith {false};
if (!_amount isEqualType 0 || {!finite _amount}) exitWith {false};
if (_amount <= 0) exitWith {false};

if (!missionNamespace getVariable ["RHD_A3A_BASE_READY", false]) exitWith {false};
if (isNil "A3A_fnc_addAggression") exitWith {false};
if (isNil "Occupants") exitWith {false};

private _aggro = (_amount * missionNamespace getVariable ["RHD_A3A_CRIME_AGGRESSION_MULTIPLIER", 0.5]) max 0;
private _duration = (_minutes max 1) min 120;

[Occupants, _aggro, _duration] call A3A_fnc_addAggression;
true
