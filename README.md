# RHD - LifeCore

**Arma 3 Life RP + Antistasi Ultimate | Author: LT. Toad | Version 2.2.2**

RHD - LifeCore is packaged for Steam Workshop and the Arma 3 Launcher. The published profile requires CBA_A3, cTab+, and Antistasi Ultimate.

## Plug-and-play package

### Direct repository download

**[Download the latest @RHD-Life-Core package](https://github.com/heinrich4551-netizen/RHD---Life-Core-/releases/download/latest/RHD-Life-Core-Launcher-Package.zip)**

This link points to the latest verified GitHub release asset. Extract the ZIP and use the included `@RHD-Life-Core` folder as a Local Mod in Arma 3 Launcher.

The repository also keeps the same build as a GitHub Actions artifact under **RHD-LifeCore-Launcher-Package** for CI/build inspection.

The package contains the complete `@RHD-Life-Core` folder with the compiled addon PBOs, bundled `RHD_LifeCore.Altis` multiplayer mission, launcher metadata, branding, documentation, and installation instructions.

For the bundled Altis scenario, no 3DEN setup is required. Extract `@RHD-Life-Core`, import that folder into Arma 3 Launcher as a Local Mod, enable the three required Workshop dependencies plus RHD - LifeCore, and launch `RHD_LifeCore.Altis`.

## Required Workshop dependencies

| Addon | Workshop ID | Required |
|---|---:|---|
| CBA_A3 | `450814997` | **Yes** |
| cTab+ | `2262006564` | **Yes** |
| Antistasi Ultimate | `3020755032` | **Yes** |
| ACE3 | — | No; optional |

The RHD addon declares:

```cpp
requiredAddons[] = {"cba_main", "ctab_core", "A3A_core"};
```

## What is included

The packaged mod contains RHD Life RP player state, cash/banking, jobs/salaries, farming/mining/refining, the virtual market, vehicle/equipment shops, police/EMS RP, crime/heat, ambient life, cTab tablet pages, UID-gated administration, RHD clothing, and the Antistasi Ultimate bridge.

ACE3 is not a hard dependency; its interactions are enabled only when ACE3 is present.

## Source layout

`addons/` is the MOD source and is compiled into `@RHD-LifeCore/addons/`.

`mission-template/RHD_LifeCore.TEMPLATE/` is the 3DEN source template for custom terrain missions.

`mission-template/RHD_LifeCore.TEMPLATE/mission.sqm` is the bundled Altis scenario seed used to build `RHD_LifeCore.Altis.pbo`.

## Local installation

1. Download **[RHD-LifeCore-Launcher-Package.zip](https://github.com/heinrich4551-netizen/RHD---Life-Core-/releases/download/latest/RHD-Life-Core-Launcher-Package.zip)**.
2. Extract it without changing the `@RHD-Life-Core` folder name.
3. Put `@RHD-Life-Core` beside the Arma 3 installation.
4. In Arma 3 Launcher, add `@RHD-Life-Core` as a Local Mod.
5. Enable CBA_A3, cTab+, Antistasi Ultimate and RHD - LifeCore.
6. Start the included `RHD_LifeCore.Altis` scenario from Multiplayer.

## Dedicated server

Load the same `@RHD-Life-Core` mod and the same three required Workshop dependencies on the server and clients. The bundled mission source is also included under `@RHD-Life-Core/mpmissions/RHD_LifeCore.Altis/` and the packed scenario is included as `RHD_LifeCore.Altis.pbo` for deployment.

## Custom 3DEN missions

Use `mission-template/RHD_LifeCore.TEMPLATE/` as the starting point for another terrain. The RHD location resolver is terrain-agnostic and consumes Antistasi Ultimate campaign state when available rather than depending on Altis-only coordinates.

## Workshop publishing

Publish only the `@RHD-Life-Core` folder as the RHD Workshop item. Steam Workshop dependency relationships are configured in the Workshop publishing UI; mark CBA_A3, cTab+, and Antistasi Ultimate as required. Do not redistribute their PBOs. ACE3 remains optional.
