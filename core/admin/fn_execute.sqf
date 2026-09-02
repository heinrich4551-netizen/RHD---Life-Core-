if (!isServer) exitWith {};
params ["_adminOwner", "_targetNetId", "_action", ["_value", ""], ["_selection", ""]];
private _admins = missionNamespace getVariable ["RHD_ADMIN_UIDS", []];
private _admin = allPlayers select {owner _x isEqualTo _adminOwner};
if (_admin isEqualTo [] || {(getPlayerUID (_admin select 0)) isEqualTo ""} || {!((getPlayerUID (_admin select 0)) in _admins)}) exitWith {};
_admin = _admin select 0;
private _target = objectFromNetId _targetNetId;
if (isNull _target && {_action in ["setTime","setWeather","announce"]}) then {_target = _admin};

switch (_action) do {
    case "info": {
        private _msg = format ["%1 | UID %2 | Job %3 | Cash $%4 | Bank $%5", name _target, getPlayerUID _target, _target getVariable ["RHD_JOB","civ"], _target getVariable ["RHD_CASH",0], _target getVariable ["RHD_BANK",0]];
        [_msg,"info"] remoteExecCall ["RHD_fnc_notify", _adminOwner];
    };
    case "heal": { if (!isNull _target && {alive _target}) then {_target setDamage 0; _target setVariable ["ACE_isUnconscious", false, true]; ["Player restored.","success"] remoteExecCall ["RHD_fnc_notify", _adminOwner];}; };
    case "kill": { if (!isNull _target && {alive _target}) then {_target setDamage 1;}; };
    case "freeze": { if (!isNull _target) then {_target setVariable ["RHD_ADMIN_FROZEN", !(_target getVariable ["RHD_ADMIN_FROZEN",false]), true]; [_target getVariable ["RHD_ADMIN_FROZEN",false]] remoteExecCall ["RHD_fnc_adminFreeze", owner _target];}; };
    case "tpTo": { if (!isNull _target) then {_admin setPosATL (getPosATL _target);}; };
    case "tpHere": { if (!isNull _target) then {_target setPosATL (getPosATL _admin);}; };
    case "setCash": { if (!isNull _target) then {_target setVariable ["RHD_CASH", (parseNumber _value) max 0 min 100000000, true];}; };
    case "setBank": { if (!isNull _target) then {_target setVariable ["RHD_BANK", (parseNumber _value) max 0 min 100000000, true];}; };
    case "giveItem": { if (!isNull _target) then {[_target, _selection, ((parseNumber _value) floor) max 1 min 1000] call RHD_fnc_addItem;}; };
    case "setJob": { if (!isNull _target) then {[_target, _selection] call RHD_fnc_setJob;}; };
    case "repair": { private _veh = if (!isNull _target && {vehicle _target != _target}) then {vehicle _target} else {vehicle _admin}; if (!isNull _veh && {_veh != _admin} && {_veh isKindOf "LandVehicle" || _veh isKindOf "Air" || _veh isKindOf "Ship"}) then {_veh setDamage 0;}; };
    case "refuel": { private _veh = if (!isNull _target && {vehicle _target != _target}) then {vehicle _target} else {vehicle _admin}; if (!isNull _veh && {_veh != _admin}) then {_veh setFuel 1;}; };
    case "spawnVehicle": { private _class = _value; if (_class isEqualType "" && {_class != ""} && {isClass (configFile >> "CfgVehicles" >> _class)}) then {private _veh = createVehicle [_class, getPosATL _admin, [], 6, "NONE"]; _veh setDir getDir _admin; _veh setFuel 1;}; };
    case "deleteVehicle": { private _veh = if (!isNull _target && {vehicle _target != _target}) then {vehicle _target} else {objNull}; if (!isNull _veh) then {deleteVehicle _veh;}; };
    case "setTime": { private _h = (parseNumber _value) max 0 min 23; private _m = floor (((parseNumber _value) - floor (parseNumber _value)) * 60) max 0 min 59; skipTime 0; setDate [2035,6,15,_h,_m]; };
    case "setWeather": { private _w = (parseNumber _value) max 0 min 1; 0 setOvercast _w; 0 setRain (_w max 0 min 1); 0 setFog (_w max 0 min 1); forceWeatherChange; };
    case "spectate": { if (!isNull _target) then {[ _target ] remoteExecCall ["RHD_fnc_adminSpectate", _adminOwner];}; };
    case "announce": { if (_value isEqualType "" && {_value != ""}) then {[_value,"info"] remoteExecCall ["RHD_fnc_notify", -2];}; };
};
