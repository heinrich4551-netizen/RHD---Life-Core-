params ["_display", "_key", "_shift", "_ctrl", "_alt"];
if (_key isEqualTo 117) exitWith {[] call RHD_fnc_openMenu; true};
if (_key isEqualTo 118) exitWith {[] call RHD_fnc_ctabOpen; ["JOBS"] call RHD_fnc_ctabPage; true};
if (_key isEqualTo 119) exitWith {[] call RHD_fnc_ctabOpen; ["SHOP"] call RHD_fnc_ctabPage; true};
false
