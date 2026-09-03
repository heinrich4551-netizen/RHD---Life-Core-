# RHD - LifeCore | FPV Crocus Enhanced Compatibility

This addon integrates `PlayerBotPro/FPV-Drone-Crocus-Enhanced` with RHD - LifeCore.

## Provider

- Repository: https://github.com/PlayerBotPro/FPV-Drone-Crocus-Enhanced
- Integration target: `test` branch
- Provider addon: `BOT_FPV_Enhanced`

The provider remains responsible for the actual Crocus/FPV models, textures,
ammunition, magazines, throwable behavior and the original `BOT_*` functions.
RHD does not duplicate those binary assets.

## RHD integration

The bridge:

- exposes all public HD/TI Crocus FPV variants through RHD's dynamic vehicle shop;
- exposes the FPV throwable magazines through RHD's equipment catalogue;
- applies deterministic RHD prices through `RHD_SHOP_PRICE_OVERRIDES`;
- exposes `RHD_fnc_fpvGetCatalog` for F6/F7/F8 UI code;
- exposes `RHD_fnc_fpvSpawn` for server-authoritative FPV deployment;
- routes spawned FPVs through `RHD_fnc_antistasiSpawnVehicle`, which uses
  `A3A_fnc_safeVehicleSpawn` when RHD is in Antistasi mode and the existing
  standalone safe-spawn fallback otherwise;
- never overwrites `BOT_fnc_fpv_deploy`, `BOT_fnc_fpv_handleDamage` or the
  provider's event handlers.

## Required load order

```text
Arma 3
  -> CBA_A3
  -> cTab+
  -> Antistasi Ultimate
  -> FPV Drone Crocus Enhanced
  -> RHD - LifeCore
```

`rhd_fpv_compat` hard-requires `BOT_FPV_Enhanced`, so the FPV provider must be
installed whenever the RHD FPV compatibility PBO is loaded.

## F6/F7/F8 usage

For an RHD menu, use the returned catalog from:

```sqf
["VEHICLES"] call RHD_fnc_fpvGetCatalog;
["EQUIPMENT"] call RHD_fnc_fpvGetCatalog;
```

For server deployment:

```sqf
[player, "BOT_vehicle_B_FPV_AT_HD"] remoteExecCall ["RHD_fnc_fpvSpawn", 2];
```

The existing RHD vehicle shop also discovers these classes automatically
because its catalogue imports public `CfgVehicles` content from loaded mods.
