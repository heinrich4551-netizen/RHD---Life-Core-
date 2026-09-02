/* RHD refuel service */
if (!isServer) exitWith {};
params ["_vehicle", "_marker"];
private _caller = remoteExecutedOwner;
private _unit = objNull;
{if (owner _x isEqualTo _caller) exitWith {_unit = _x};} forEach allPlayers;
if (isNull _unit || {isNull _vehicle} || {!alive _vehicle}) exitWith {};
if ((driver _vehicle) != _unit) exitWith {};
if (_marker isEqualTo "" || {!((toLower _marker) find "rhd_fuel_") isEqualTo 0}) exitWith {};
if (_unit distance2D (getMarkerPos _marker) > 18) exitWith {};

private _fuelNow = fuel _vehicle;
if (_fuelNow >= 0.99) exitWith {[_unit, "Your tank is already full.", "info"] remoteExecCall ["RHD_fnc_notify", owner _unit];};
private _unitsNeeded = ceil ((1 - _fuelNow) * 100);
private _cost = (_unitsNeeded * 5) min 750;
private _cash = _unit getVariable ["RHD_CASH", 0];
if (_cash < _cost) exitWith {[_unit, format ["Refuel costs $%1. You need more cash.", _cost], "error"] remoteExecCall ["RHD_fnc_notify", owner _unit];};

_unit setVariable ["RHD_CASH", _cash - _cost, true];
_vehicle setFuel 1;
[_unit, format ["Vehicle refueled for $%1.", _cost], "success"] remoteExecCall ["RHD_fnc_notify", owner _unit];
