/*
    RHD - LifeCore | cTab Page Controller
    Author: LT. Toad

    Each case below is one page in the RHD player tablet.
    The CAMPAIGN page is the direct player-facing view of the Antistasi Ultimate
    world that powers RHD - LifeCore.
*/

disableSerialization;

private _page = param [0, "STATUS"];
private _display = uiNamespace getVariable ["cTab_Tablet_dlg", displayNull];
private _ctrls = uiNamespace getVariable ["RHD_CTAB_CTRLS", []];

// Current RHD tablet uses 15 controls.
if (isNull _display || {count _ctrls < 15}) exitWith {false};

// Control order is defined in fn_ctabBuild.sqf.
private _content = _ctrls select 8;
private _list = _ctrls select 9;
private _primary = _ctrls select 10;
private _secondary = _ctrls select 11;
private _status = _ctrls select 12;

lbClear _list;
_primary ctrlShow false;
_secondary ctrlShow false;

switch (_page) do {

    // ------------------------------------------------------------------------
    // STATUS / INVENTORY
    // ------------------------------------------------------------------------
    case "STATUS": {
        private _a3a = call RHD_fnc_getStatus;
        private _baseState = if (_a3a param [0, false]) then {"ONLINE"} else {"WAITING"};

        _content ctrlSetStructuredText parseText format [
            "<t size='1.25'><b>%1</b></t><br/><br/><t color='#BFD7EA'>JOB</t>  %2<br/><t color='#BFD7EA'>CASH</t>  $%3<br/><t color='#BFD7EA'>BANK</t>  $%4<br/><t color='#BFD7EA'>STATUS</t>  %5<br/><t color='#BFD7EA'>A3A WORLD</t>  %6<br/><br/><t size='1.1'><b>INVENTORY</b></t><br/>%7",
            name player,
            player getVariable ["RHD_JOB", "civ"],
            player getVariable ["RHD_CASH", 0],
            player getVariable ["RHD_BANK", 0],
            if (player getVariable ["RHD_JAILED", false]) then {"JAILED"} else {"ACTIVE"},
            _baseState,
            call {
                private _inv = player getVariable ["RHD_INV", createHashMap];
                private _items = missionNamespace getVariable ["RHD_ITEMS", createHashMap];
                private _keys = keys _inv;
                _keys sort true;
                private _out = [];

                {
                    private _n = _inv getOrDefault [_x, 0];
                    if (_n > 0) then {
                        private _d = _items getOrDefault [_x, []];
                        _out pushBack format ["%1 x%2", if (_d isEqualTo []) then {_x} else {_d select 0}, _n];
                    };
                } forEach _keys;

                if (_out isEqualTo []) then {
                    "<t color='#888888'>No items carried.</t>"
                } else {
                    _out joinString "<br/>"
                }
            }
        ];
        _status ctrlSetText "RHD - LIFECORE | LIVE PLAYER DATA";
    };

    // ------------------------------------------------------------------------
    // JOBS
    // ------------------------------------------------------------------------
    case "JOBS": {
        _content ctrlSetStructuredText parseText "<t size='1.15'><b>EMPLOYMENT</b></t><br/>Select an available job below.";

        private _jobs = missionNamespace getVariable ["RHD_JOBS", createHashMap];
        private _keys = keys _jobs;
        _keys sort true;

        {
            private _d = _jobs get _x;
            private _i = _list lbAdd format ["%1 | $%2 / min", _d select 0, _d select 1];
            _list lbSetData [_i, _x];
        } forEach _keys;

        _primary ctrlSetText "SELECT JOB";
        _primary ctrlShow true;
        _primary ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_startWork"];

        _secondary ctrlSetText "STOP JOB";
        _secondary ctrlShow true;
        _secondary ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_stopWork"];

        _status ctrlSetText format ["CURRENT JOB: %1", player getVariable ["RHD_JOB", "civ"]];
    };

    // ------------------------------------------------------------------------
    // SHOP
    // ------------------------------------------------------------------------
    case "SHOP": {
        _content ctrlSetStructuredText parseText "<t size='1.15'><b>RHD MARKET</b></t><br/>Purchase and sell registered RHD items at a marked shop.";

        private _items = missionNamespace getVariable ["RHD_ITEMS", createHashMap];
        private _keys = keys _items;
        _keys sort true;

        {
            private _d = _items get _x;
            private _i = _list lbAdd format ["%1 | BUY $%2 | SELL $%3", _d select 0, _d select 1, _d select 2];
            _list lbSetData [_i, _x];
        } forEach _keys;

        _primary ctrlSetText "BUY x1";
        _primary ctrlShow true;
        _primary ctrlSetEventHandler ["ButtonClick", "[lbCurSel 9808] call RHD_fnc_requestBuy"];

        _secondary ctrlSetText "SELL x1";
        _secondary ctrlShow true;
        _secondary ctrlSetEventHandler ["ButtonClick", "[lbCurSel 9808] call RHD_fnc_requestSell"];

        _status ctrlSetText "SHOP ACCESS: be within 15m of an rhd_shop_* marker";
    };

    // ------------------------------------------------------------------------
    // BANKING
    // ------------------------------------------------------------------------
    case "BANK": {
        _content ctrlSetStructuredText parseText format [
            "<t size='1.15'><b>BANKING</b></t><br/><br/>Cash: $%1<br/>Bank: $%2<br/><br/>Transactions are server-authoritative.",
            player getVariable ["RHD_CASH", 0],
            player getVariable ["RHD_BANK", 0]
        ];

        _primary ctrlSetText "DEPOSIT $100";
        _primary ctrlShow true;
        _primary ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_requestDeposit"];

        _secondary ctrlSetText "WITHDRAW $100";
        _secondary ctrlShow true;
        _secondary ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_requestWithdraw"];

        _status ctrlSetText "BANKING: use at a marked rhd_bank_* location";
    };

    // ------------------------------------------------------------------------
    // SERVICES
    // ------------------------------------------------------------------------
    case "SERVICES": {
        _content ctrlSetStructuredText parseText "<t size='1.15'><b>PUBLIC SERVICES</b></t><br/>Available actions depend on your job and nearby RHD locations.";

        _primary ctrlSetText "GATHER";
        _primary ctrlShow true;
        _primary ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_requestGather"];

        _secondary ctrlSetText "REFINE";
        _secondary ctrlShow true;
        _secondary ctrlSetEventHandler ["ButtonClick", "[] call RHD_fnc_requestRefine"];

        _status ctrlSetText "Use ACE interactions for contextual medical and vehicle actions.";
    };

    // ------------------------------------------------------------------------
    // DISTRICTS / WORLD PRESSURE
    // ------------------------------------------------------------------------
    case "DISTRICTS": {
        _content ctrlSetStructuredText parseText "<t size='1.15'><b>DISTRICT PRESSURE</b></t><br/>Districts react to Life RP criminal pressure and the wider Antistasi campaign state.<br/>A3A strategic markers and optional rhd_zone_* markers are supported.";

        private _zones = missionNamespace getVariable ["RHD_A3A_ZONE_MARKERS", []];

        if (_zones isEqualTo []) then {
            _zones = allMapMarkers select {(_x find "rhd_zone_") isEqualTo 0};
        };

        if (_zones isEqualTo []) then {
            private _idx = _list lbAdd "No A3A/RHD districts are available yet.";
            _list lbSetColor [_idx, [0.70,0.70,0.70,1]];
        } else {
            {
                private _marker = _x;
                private _data = [_marker] call RHD_fnc_getZoneStatus;

                if (_data isEqualTo []) then {
                    private _label = markerText _marker;
                    if (_label isEqualTo "") then {_label = _marker};
                    private _idx = _list lbAdd format ["%1 | INITIALIZING", _label];
                    _list lbSetData [_idx, _marker];
                } else {
                    private _name = _data select 0;
                    private _control = _data select 1;
                    private _heat = _data select 2;
                    private _supply = _data select 3;
                    private _police = _data select 5;

                    private _idx = _list lbAdd format [
                        "%1 | %2 | HEAT %3 | SUPPLY %4 | POLICE %5",
                        _name,
                        _control,
                        _heat,
                        _supply,
                        _police
                    ];
                    _list lbSetData [_idx, _marker];
                };
            } forEach _zones;
        };

        _status ctrlSetText "RHD - LIFECORE: district status follows the A3A-backed world.";
    };

    // ------------------------------------------------------------------------
    // ANTISTASI CAMPAIGN STATUS
    // ------------------------------------------------------------------------
    case "CAMPAIGN": {
        private _a3a = call RHD_fnc_getStatus;
        private _ready = _a3a param [0, false];
        private _version = _a3a param [1, "unknown"];
        private _startup = _a3a param [2, "unknown"];
        private _aggression = _a3a param [3, 0];
        private _hq = _a3a param [4, objNull];
        private _zones = _a3a param [5, []];
        private _attack = _a3a param [6, 0];
        private _defence = _a3a param [7, 0];

        private _hqText = if (isNull _hq) then {
            "Not available"
        } else {
            format ["%1m away", round (player distance2D _hq)]
        };

        _content ctrlSetStructuredText parseText format [
            "<t size='1.20'><b>ANTISTASI CAMPAIGN</b></t><br/><br/><t color='#BFD7EA'>BASE</t>  %1<br/><t color='#BFD7EA'>VERSION</t>  %2<br/><t color='#BFD7EA'>STARTUP</t>  %3<br/><t color='#BFD7EA'>AGGRESSION</t>  %4<br/><t color='#BFD7EA'>A3A ZONES</t>  %5<br/><t color='#BFD7EA'>ATTACK RESOURCES</t>  %6<br/><t color='#BFD7EA'>DEFENCE RESOURCES</t>  %7<br/><t color='#BFD7EA'>HQ / PETROS</t>  %8<br/><br/><t size='1.05'>RHD - LifeCore uses the Antistasi campaign for the strategic world, while LifeCore supplies the civilian economy, jobs and RP systems.</t>",
            if (_ready) then {"ONLINE"} else {"WAITING"},
            _version,
            _startup,
            _aggression,
            count _zones,
            _attack,
            _defence,
            _hqText
        ];

        _status ctrlSetText "ANTISTASI BASE: strategic campaign state supplied by A3A.";
    };
};

true
