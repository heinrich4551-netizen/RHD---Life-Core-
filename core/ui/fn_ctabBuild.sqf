disableSerialization;
private _display = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];
if (isNull _display) exitWith {false};

private _old = uiNamespace getVariable ["RHD_CTAB_CTRLS", []];
{if !isNull _x then {ctrlDelete _x};} forEach _old;

private _bg = _display ctrlCreate ["RHD_CTAB_Background", 9800];
private _title = _display ctrlCreate ["RHD_CTAB_Title", 9801];
private _dash = _display ctrlCreate ["RHD_CTAB_Nav", 9802];
private _jobs = _display ctrlCreate ["RHD_CTAB_Nav", 9803];
private _shop = _display ctrlCreate ["RHD_CTAB_Nav", 9804];
private _bank = _display ctrlCreate ["RHD_CTAB_Nav", 9805];
private _svc = _display ctrlCreate ["RHD_CTAB_Nav", 9806];
private _content = _display ctrlCreate ["RHD_CTAB_Content", 9807];
private _list = _display ctrlCreate ["RHD_CTAB_List", 9808];
private _primary = _display ctrlCreate ["RHD_CTAB_Button", 9809];
private _secondary = _display ctrlCreate ["RHD_CTAB_Button", 9810];
private _status = _display ctrlCreate ["RHD_CTAB_Status", 9811];
private _close = _display ctrlCreate ["RHD_CTAB_Button", 9812];

private _ctrls = [_bg,_title,_dash,_jobs,_shop,_bank,_svc,_content,_list,_primary,_secondary,_status,_close];
uiNamespace setVariable ["RHD_CTAB_CTRLS", _ctrls];

_bg ctrlSetPosition [0.265 * safezoneW + safezoneX, 0.20 * safezoneH + safezoneY, 0.47 * safezoneW, 0.61 * safezoneH];
_bg ctrlCommit 0;
_title ctrlSetPosition [0.28 * safezoneW + safezoneX, 0.215 * safezoneH + safezoneY, 0.44 * safezoneW, 0.045 * safezoneH];
_title ctrlSetText "RHD LIFE | COMMAND TABLET";
_title ctrlCommit 0;

private _nav = [[0.28,"STATUS"],[0.365,"JOBS"],[0.45,"SHOP"],[0.535,"BANK"],[0.62,"SERVICES"]];
{private _c = _ctrls select (2 + _forEachIndex); _c ctrlSetPosition [(_x select 0) * safezoneW + safezoneX, 0.27 * safezoneH + safezoneY, 0.075 * safezoneW, 0.04 * safezoneH]; _c ctrlSetText (_x select 1); _c ctrlCommit 0;} forEach _nav;

_content ctrlSetPosition [0.28 * safezoneW + safezoneX, 0.325 * safezoneH + safezoneY, 0.44 * safezoneW, 0.39 * safezoneH];
_content ctrlCommit 0;
_list ctrlSetPosition [0.30 * safezoneW + safezoneX, 0.37 * safezoneH + safezoneY, 0.40 * safezoneW, 0.28 * safezoneH];
_list ctrlCommit 0;
_primary ctrlSetPosition [0.30 * safezoneW + safezoneX, 0.665 * safezoneH + safezoneY, 0.12 * safezoneW, 0.045 * safezoneH];
_primary ctrlCommit 0;
_secondary ctrlSetPosition [0.435 * safezoneW + safezoneX, 0.665 * safezoneH + safezoneY, 0.12 * safezoneW, 0.045 * safezoneH];
_secondary ctrlCommit 0;
_close ctrlSetPosition [0.585 * safezoneW + safezoneX, 0.665 * safezoneH + safezoneY, 0.095 * safezoneW, 0.045 * safezoneH];
_close ctrlSetText "CLOSE";
_close ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_ctabClose"];
_close ctrlCommit 0;
_status ctrlSetPosition [0.30 * safezoneW + safezoneX, 0.735 * safezoneH + safezoneY, 0.40 * safezoneW, 0.035 * safezoneH];
_status ctrlCommit 0;

_dash ctrlSetEventHandler ["ButtonClick", "[\"STATUS\"] call RHD_fnc_ctabPage"];
_jobs ctrlSetEventHandler ["ButtonClick", "[\"JOBS\"] call RHD_fnc_ctabPage"];
_shop ctrlSetEventHandler ["ButtonClick", "[\"SHOP\"] call RHD_fnc_ctabPage"];
_bank ctrlSetEventHandler ["ButtonClick", "[\"BANK\"] call RHD_fnc_ctabPage"];
_svc ctrlSetEventHandler ["ButtonClick", "[\"SERVICES\"] call RHD_fnc_ctabPage"];

[_display] displayAddEventHandler ["Unload", {[] call RHD_fnc_ctabClear}];
["STATUS"] call RHD_fnc_ctabPage;
true
