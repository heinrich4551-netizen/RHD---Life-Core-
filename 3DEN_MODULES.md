# RHD - LifeCore | 3DEN Module Guide

**Author: LT. Toad**

RHD is intentionally built so a mission editor can assemble the framework in Eden without editing coordinates into SQF.

## Module 1: Antistasi Ultimate Base

Place:

`Systems -> RHD - LifeCore -> RHD - LifeCore | Antistasi Ultimate Base`

Place one module at the desired campaign start / HQ area.

Recommended settings:

- **Start Antistasi Campaign:** ON
- **Create Safe HQ Anchors:** ON
- **Enable Generic Terrain Fallback:** ON

This module starts the installed Antistasi Ultimate campaign engine and creates the small host-mission anchors required by the A3A server initializer. A3A then owns campaign save/load, strategic control, garrisons, aggression, resources, attacks, HQ/Petros and the rest of the strategic simulation.

## Module 2: RHD Life RP Systems

Place:

`Systems -> RHD - LifeCore -> RHD - LifeCore | Life RP Systems`

Recommended settings:

- **Economy / Shops:** ON
- **Jobs:** ON
- **Farming / Mining / Refining:** ON
- **Police / EMS / RP:** ON
- **Life RP Persistence:** ON
- **Ambient Life:** ON
- **RHD Billboard Branding:** ON
- **cTab Player Tablet:** ON
- **Life District Pressure:** ON

This is the single editor switch for RHD systems that do not belong to Antistasi.

## Map setup stays in Eden

Use the existing RHD marker conventions or your own Eden placement workflow:

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

No terrain coordinates are hard-coded into the gameplay configuration.

## Vehicle and equipment shops

The RHD tablet scans the Arma 3 configuration at runtime. Public vehicles and equipment from the active modset are included automatically.

That includes:

- Arma 3 base-game vehicles and equipment.
- Antistasi Ultimate vehicles/equipment that are loaded and public.
- ACE3/CBA/cTab-supported public content, where those addons expose usable public classes.
- The four additional Workshop integration items, once they are actually loaded in the server/client modset.

The RHD server recalculates the price before every purchase. Vehicle purchases are spawned through the A3A-safe spawn bridge.

## Terrain compatibility

Antistasi Ultimate remains the strategic foundation. A3A's own mapInfo data is preferred whenever the terrain provides it. The RHD base module can install a generic fallback for terrains without an A3A mapInfo entry.

A generic fallback is not a guarantee that every map-specific Antistasi behavior can be perfect on every community terrain. Terrain-specific A3A content such as unusual airports, custom factions, special building layouts and map-specific markers should still be validated in-game.

## Editor rule

Do not edit `mission.sqm` by hand.

Do not put map coordinates in `core/fn_init.sqf`.

Use Eden for map placement and the RHD configuration file for values such as prices, pay rates, admins and tuning.
