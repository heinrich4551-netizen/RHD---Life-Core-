disableSerialization;
createDialog "RHD_F6";
private _d = findDisplay 7600;
private _info = _d displayCtrl 7603;
private _job = player getVariable ["RHD_JOB", "civ"];
private _inv = player getVariable ["RHD_INV", createHashMap];
private _lines = [];
_lines pushBack format ["<t size='1.2'>Name:</t> %1", name player];
_lines pushBack format ["Cash: $%1", player getVariable ["RHD_CASH", 0]];
_lines pushBack format ["Bank: $%1", player getVariable ["RHD_BANK", 0]];
_lines pushBack format ["Job: %1", _job];
_lines pushBack format ["Jailed: %1", player getVariable ["RHD_JAILED", false]];
_lines pushBack "";
_lines pushBack "Inventory:";
{
    _lines pushBack format ["%1: %2", _x, _inv get _x];
} forEach (keys _inv);
_info ctrlSetStructuredText parseText (_lines joinString "<br/>");
true
