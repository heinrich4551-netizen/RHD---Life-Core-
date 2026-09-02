disableSerialization;
private _page = param [0, "STATUS"];
private _display = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];
private _ctrls = uiNamespace getVariable ["RHD_CTAB_CTRLS", []];
if (isNull _display || {count _ctrls < 13}) exitWith {false};

private _content = _ctrls select 7;
private _list = _ctrls select 8;
private _primary = _ctrls select 9;
private _secondary = _ctrls select 10;
private _status = _ctrls select 11;

lbClear _list;
_primary ctrlShow false;
_secondary ctrlShow false;

switch (_page) do {
    case "STATUS": {
        _content ctrlSetStructuredText parseText format [
            "<t size='1.25'><b>%1</b></t><br/><br/><t color='#BFD7EA'>JOB</t>  %2<br/><t color='#BFD7EA'>CASH</t>  $%3<br/><t color='#BFD7EA'>BANK</t>  $%4<br/><t color='#BFD7EA'>STATUS</t>  %5<br/><br/><t size='1.1'><b>INVENTORY</b></t><br/>%6",
            name player,
            player getVariable ["RHD_JOB", "civ"],
            player getVariable ["RHD_CASH", 0],
            player getVariable ["RHD_BANK", 0],
            if (player getVariable ["RHD_JAILED", false]) then {"JAILED"} else {"ACTIVE"},
            call {
                private _inv = player getVariable ["RHD_INV", createHashMap];
                private _items = missionNamespace getVariable ["RHD_ITEMS", createHashMap];
                private _keys = keys _inv; _keys sort true;
                private _out = [];
                {private _n = _inv getOrDefault [_x, 0]; if (_n > 0) then {private _d = _items getOrDefault [_x, []]; _out pushBack format ["%1 x%2", if (_d isEqualTo []) then {_x} else {_d select 0}, _n];};} forEach _keys;
                if (_out isEqualTo []) then {"<t color='#888888'>No items carried.</t>"} else {_out joinString "<br/>"}
            }
        ];
        _status ctrlSetText "RHD STATUS | LIVE PLAYER DATA";
    };
    case "JOBS": {
        _content ctrlSetStructuredText parseText "<t size='1.15'><b>EMPLOYMENT</b></t><br/>Select an available job below.";
        private _jobs = missionNamespace getVariable ["RHD_JOBS", createHashMap];
        private _keys = keys _jobs; _keys sort true;
        {private _d = _jobs get _x; private _i = _list lbAdd format ["%1 | $%2 / min", _d select 0, _d select 1]; _list lbSetData [_i, _x];} forEach _keys;
        _primary ctrlSetText "SELECT JOB";
        _primary ctrlShow true;
        _primary ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_startWork"];
        _secondary ctrlSetText "STOP JOB";
        _secondary ctrlShow true;
        _secondary ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_stopWork"];
        _status ctrlSetText format ["CURRENT JOB: %1", player getVariable ["RHD_JOB", "civ"]];
    };
    case "SHOP": {
        _content ctrlSetStructuredText parseText "<t size='1.15'><b>RHD MARKET</b></t><br/>Purchase and sell registered RHD items at a marked shop.";
        private _items = missionNamespace getVariable ["RHD_ITEMS", createHashMap];
        private _keys = keys _items; _keys sort true;
        {private _d = _items get _x; private _i = _list lbAdd format ["%1 | BUY $%2 | SELL $%3", _d select 0, _d select 1, _d select 2]; _list lbSetData [_i, _x];} forEach _keys;
        _primary ctrlSetText "BUY x1";
        _primary ctrlShow true;
        _primary ctrlSetEventHandler ["ButtonClick", "[lbCurSel 9808] call RHD_fnc_requestBuy"];
        _secondary ctrlSetText "SELL x1";
        _secondary ctrlShow true;
        _secondary ctrlSetEventHandler ["ButtonClick", "[lbCurSel 9808] call RHD_fnc_requestSell"];
        _status ctrlSetText "SHOP ACCESS: must be within 15m of an rhd_shop_* marker";
    };
    case "BANK": {
        _content ctrlSetStructuredText parseText format ["<t size='1.15'><b>BANKING</b></t><br/><br/>Cash: $%1<br/>Bank: $%2<br/><br/>Transactions are server-authoritative.", player getVariable ["RHD_CASH",0], player getVariable ["RHD_BANK",0]];
        _primary ctrlSetText "DEPOSIT $100";
        _primary ctrlShow true;
        _primary ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_requestDeposit"];
        _secondary ctrlSetText "WITHDRAW $100";
        _secondary ctrlShow true;
        _secondary ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_requestWithdraw"];
        _status ctrlSetText "BANKING: use at a marked RHD bank location";
    };
    case "SERVICES": {
        _content ctrlSetStructuredText parseText "<t size='1.15'><b>PUBLIC SERVICES</b></t><br/>Available actions depend on your job and nearby RHD locations.";
        _primary ctrlSetText "GATHER";
        _primary ctrlShow true;
        _primary ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_requestGather"];
        _secondary ctrlSetText "REFINE";
        _secondary ctrlShow true;
        _secondary ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_requestRefine"];
        _status ctrlSetText "Use the ACE interaction menu for contextual vehicle / medical actions.";
    };
};

true
