# RHD - LifeCore — Steam Workshop & Dependency Guide

**Author: LT. Toad**

## Hard external dependencies

RHD - LifeCore has the following required external Arma 3 Workshop dependencies for the integrated build:

| Component | Steam Workshop ID | Role |
|---|---:|---|
| CBA_A3 | `450814997` | Shared Arma 3 framework used by the RHD integration layer |
| cTab+ | `2262006564` | RHD player tablet interface |
| Antistasi Ultimate | `3020755032` | Antistasi campaign/strategic-state integration |
| FPV Drone Crocus Enhanced | Not published in the supplied upstream repository | Provider for the Crocus FPV vehicles, throwable magazines and FPV behavior |

Arma 3 itself is, of course, required because RHD is an Arma 3 addon/mission framework.

The exact Steam Workshop ID for FPV Drone Crocus Enhanced is not present in the supplied upstream repository, so this project does not invent one. Use the provider's current official Workshop/distribution listing. The provider also declares `ArmaFPV_Data`, which must be available through its own distribution/dependency chain.

## Optional enhancements

- ACE3: enables ACE Self Actions and contextual EMS/admin interactions.
- Other equipment/vehicle mods: automatically contribute public Arma configuration classes to the RHD shop/catalogue when installed and loaded.

The FPV Crocus Enhanced provider is required specifically because the integrated `rhd_fpv_compat` PBO declares `BOT_FPV_Enhanced`. This keeps the RHD core bridge deterministic and prevents missing `BOT_*` classes/functions at runtime.

## Architecture rule

The main RHD addon declares:

```cpp
requiredAddons[] = {"cba_main", "ctab_core", "A3A_core"};
```

The FPV compatibility PBO declares:

```cpp
requiredAddons[] = {"rhd_lifecore", "BOT_FPV_Enhanced"};
```

Antistasi Ultimate remains the authoritative strategic engine. RHD does not replace A3A campaign logic. FPV spawning is routed through the existing RHD vehicle spawn bridge, which uses `A3A_fnc_safeVehicleSpawn` when the Antistasi runtime is ready.

## FPV Crocus Enhanced integration

Source: https://github.com/PlayerBotPro/FPV-Drone-Crocus-Enhanced/tree/test

RHD integrates the provider's public HD/TI Crocus vehicle variants and FPV throwable magazines into the RHD economy and menu layer. The provider continues to own its models, textures, ammo, deployment code and `BOT_*` functions.

RHD exposes:

```sqf
["VEHICLES"] call RHD_fnc_fpvGetCatalog;
["EQUIPMENT"] call RHD_fnc_fpvGetCatalog;
[player, "BOT_vehicle_B_FPV_AT_HD"] remoteExecCall ["RHD_fnc_fpvSpawn", 2];
```

These functions are intended for the F6/F7/F8 menu layer and do not overwrite the provider's namespace.

## cTab integration

The player tablet is built on cTab+'s tablet display and uses RHD-owned controls/pages. The core does not copy cTab source into RHD.

## CBA integration

CBA is treated as the shared framework dependency. RHD does not embed CBA files or replace CBA functionality.

## Recommended load order

```text
Arma 3
  -> CBA_A3
  -> cTab+
  -> Antistasi Ultimate
  -> FPV Drone Crocus Enhanced
  -> RHD - LifeCore
```

The exact launcher order can vary, but all hard dependencies must be loaded before the corresponding RHD PBOs.

## Mission vs external mods

RHD does not redistribute CBA_A3, cTab+, ACE3, Antistasi Ultimate or FPV Drone Crocus Enhanced PBOs/assets. Install those through Steam Workshop or their normal distribution channel.

## Licensing

See `THIRD_PARTY_NOTICES.md` and the files under `LICENSES/` for the project's third-party licensing boundary.
