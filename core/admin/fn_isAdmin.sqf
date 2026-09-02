params [["_unit", player]];
if (isNull _unit) exitWith {false};
private _uid = getPlayerUID _unit;
_uid != "" && {_uid in (missionNamespace getVariable ["RHD_ADMIN_UIDS", []])}
