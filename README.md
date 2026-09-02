# RHD - LifeCore

**Arma 3 Life RP + Antistasi Ultimate | Author: LT. Toad | Version 2.2.0**

RHD - LifeCore is packaged for Steam Workshop and the Arma 3 Launcher. The published profile requires CBA_A3, cTab+, and Antistasi Ultimate.

## Plug-and-play package

The repository automatically builds a single Launcher-ready archive named **RHD-LifeCore-Launcher-Package.zip**. Inside it is the complete `@RHD-LifeCore` folder with the compiled addon PBOs, bundled `RHD_LifeCore.Altis.pbo`, launcher metadata, branding, documentation, and installation instructions.

For the bundled Altis scenario, no 3DEN setup is required. Extract `@RHD-LifeCore`, import that folder into Arma 3 Launcher as a Local Mod, enable the three required Workshop dependencies plus RHD - LifeCore, and launch `RHD_LifeCore.Altis`.

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

1. Download the GitHub Actions artifact **RHD-LifeCore-Launcher-Package**.
2. Extract it without changing the `@RHD-LifeCore` folder name.
3. Put `@RHD-LifeCore` beside the Arma 3 installation.
4. In Arma 3 Launcher, add `@RHD-LifeCore` as a Local Mod.
5. Enable CBA_A3, cTab+, Antistasi Ultimate and RHD - LifeCore.
6. Start the included `RHD_LifeCore.Altis` scenario.

## Dedicated server

Load the same `@RHD-LifeCore` mod and the same three required Workshop dependencies on the server and clients. The bundled mission is under `@RHD-LifeCore/Missions/` and is selected as the mission to host; it is not placed in the `addons` directory.

## Custom 3DEN missions

Use `mission-template/RHD_LifeCore.TEMPLATE/` as the starting point for another terrain. Place one RHD Life RP Systems module, one RHD Antistasi Ultimate Bridge module, and the RHD map markers appropriate to the terrain, then pack the mission separately.

## Workshop publishing

Publish only the `@RHD-LifeCore` folder as the RHD Workshop item. Steam Workshop dependency relationships are configured in the Workshop publishing UI; mark CBA_A3, cTab+, and Antistasi Ultimate as required. Do not redistribute their PBOs. ACE3 remains optional.
