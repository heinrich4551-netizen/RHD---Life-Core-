params ["_state"];
if (!hasInterface) exitWith {};
player allowDamage (!_state);
player enableSimulationGlobal (!_state);
if (_state) then {
    ["Admin freeze enabled.", "warning"] call RHD_fnc_notify;
} else {
    ["Admin freeze disabled.", "success"] call RHD_fnc_notify;
};
