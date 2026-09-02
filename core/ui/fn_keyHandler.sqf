params ["_display", "_key", "_shift", "_ctrl", "_alt"];
if (_key isEqualTo 117) then {[] call RHD_fnc_openMenu; true} else {
    if (_key isEqualTo 118) then {createDialog "RHD_F7"; [] call RHD_fnc_refresh; true} else {
        if (_key isEqualTo 119) then {[] call RHD_fnc_shopOpen; true} else {false}
    }
};
