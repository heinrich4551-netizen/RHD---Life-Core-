# RHD - LifeCore | 3DEN Module Guide

**Author: LT. Toad | Version 2.1.1**

RHD uses Eden modules as the editor-facing switches. Map placement remains in Eden; server-side prices/jobs/items/tuning remain in `core/fn_init.sqf`.

## Module 1 — RHD Life RP Systems (required)

Place:

`Systems -> RHD - LifeCore -> RHD - LifeCore | Life RP Systems`

Place exactly one.

Attributes:

```text
Economy / Shops
Jobs
Farming / Mining / Refining
Police / EMS / RP
Life RP Persistence
Ambient Life
RHD Billboard Branding
cTab Player Tablet
Life District Pressure
```

All default to ON. This module publishes the final RHD feature switches to the server/clients.

## Module 2 — Antistasi Ultimate Bridge (optional)

Place:

`Systems -> RHD - LifeCore -> RHD - LifeCore | Antistasi Ultimate Bridge (Optional)`

Use this only when Antistasi Ultimate/A3A is installed and you want RHD integrated with that campaign.

Attributes:

```text
Use Antistasi Ultimate when installed
Create Antistasi HQ Anchors
Enable Antistasi Terrain Adapter
```

The bridge detects A3A at runtime. With no A3A installed it becomes a harmless standalone gate. With A3A installed but the bridge omitted, RHD deliberately remains standalone instead of blocking mission startup.

## Map conventions

Use these marker prefixes:

```text
rhd_shop_<name>
rhd_bank_<name>
rhd_fuel_<name>
rhd_farm_<resource>_<name>
rhd_mine_<resource>_<name>
rhd_refine_<resource>_<name>
rhd_zone_<name>
rhd_jail_<name>
```

Do not put map coordinates into SQF configuration.

## Vehicle/equipment shops

Dynamic shops read the active Arma configuration. Public vehicles and public equipment classes from loaded addons can be included automatically.

Vehicle purchases have two spawn paths:

```text
A3A active -> A3A safeVehicleSpawn
A3A absent -> base-game safe-position fallback
```

This keeps vehicle shops functional in both supported RHD modes.

## Strategic ownership

In Antistasi mode:

```text
A3A owns campaign strategic state.
RHD owns Life RP state.
```

RHD does not replace A3A save/load, garrisons, strategic control or other campaign systems.

## Editor rules

Do not edit `mission.sqm` by hand.

Do not copy addon PBOs into the mission.

Do not copy third-party PBOs into the repository.

Use `core/fn_init.sqf` for gameplay configuration and Eden for all map placement.
