/* RHD - LifeCore | PLAYER ADDON RUNTIME */
if (!hasInterface) exitWith {};

[] spawn {
    private _deadline = time + 120;
    waitUntil {
        sleep 0.25;
        missionNamespace getVariable ["RHD_ANTISTASI_RUNTIME_READY", false] || {time > _deadline}
    };

    if !(missionNamespace getVariable ["RHD_ANTISTASI_RUNTIME_READY", false]) exitWith {
        diag_log "[RHD-LIFECORE] Player runtime: RHD Antistasi runtime was not ready.";
    };

    // Do not overwrite state created by another RHD mission component.
    [] call RHD_fnc_initPlayer;

    waitUntil {!isNull findDisplay 46};
    private _display = findDisplay 46;
    if (!isNull _display) then {
        _display displayAddEventHandler ["KeyDown", "_this call RHD_fnc_keyHandler"];
    };

    // ACE is optional and performs its own dependency check.
    [] call RHD_fnc_aceInit;

    // HUD is only started when the host mission exposes the RHD_HUD resource.
    // This avoids overriding Antistasi's own UI resources.
    if (isClass (missionConfigFile >> "RscTitles" >> "RHD_HUD")) then {
        [] call RHD_fnc_initHud;
    };

    ["RHD - LifeCore connected to Antistasi Ultimate.", "info"] call RHD_fnc_notify;
};
