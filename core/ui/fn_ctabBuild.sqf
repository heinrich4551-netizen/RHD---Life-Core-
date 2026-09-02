/*
    RHD - LifeCore | cTab Tablet Builder
    Author: LT. Toad

    Creates the RHD player interface on cTab's tablet display.
    cTab remains the external tablet host; all RHD controls are mission-owned.

    PLAYER PAGES
    ------------
    STATUS | JOBS | SHOP | BANK | SERVICES | DISTRICTS | CAMPAIGN

    The CAMPAIGN page reads Antistasi Ultimate state so players can see the
    strategic world that their Life RP exists inside.
*/

disableSerialization;

private _display = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];
if (isNull _display) exitWith {false};

// Remove any RHD tablet controls left by a previous refresh.
private _old = uiNamespace getVariable ["RHD_CTAB_CTRLS", []];
{if !isNull _x then {ctrlDelete _x};} forEach _old;

// ---------------------------------------------------------------------------
// CREATE CONTROLS
// ---------------------------------------------------------------------------
private _bg = _display ctrlCreate ["RHD_CTAB_Background", 9800];
private _title = _display ctrlCreate ["RHD_CTAB_Title", 9801];
private _dash = _display ctrlCreate ["RHD_CTAB_Nav", 9802];
private _jobs = _display ctrlCreate ["RHD_CTAB_Nav", 9803];
private _shop = _display ctrlCreate ["RHD_CTAB_Nav", 9804];
private _bank = _display ctrlCreate ["RHD_CTAB_Nav", 9805];
private _svc = _display ctrlCreate ["RHD_CTAB_Nav", 9806];
private _districts = _display ctrlCreate ["RHD_CTAB_Nav", 9813];
private _content = _display ctrlCreate ["RHD_CTAB_Content", 9807];
private _list = _display ctrlCreate ["RHD_CTAB_List", 9808];
private _primary = _display ctrlCreate ["RHD_CTAB_Button", 9809];
private _secondary = _display ctrlCreate ["RHD_CTAB_Button", 9810];
private _status = _display ctrlCreate ["RHD_CTAB_Status", 9811];
private _close = _display ctrlCreate ["RHD_CTAB_Button", 9812];
private _campaign = _display ctrlCreate ["RHD_CTAB_Nav", 9814];

// Keep every RHD control in one array so cleanup is reliable.
// NOTE: content/list/buttons retain their original indexes for compatibility.
private _ctrls = [
    _bg,_title,_dash,_jobs,_shop,_bank,_svc,_districts,
    _content,_list,_primary,_secondary,_status,_close,_campaign
];
uiNamespace setVariable ["RHD_CTAB_CTRLS", _ctrls];

// ---------------------------------------------------------------------------
// RHD PLAYER THEME
// ---------------------------------------------------------------------------
private _theme = profileNamespace getVariable ["RHD_UI_THEME", 0];
private _palette = switch (_theme) do {
    case 1: {
        [[0.09,0.09,0.11,0.97],[0.18,0.18,0.22,1],[0.35,0.65,0.95,1],[0.80,0.84,0.90,1]]
    };
    case 2: {
        [[0.02,0.05,0.03,0.96],[0.05,0.16,0.08,1],[0.38,0.85,0.48,1],[0.72,0.95,0.76,1]]
    };
    default {
        [[0,0,0,0.86],[0.10,0.46,0.62,1],[0.18,0.72,0.92,1],[0.93,0.95,0.97,1]]
    };
};

_bg ctrlSetBackgroundColor (_palette select 0);
_title ctrlSetBackgroundColor (_palette select 1);
_title ctrlSetTextColor (_palette select 3);
_content ctrlSetBackgroundColor (_palette select 0);
_content ctrlSetTextColor (_palette select 3);
_list ctrlSetBackgroundColor (_palette select 0);
_list ctrlSetTextColor (_palette select 3);
_status ctrlSetTextColor (_palette select 2);

{
    _x ctrlSetBackgroundColor (_palette select 1);
    _x ctrlSetTextColor (_palette select 3);
} forEach [_dash,_jobs,_shop,_bank,_svc,_districts,_primary,_secondary,_close,_campaign];

// ---------------------------------------------------------------------------
// LAYOUT
// ---------------------------------------------------------------------------
_bg ctrlSetPosition [0.265 * safezoneW + safezoneX, 0.20 * safezoneH + safezoneY, 0.47 * safezoneW, 0.61 * safezoneH];
_bg ctrlCommit 0;

_title ctrlSetPosition [0.28 * safezoneW + safezoneX, 0.215 * safezoneH + safezoneY, 0.44 * safezoneW, 0.045 * safezoneH];
_title ctrlSetText "RHD - LIFECORE | COMMAND TABLET";
_title ctrlCommit 0;

// Seven compact pages keep the player experience in one tablet.
private _nav = [
    [0.280, "STATUS"],
    [0.341, "JOBS"],
    [0.402, "SHOP"],
    [0.463, "BANK"],
    [0.524, "SERVICES"],
    [0.585, "DISTRICTS"],
    [0.652, "CAMPAIGN"]
];

{
    private _c = switch (_forEachIndex) do {
        case 0: {_dash};
        case 1: {_jobs};
        case 2: {_shop};
        case 3: {_bank};
        case 4: {_svc};
        case 5: {_districts};
        default {_campaign};
    };

    _c ctrlSetPosition [(_x select 0) * safezoneW + safezoneX, 0.27 * safezoneH + safezoneY, 0.056 * safezoneW, 0.04 * safezoneH];
    _c ctrlSetText (_x select 1);
    _c ctrlCommit 0;
} forEach _nav;

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

// ---------------------------------------------------------------------------
// PAGE NAVIGATION
// ---------------------------------------------------------------------------
_dash ctrlSetEventHandler ["ButtonClick", "[\"STATUS\"] call RHD_fnc_ctabPage"];
_jobs ctrlSetEventHandler ["ButtonClick", "[\"JOBS\"] call RHD_fnc_ctabPage"];
_shop ctrlSetEventHandler ["ButtonClick", "[\"SHOP\"] call RHD_fnc_ctabPage"];
_bank ctrlSetEventHandler ["ButtonClick", "[\"BANK\"] call RHD_fnc_ctabPage"];
_svc ctrlSetEventHandler ["ButtonClick", "[\"SERVICES\"] call RHD_fnc_ctabPage"];
_districts ctrlSetEventHandler ["ButtonClick", "[\"DISTRICTS\"] call RHD_fnc_ctabPage"];
_campaign ctrlSetEventHandler ["ButtonClick", "[\"CAMPAIGN\"] call RHD_fnc_ctabPage"];

// Clean up RHD controls when cTab closes.
[_display] displayAddEventHandler ["Unload", {[] call RHD_fnc_ctabClear}];

["STATUS"] call RHD_fnc_ctabPage;
true
