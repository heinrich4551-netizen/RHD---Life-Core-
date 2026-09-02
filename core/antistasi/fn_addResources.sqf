/*
    RHD - LifeCore | Antistasi Resource Bridge
    Author: LT. Toad

    Lets Life RP activities feed the Antistasi enemy economy when desired.

    Usage:
        [10, Invaders, "attack"] call RHD_fnc_antistasiAddResources;

    This is intentionally a thin adapter around A3A_fnc_addEnemyResources.
*/

params [["_amount", 0, [0]], ["_side", sideUnknown, [sideUnknown]], ["_pool", "attack", [""]]];

if (!isServer) exitWith {false};
if (!missionNamespace getVariable ["RHD_A3A_BASE_READY", false]) exitWith {false};
if (isNil "A3A_fnc_addEnemyResources") exitWith {false};
if !(_side in [Occupants, Invaders]) exitWith {false};
if !(_pool in ["attack", "defence", "legacy"]) exitWith {false};
if (!_amount isEqualType 0 || {!finite _amount}) exitWith {false};

[_amount, _side, _pool] call A3A_fnc_addEnemyResources;
true
