# RHD - LifeCore | Steam Workshop Package

This package is the publish/import distribution of RHD - LifeCore.

## Hard dependencies

- CBA_A3 — `450814997`
- cTab+ — `2262006564`
- Antistasi Ultimate — `3020755032`

ACE3 is optional.

## Included scenario

The package contains:

`Missions/RHD_LifeCore.Altis.pbo`

The Altis scenario is pre-populated with RHD modules, shops, banks, fuel/service points, farming, mining, refining, districts, jail and RHD branded billboards.

## Launcher use

Copy the generated `@RHD-LifeCore` directory into the Arma 3 directory and enable it in the Arma 3 Launcher. Enable the three required external Workshop dependencies listed above before starting the included Altis scenario.

## Steam Workshop publishing

Upload the generated `@RHD-LifeCore` directory as a Steam Workshop mod. The supplied `meta.cpp` declares the three hard Workshop dependencies.

Do not upload the repository source tree as the Workshop mod. The Workshop package should contain compiled PBOs plus `Missions/RHD_LifeCore.Altis.pbo`, the mod metadata, and the RHD branding asset.

## Editing

The included scenario is an Eden-generated-style source under `missions/RHD_LifeCore.Altis/`. Copy it to your Arma 3 `Missions`/editor workflow when creating a customized variant. Do not edit the compiled PBO directly.
