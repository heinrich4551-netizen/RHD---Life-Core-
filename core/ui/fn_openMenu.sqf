disableSerialization;
createDialog "RHD_F6";
private _d = findDisplay 7600;
private _info = _d displayCtrl 7603;
private _theme = profileNamespace getVariable ["RHD_UI_THEME", 0];
private _palette = switch (_theme) do {
    case 1: {[[0.09,0.09,0.11,0.97],[0.18,0.18,0.22,1],[0.80,0.84,0.90,1],[0.35,0.65,0.95,1],"TABLET SLATE"]};
    case 2: {[[0.02,0.05,0.03,0.96],[0.05,0.16,0.08,1],[0.72,0.95,0.76,1],[0.38,0.85,0.48,1],"MINIMAL OPS"]};
    default {[[0,0,0,0.86],[0.10,0.46,0.62,1],[0.93,0.95,0.97,1],[0.18,0.72,0.92,1],"CLASSIC LIFE"]};
};
(_d displayCtrl 7601) ctrlSetBackgroundColor (_palette select 0);
(_d displayCtrl 7602) ctrlSetBackgroundColor (_palette select 1);
(_d displayCtrl 7602) ctrlSetTextColor (_palette select 2);
_info ctrlSetTextColor (_palette select 2);
{(_d displayCtrl _x) ctrlSetBackgroundColor (_palette select 1); (_d displayCtrl _x) ctrlSetTextColor (_palette select 2);} forEach [7604,7605,7606,7607];
(_d displayCtrl 7608) ctrlSetText format ["UI STYLE: %1", _palette select 4];
(_d displayCtrl 7608) ctrlSetTextColor (_palette select 3);

private _job = player getVariable ["RHD_JOB", "civ"];
private _inv = player getVariable ["RHD_INV", createHashMap];
private _items = missionNamespace getVariable ["RHD_ITEMS", createHashMap];
private _lines = [];
_lines pushBack format ["<t size='1.25'><b>%1</b></t>", name player];
_lines pushBack format ["<t color='#BFD7EA'>Job</t>  %1", _job];
_lines pushBack format ["<t color='#BFD7EA'>Cash</t>  $%1", player getVariable ["RHD_CASH", 0]];
_lines pushBack format ["<t color='#BFD7EA'>Bank</t>  $%1", player getVariable ["RHD_BANK", 0]];
_lines pushBack format ["<t color='#BFD7EA'>Status</t>  %1", if (player getVariable ["RHD_JAILED", false]) then {"JAILED"} else {"ACTIVE"}];
_lines pushBack "";
_lines pushBack "<t size='1.10'><b>INVENTORY</b></t>";
private _keys = keys _inv;
_keys sort true;
if (_keys isEqualTo []) then {
    _lines pushBack "<t color='#888888'>No items carried.</t>";
} else {
    {
        private _count = _inv getOrDefault [_x, 0];
        if (_count > 0) then {
            private _def = _items getOrDefault [_x, []];
            private _label = if (_def isEqualTo []) then {_x} else {_def select 0};
            _lines pushBack format ["%1  x%2", _label, _count];
        };
    } forEach _keys;
};
_info ctrlSetStructuredText parseText (_lines joinString "<br/>");
true
