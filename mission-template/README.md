# RHD - LifeCore | Copy-Ready Mission Template

This folder is the complete mission-side source, kept separate from the addon source under `addons/`.

## Copy

Copy the entire folder:

```text
mission-template/RHD_LifeCore.TEMPLATE/
```

Rename the destination folder to the Arma 3 mission naming convention:

```text
<YourMissionName>.<TerrainName>
```

Example:

```text
RHD_LifeCore.Altis
```

Do not add `.pbo` while editing in Eden.

## Contents

```text
RHD_LifeCore.TEMPLATE/
├─ description.ext
├─ initServer.sqf
├─ initPlayerLocal.sqf
├─ onPlayerRespawn.sqf
├─ core/
└─ assets/
```

The only file that Eden generates later is `mission.sqm`. Save the mission from Eden after placing the modules and markers.

## Mod side

The separate mod is built from:

```text
addons/rhd_lifecore/
addons/rhd_clothing/
```

The built output belongs in:

```text
@RHD-LifeCore/addons/
```

Never place the mod PBOs inside the mission folder.

See the repository root `README.md` for the complete setup, configuration and server deployment procedure.
