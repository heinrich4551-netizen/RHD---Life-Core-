# RHD - LifeCore

**Arma 3 Life RP + Antistasi Ultimate | Author: LT. Toad | Version 2.2.2**

RHD - LifeCore is packaged for Steam Workshop and the Arma 3 Launcher. The published profile requires CBA_A3, cTab+, Antistasi Ultimate, and FPV Drone Crocus Enhanced for the integrated FPV compatibility PBO.

## Plug-and-play package

### Direct repository download

**[Download the latest @RHD-Life-Core package](https://github.com/heinrich4551-netizen/RHD---Life-Core-/releases/download/latest/RHD-Life-Core-Launcher-Package.zip)**

This link points to the latest verified GitHub release asset. Extract the ZIP and use the included `@RHD-Life-Core` folder as a Local Mod in Arma 3 Launcher.

The repository also keeps the same build as a GitHub Actions artifact under **RHD-LifeCore-Launcher-Package** for CI/build inspection.

The package contains the complete `@RHD-Life-Core` folder with the compiled addon PBOs, bundled `RHD_LifeCore.Altis` multiplayer mission, launcher metadata, branding, documentation, and installation instructions.

For the bundled Altis scenario, no 3DEN setup is required. Extract `@RHD-Life-Core`, import that folder into Arma 3 Launcher as a Local Mod, enable the required Workshop dependencies plus RHD - LifeCore, and launch `RHD_LifeCore.Altis`.

## Required Workshop dependencies

| Addon | Workshop ID | Required |
|---|---:|---|
| CBA_A3 | `450814997` | **Yes** |
| cTab+ | `2262006564` | **Yes** |
| Antistasi Ultimate | `3020755032` | **Yes** |
| FPV Drone Crocus Enhanced | Not published in the supplied upstream repository | **Yes for FPV integration** |
| ACE3 | — | No; optional |

The RHD FPV compatibility PBO declares `BOT_FPV_Enhanced` as a required addon. The upstream FPV provider in turn declares `ArmaFPV_Data`, so the provider's own dependencies must also be installed.

The exact Steam Workshop ID for FPV Drone Crocus Enhanced is intentionally not guessed because it is not present in the supplied upstream repository. Use the provider's current official Workshop/distribution listing.

The main RHD addon declares:

```cpp
requiredAddons[] = {"cba_main", "ctab_core", "A3A_core"};
```

## What is included

The packaged mod contains RHD Life RP player state, cash/banking, jobs/salaries, farming/mining/refining, the virtual market, vehicle/equipment shops, police/EMS RP, crime/heat, ambient life, cTab tablet pages, UID-gated administration, RHD clothing, the Antistasi Ultimate bridge, and FPV Crocus Enhanced compatibility.

The FPV compatibility layer imports the provider's public HD/TI Crocus variants into the RHD vehicle/equipment ecosystem, supplies stable pricing, exposes F6/F7/F8-facing catalog/spawn functions, and routes FPV vehicle spawning through the existing RHD Antistasi-safe vehicle spawn bridge. It does not replace the provider's `BOT_*` functions or duplicate its P3D/PAA assets.

ACE3 is not a hard dependency; its interactions are enabled only when ACE3 is present.

## Source layout

`addons/` is the MOD source and is compiled into `@RHD-LifeCore/addons/`.

`addons/rhd_fpv_compat/` contains the RHD bridge for `PlayerBotPro/FPV-Drone-Crocus-Enhanced`.

`FPV_CROCUS_INTEGRATION.md` documents the FPV/Antistasi architecture and dependency boundary.

`mission-template/RHD_LifeCore.TEMPLATE/` is the 3DEN source template for custom terrain missions.

`mission-template/RHD_LifeCore.TEMPLATE/mission.sqm` is the bundled Altis scenario seed used to build `RHD_LifeCore.Altis.pbo`.

## Local installation

1. Install CBA_A3, cTab+, Antistasi Ultimate, and FPV Drone Crocus Enhanced from their official distributions.
2. Download **[RHD-LifeCore-Launcher-Package.zip](https://github.com/heinrich4551-netizen/RHD---Life-Core-/releases/download/latest/RHD-LifeCore-Launcher-Package.zip)**.
3. Extract it without changing the `@RHD-Life-Core` folder name.
4. Put `@RHD-Life-Core` beside the Arma 3 installation.
5. In Arma 3 Launcher, add `@RHD-Life-Core` as a Local Mod.
6. Enable CBA_A3, cTab+, Antistasi Ultimate, FPV Drone Crocus Enhanced and RHD - LifeCore.
7. Start the included `RHD_LifeCore.Altis` scenario from Multiplayer.

## Dedicated server

Load the same `@RHD-Life-Core` mod and the same required Workshop dependencies on the server and clients. The bundled mission source is also included under `@RHD-Life-Core/mpmissions/RHD_LifeCore.Altis/` and the packed scenario is included as `RHD_LifeCore.Altis.pbo` for deployment.

## Custom 3DEN missions

Use `mission-template/RHD_LifeCore.TEMPLATE/` as the starting point for another terrain. The RHD location resolver is terrain-agnostic and consumes Antistasi Ultimate campaign state when available rather than depending on Altis-only coordinates.

## Workshop publishing

Publish only the `@RHD-Life-Core` folder as the RHD Workshop item. Steam Workshop dependency relationships are configured in the Workshop publishing UI; mark CBA_A3, cTab+, Antistasi Ultimate, and FPV Drone Crocus Enhanced as required for this integrated build. Do not redistribute their PBOs. ACE3 remains optional.
