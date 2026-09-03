disableSerialization;
[] call RHD_fnc_ctabClear;
if (!isNil "cTabIfOpen") then {
    [] call cTab_fnc_close;
} else {
    private _d = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];
    if (!isNull _d) then {closeDialog 0};
};
true
