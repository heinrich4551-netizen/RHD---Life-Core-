params ["_target"];
if (!hasInterface || {isNull _target}) exitWith {};
missionNamespace setVariable ["RHD_SPECTATE_TARGET", _target];
missionNamespace setVariable ["RHD_SPECTATE_CAMERA", nil];
private _cam = "camera" camCreate (getPosATL player);
_cam cameraEffect ["INTERNAL", "BACK"];
_cam camSetTarget _target;
_cam camSetRelPos [0, -8, 3];
_cam camCommit 0;
missionNamespace setVariable ["RHD_SPECTATE_CAMERA", _cam];
["Spectating target. Press F12 to return.", "info"] call RHD_fnc_notify;
private _eh = (findDisplay 46) displayAddEventHandler ["KeyDown", {
    params ["_display", "_key"];
    if (_key isEqualTo 88) then {
        private _cam = missionNamespace getVariable ["RHD_SPECTATE_CAMERA", objNull];
        if (!isNull _cam) then {camDestroy _cam;};
        missionNamespace setVariable ["RHD_SPECTATE_CAMERA", nil];
        missionNamespace setVariable ["RHD_SPECTATE_TARGET", nil];
        true
    } else {false};
}];
missionNamespace setVariable ["RHD_SPECTATE_EH", _eh];
true
