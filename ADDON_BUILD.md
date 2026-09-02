# RHD - LifeCore | Addon Build Guide

**Author: LT. Toad**

RHD - LifeCore now contains a real Arma 3 addon component for the 3DEN modules and Antistasi integration metadata.

## Source layout

```text
RHD---Life-Core-
├── addons/
│   └── rhd_lifecore/
│       ├── $PBOPREFIX$
│       ├── config.cpp
│       └── functions/
│           └── modules/
│               ├── fn_moduleAntistasiBase.sqf
│               ├── fn_moduleLifeCore.sqf
│               └── fn_terrainFallback.sqf
├── assets/branding/
├── core/
├── description.ext
├── initServer.sqf
└── initPlayerLocal.sqf
```

## Build the PBO

Build only this source directory into a PBO:

```text
addons/rhd_lifecore/
```

The PBO should be named:

```text
rhd_lifecore.pbo
```

and installed as:

```text
@RHD-LifeCore/addons/rhd_lifecore.pbo
```

The `mod.cpp` file and branding assets belong at the mod root so the launcher can display the RHD identity.

## Required addon dependencies

The RHD addon declares these Arma addon dependencies:

```text
A3A_core
cba_main
ace_main
ctab_core
```

Therefore the corresponding Workshop mods must be loaded before RHD - LifeCore.

## Mission files

The `description.ext`, `initServer.sqf`, `initPlayerLocal.sqf` and `core/` folders are mission-side source. They belong in the actual Eden-created mission folder.

The RHD addon PBO supplies the 3DEN modules and addon-level integration support.

## Why this split exists

Antistasi Ultimate is a full campaign framework. RHD should not copy its complete PBO set into every LifeCore mission.

Instead:

- Antistasi Ultimate stays installed as its normal mod.
- RHD depends on the A3A addon API.
- The mission contains RHD's Life RP logic.
- The RHD addon supplies 3DEN setup modules.

This keeps updates cleaner and prevents the RHD repository from silently forking the complete upstream Antistasi distribution.

## Development checkout

The repository includes a Git submodule pointing to the Antistasi Ultimate development source for auditing and integration work.

```bash
git clone --recurse-submodules https://github.com/heinrich4551-netizen/RHD---Life-Core-.git
git submodule update --init --recursive
```

Do not copy the upstream APL-ND components into RHD while building a release.
