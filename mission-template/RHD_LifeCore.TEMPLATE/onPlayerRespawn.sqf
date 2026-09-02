params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
{
    private _value = _oldUnit getVariable [_x, nil];
    if (!isNil "_value") then {_newUnit setVariable [_x, _value, true];};
} forEach ["RHD_UID", "RHD_CASH", "RHD_BANK", "RHD_JOB", "RHD_INV", "RHD_LICENSES", "RHD_JAILED"];
_newUnit setVariable ["RHD_WORKING", false, true];
[] call RHD_fnc_initActions;
