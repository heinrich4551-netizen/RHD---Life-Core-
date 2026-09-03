/*
    RHD - LifeCore | FPV Crocus Enhanced bridge initialization
    Provider: PlayerBotPro/FPV-Drone-Crocus-Enhanced

    This bridge never replaces BOT_* functions. It only registers the public
    FPV classes with RHD and supplies deterministic shop pricing.
*/

if (!isServer) exitWith {};

[] spawn {
    // RHD core initialization owns the initial shop map. Wait for it instead
    // of racing core/fn_init.sqf during mission startup.
    private _deadline = time + 60;
    waitUntil {
        sleep 0.25;
        !isNil "RHD_SHOP_PRICE_OVERRIDES" || {time >= _deadline}
    };

    private _classes = [
        "BOT_vehicle_B_FPV_AT_HD", "BOT_vehicle_B_FPV_AP_HD",
        "BOT_vehicle_O_FPV_AT_HD", "BOT_vehicle_O_FPV_AP_HD",
        "BOT_vehicle_I_FPV_AT_HD", "BOT_vehicle_I_FPV_AP_HD",
        "BOT_vehicle_C_FPV_AT_HD", "BOT_vehicle_C_FPV_AP_HD",
        "BOT_vehicle_B_FPV_AT_TI", "BOT_vehicle_B_FPV_AP_TI",
        "BOT_vehicle_O_FPV_AT_TI", "BOT_vehicle_O_FPV_AP_TI",
        "BOT_vehicle_I_FPV_AT_TI", "BOT_vehicle_I_FPV_AP_TI",
        "BOT_vehicle_C_FPV_AT_TI", "BOT_vehicle_C_FPV_AP_TI"
    ];

    private _magazines = [
        "BOT_magazine_FPV_AT_LD", "BOT_magazine_FPV_AP_LD",
        "BOT_magazine_FPV_AT_HD", "BOT_magazine_FPV_AP_HD",
        "BOT_magazine_FPV_AT_TI", "BOT_magazine_FPV_AP_TI"
    ];

    private _loadedClasses = _classes select {
        isClass (configFile >> "CfgVehicles" >> _x)
    };
    private _loadedMags = _magazines select {
        isClass (configFile >> "CfgMagazines" >> _x)
    };

    missionNamespace setVariable ["RHD_FPV_INTEGRATED", true, true];
    missionNamespace setVariable ["RHD_FPV_CLASSES", _loadedClasses, true];
    missionNamespace setVariable ["RHD_FPV_MAGAZINES", _loadedMags, true];
    missionNamespace setVariable ["RHD_FPV_PROVIDER", "BOT_FPV_Enhanced", true];
    missionNamespace setVariable ["RHD_FPV_SOURCE_BRANCH", "test", true];

    // Stable prices prevent a mod's CfgVehicles cost/mass changes from making
    // FPV equipment unexpectedly free or excessively expensive.
    private _overrides = missionNamespace getVariable ["RHD_SHOP_PRICE_OVERRIDES", createHashMap];
    {
        _overrides set [_x, 18500];
    } forEach (_loadedClasses select {(_x find "_AT_") > -1});
    {
        _overrides set [_x, 14500];
    } forEach (_loadedClasses select {(_x find "_AP_") > -1});
    {
        _overrides set [_x, 3500];
    } forEach _loadedMags;

    missionNamespace setVariable ["RHD_SHOP_PRICE_OVERRIDES", _overrides, true];

    if (missionNamespace getVariable ["RHD_A3A_BASE_READY", false]) then {
        diag_log format ["[RHD][FPV] Antistasi-ready FPV integration: %1 vehicles, %2 throwable magazines.", count _loadedClasses, count _loadedMags];
    } else {
        diag_log format ["[RHD][FPV] FPV integration loaded: %1 vehicles, %2 throwable magazines. Waiting for RHD/A3A startup state.", count _loadedClasses, count _loadedMags];
    };
};
