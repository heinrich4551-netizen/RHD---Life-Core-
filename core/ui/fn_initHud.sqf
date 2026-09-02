if (!hasInterface) exitWith {};
if (missionNamespace getVariable ["RHD_HUD_RUNNING", false]) exitWith {};
missionNamespace setVariable ["RHD_HUD_RUNNING", true, false];

waitUntil {!isNull findDisplay 46};
"RHD_HUD" cutRsc ["RHD_HUD", "PLAIN"];

[] spawn {
    disableSerialization;
    while {missionNamespace getVariable ["RHD_HUD_RUNNING", false]} do {
        private _hud = uiNamespace getVariable ["RHD_HUD_DISPLAY", displayNull];
        if (isNull _hud) then {
            "RHD_HUD" cutRsc ["RHD_HUD", "PLAIN"];
            _hud = uiNamespace getVariable ["RHD_HUD_DISPLAY", displayNull];
        };
        if (!isNull _hud) then {
            private _ctrl = _hud displayCtrl 7901;
            if (!isNull _ctrl) then {
                private _theme = profileNamespace getVariable ["RHD_UI_THEME", 0];
                private _accent = switch (_theme) do {
                    case 1: {[0.35,0.65,0.95,1]};
                    case 2: {[0.38,0.85,0.48,1]};
                    default {[0.18,0.72,0.92,1]};
                };
                _ctrl ctrlSetTextColor _accent;
                private _job = player getVariable ["RHD_JOB", "civ"];
                private _cash = player getVariable ["RHD_CASH", 0];
                private _bank = player getVariable ["RHD_BANK", 0];
                private _players = count (allPlayers select {alive _x});
                private _grid = mapGridPosition player;
                _ctrl ctrlSetText format ["RHD LIFE  |  %1  |  CASH $%2  |  BANK $%3  |  PLAYERS %4  |  GRID %5", toUpper _job, _cash, _bank, _players, _grid];
            };
        };
        sleep 2;
    };
};
true
