# RHD - LifeCore | FPV Crocus Enhanced Integration

## Source

`PlayerBotPro/FPV-Drone-Crocus-Enhanced` (`test` branch):
https://github.com/PlayerBotPro/FPV-Drone-Crocus-Enhanced/tree/test

The provider's config declares `ArmaFPV_Data` as its required addon and
provides the Crocus HD/TI vehicle classes plus FPV throwable magazines. The
provider also supplies its own `BOT_*` functions and event-handler overrides.

RHD consumes those public classes rather than replacing the provider's
implementation.

## Compatibility design

### No namespace collision

The RHD compatibility PBO uses only `RHD_*` names. The provider continues to
own `BOT_fnc_fpv_deploy`, `BOT_fnc_fpv_handleDamage`, `BOT_fnc_fpv_killedEH`
and `BOT_fnc_fpv_onDestroy`.

### RHD economy

RHD's existing vehicle catalogue scans loaded `CfgVehicles` classes, so the
public Crocus variants are automatically eligible for the vehicle shop.
RHD's equipment catalogue similarly sees the provider's public magazines.
The compatibility layer adds stable price overrides for these classes.

### Antistasi Ultimate

RHD already routes vehicle purchases through `RHD_fnc_antistasiSpawnVehicle`.
When RHD is in Antistasi mode and `A3A_fnc_safeVehicleSpawn` is available, that
function is used; otherwise the existing RHD safe-position fallback is used.
The FPV helper uses that same bridge, so there is no second vehicle-spawn
system competing with Antistasi Ultimate.

### Menu integration

The compatibility layer provides `RHD_fnc_fpvGetCatalog` for F6/F7/F8 menu
population and `RHD_fnc_fpvSpawn` for server-authoritative deployment.

## Dependencies

Hard dependencies for the FPV compatibility PBO:

- `rhd_lifecore`
- `BOT_FPV_Enhanced`
- CBA_A3 and cTab+ through the main RHD package
- Antistasi Ultimate for the intended campaign mode
- `ArmaFPV_Data` through the FPV provider

The exact Steam Workshop ID for FPV Crocus Enhanced is not published in the
provided upstream repository, so this project intentionally does not invent
an ID. Use the provider's current official Workshop/distribution listing.

## Asset/licensing boundary

No P3D/PAA/binary FPV assets are copied into RHD by this compatibility layer.
The upstream provider remains the asset owner/provider and must be installed
alongside RHD.
