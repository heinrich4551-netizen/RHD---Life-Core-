disableSerialization;
private _ctrls = uiNamespace getVariable ["RHD_CTAB_CTRLS", []];
{if !isNull _x then {ctrlDelete _x};} forEach _ctrls;
uiNamespace setVariable ["RHD_CTAB_CTRLS", []];
true
