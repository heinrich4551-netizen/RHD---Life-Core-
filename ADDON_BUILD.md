# RHD - LifeCore | Addon Build Guide

**Author: LT. Toad**

RHD - LifeCore contains addon components for the 3DEN modules, Antistasi integration metadata, and the first RHD clothing pack.

## Source layout

```text
RHD---Life-Core-
├── addons/
│   ├── rhd_lifecore/
│   │   ├── $PBOPREFIX$
│   │   ├── config.cpp
│   │   └── functions/
│   │       └── modules/
│   │           ├── fn_moduleAntistasiBase.sqf
│   │           ├── fn_moduleLifeCore.sqf
│   │           └── fn_terrainFallback.sqf
│   └── rhd_clothing/
│       ├── $PBOPREFIX$
│       └── config.cpp
├── assets/branding/
├── core/
├── description.ext
├── initServer.sqf
└── initPlayerLocal.sqf
```

## Build the PBOs

Build the addon source directories independently:

```text
addons/rhd_lifecore/  ->  rhd_lifecore.pbo
addons/rhd_clothing/  ->  rhd_clothing.pbo
```

Install them as:

```text
@RHD-LifeCore/addons/rhd_lifecore.pbo
@RHD-LifeCore/addons/rhd_clothing.pbo
```

The `mod.cpp` file and branding assets belong at the mod root so the launcher can display the RHD identity.

## Required addon dependencies

`rhd_lifecore.pbo` declares:

```text
A3A_core
cba_main
ace_main
ctab_core
```

`rhd_clothing.pbo` declares:

```text
A3_Characters_F
rhd_lifecore
```

The clothing pack deliberately uses ArmA 3 stock uniform models and textures rather than redistributing third-party assets.

## RHD clothing design note

Arma 3's vanilla inventory has one uniform slot rather than separate top and pants slots. The first RHD clothing pass therefore exposes **top-style** and **pants-style** outfit presets built by inheriting from stock civilian uniforms.

This makes the clothing shop work immediately with the current RHD economy while keeping the addon dependency-free for 3D assets. A future true mix-and-match system will require custom upper/lower clothing geometry and corresponding P3D/config work.

The new clothing classes are public `CfgWeapons` entries, so the existing RHD equipment catalogue imports them automatically from the active game/mod configuration.

## Mission files

The `description.ext`, `initServer.sqf`, `initPlayerLocal.sqf` and `core/` folders are mission-side source. They belong in the actual Eden-created mission folder.

The RHD addon PBOs supply the 3DEN modules, clothing classes and addon-level integration support.

## Why this split exists

Antistasi Ultimate is a full campaign framework. RHD should not copy its complete PBO set into every LifeCore mission.

Instead:

- Antistasi Ultimate stays installed as its normal mod.
- RHD depends on the A3A addon API.
- The mission contains RHD's Life RP logic.
- RHD's addon PBOs supply 3DEN setup modules and optional equipment classes.

This keeps updates cleaner and prevents the RHD repository from silently forking the complete upstream Antistasi distribution.

## Development checkout

The repository includes a Git submodule pointing to the Antistasi Ultimate development source for auditing and integration work.

```bash
git clone --recurse-submodules https://github.com/heinrich4551-netizen/RHD---Life-Core-.git
git submodule update --init --recursive
```

Do not copy the upstream APL-ND components into RHD while building a release.
