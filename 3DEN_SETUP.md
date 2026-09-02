# RHD - LifeCore — 3DEN Setup

**Author: LT. Toad**

RHD - LifeCore is assembled in Eden. Antistasi Ultimate supplies the strategic campaign; the RHD Life module supplies the RP systems that sit around it.

## STEP 1 — Load the RHD addon

Build/install `@RHD-LifeCore` so the `rhd_lifecore.pbo` addon is loaded with:

- Arma 3
- Antistasi Ultimate
- CBA_A3
- ACE3
- cTab+

The RHD addon is a dependency of the mission and provides the custom Eden modules.

## STEP 2 — Place the Antistasi Base module

In 3DEN:

`Systems -> RHD - LifeCore -> RHD - LifeCore | Antistasi Ultimate Base`

Place exactly one at your desired campaign start / HQ location.

Recommended attributes:

- Start Antistasi Campaign = **ON**
- Create Safe HQ Anchors = **ON**
- Generic Terrain Fallback = **ON**

This module starts `A3A_fnc_initServer` after creating the small host-mission anchors required by the A3A campaign. The Antistasi engine then handles campaign saves, strategic zones, faction control, garrisons, patrols, QRFs, attacks, aggression, enemy resources, HQ/Petros, arsenal and campaign background loops.

## STEP 3 — Place the Life RP Systems module

In 3DEN:

`Systems -> RHD - LifeCore -> RHD - LifeCore | Life RP Systems`

Place exactly one module anywhere on the map.

Recommended attributes:

- Economy / Shops = **ON**
- Jobs = **ON**
- Farming / Mining / Refining = **ON**
- Police / EMS / RP = **ON**
- Life RP Persistence = **ON**
- Ambient Life = **ON**
- RHD Billboard Branding = **ON**
- cTab Player Tablet = **ON**
- Life District Pressure = **ON**

This module is the editor switch for RHD systems that do not belong to Antistasi.

## STEP 4 — Place map locations in Eden

RHD uses markers for locations so the same scripts work across terrains. Use these names:

### Shops

```text
rhd_shop_<name>
```

Example:

```text
rhd_shop_kavala
rhd_shop_harbor
rhd_shop_industrial
```

### Banks

```text
rhd_bank_<name>
```

### Fuel stations

```text
rhd_fuel_<name>
```

### Farming

```text
rhd_farm_apples_<name>
rhd_farm_cannabis_<name>
rhd_farm_coca_<name>
rhd_farm_corn_<name>
rhd_farm_grapes_<name>
rhd_farm_peaches_<name>
```

### Mining

```text
rhd_mine_iron_<name>
rhd_mine_copper_<name>
rhd_mine_gold_<name>
rhd_mine_diamond_<name>
rhd_mine_oil_<name>
```

### Refineries

```text
rhd_refine_iron_<name>
rhd_refine_copper_<name>
rhd_refine_gold_<name>
rhd_refine_oil_<name>
```

### Districts

```text
rhd_zone_<name>
```

These are RHD civilian pressure areas. A3A still owns strategic campaign control.

### Jail

```text
rhd_jail_<name>
```

## Shops — base game and dependency-mod content

The RHD tablet generates two separate physical-content stores:

- **VEHICLES** — every public land/air/ship vehicle class found in the active Arma 3 config.
- **EQUIPMENT** — public weapons, magazines, gear, goggles and backpacks in the active Arma 3 config.

Because the catalogue scans the loaded config at runtime, you do not need to edit a class list every time another supported Workshop addon is enabled. The same shop code sees base-game classes, Antistasi classes and public classes from other loaded mods.

Vehicle purchases are validated server-side and spawned through the RHD/A3A safe-spawn bridge.

## Branding / billboards

Place normal `Land_Billboard_F` objects in Eden. When RHD Billboard Branding is enabled, the server automatically applies the supplied RHD - LifeCore artwork.

To intentionally leave one billboard unchanged, put this object variable on that billboard:

```sqf
rhd_billboard_skip = true
```

## Terrain support

The preferred source of terrain data is Antistasi Ultimate's own `A3A/mapInfo/<world>` configuration.

When a terrain has no A3A mapInfo entry, the RHD Base module can install a generic adapter before campaign startup. The generic adapter provides broad Arma object detection for common world services and a generic climate entry so the mission has a graceful fallback.

This is designed to make the framework terrain-agnostic, but a community terrain can still have unique airports, building layouts, factions or infrastructure that require a proper A3A mapInfo definition. Validate those terrain-specific features in-game.

## What not to edit

Do not edit `mission.sqm` by hand.

Do not put terrain coordinates into `core/fn_init.sqf`.

Do not modify the Antistasi source submodule for normal mission setup.

Do not copy Antistasi/ACE3/CBA/cTab PBOs into the RHD mission folder.

## Beginner configuration

Use `core/fn_init.sqf` for:

- Admin Steam64 IDs
- Job salaries
- RHD virtual market prices
- Refining recipes
- Gatherables
- Dynamic shop price multipliers
- Exact shop price overrides
- Antistasi/RHD crime tuning
- RHD district pressure tuning

## Final Eden checklist

You should have:

1. One Antistasi Ultimate Base module.
2. One RHD Life RP Systems module.
3. A player start/respawn location suitable for the campaign.
4. One or more `rhd_shop_*` markers.
5. Optional `rhd_bank_*`, `rhd_fuel_*`, farm, mine and refinery markers.
6. One or more `rhd_zone_*` districts.
7. Optional jail markers.
8. Optional `Land_Billboard_F` branding objects.
9. The intended Antistasi world/faction setup required by the selected campaign template.

Save in Eden. The saved mission becomes the mission that runs on the dedicated server.
