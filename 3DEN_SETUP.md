# RHD - LifeCore | 3DEN Setup

**Author: LT. Toad | Version 2.1.1**

RHD is a mission-side Life RP framework backed by the `@RHD-LifeCore` addon. Keep the two parts separate:

```text
MOD:     @RHD-LifeCore/addons/*.pbo
MISSION: description.ext + initServer.sqf + initPlayerLocal.sqf + core/ + assets/ + Eden-generated mission.sqm
```

## 1. Load the mod

Enable these on server and clients:

```text
CBA_A3
cTab+
@RHD-LifeCore
```

Antistasi Ultimate and ACE3 are optional.

## 2. Place the required RHD module

In 3DEN:

`Systems -> RHD - LifeCore -> RHD - LifeCore | Life RP Systems`

Place exactly one.

Recommended attributes:

```text
Economy / Shops                 ON
Jobs                            ON
Farming / Mining / Refining     ON
Police / EMS / RP               ON
Life RP Persistence             ON
Ambient Life                    ON
RHD Billboard Branding          ON
cTab Player Tablet              ON
Life District Pressure          ON
```

This module controls all RHD Life RP systems. The mission does not silently start those systems when the module is missing.

## 3. Optional Antistasi integration

Only when Antistasi Ultimate is installed and you want RHD connected to the A3A campaign, place:

`Systems -> RHD - LifeCore -> RHD - LifeCore | Antistasi Ultimate Bridge (Optional)`

Place one bridge at your desired campaign/HQ anchor point.

Recommended attributes:

```text
Use Antistasi Ultimate when installed   ON
Create Antistasi HQ Anchors              ON
Enable Antistasi Terrain Adapter        ON
```

The bridge is optional. Do not place it in a standalone RHD mission unless you also intend to use A3A.

When the bridge is absent, RHD deliberately starts in `STANDALONE` mode. This prevents an installed-but-unused A3A addon from blocking RHD startup.

## 4. Map locations

Use Eden markers rather than SQF coordinates.

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

Examples:

```text
rhd_shop_city
rhd_bank_city
rhd_fuel_city
rhd_farm_apples_north
rhd_farm_cannabis_south
rhd_farm_coca_hills
rhd_farm_corn_fields
rhd_farm_grapes_vineyard
rhd_farm_peaches_orchard
rhd_mine_iron_quarry
rhd_mine_copper_quarry
rhd_mine_gold_quarry
rhd_mine_diamond_quarry
rhd_mine_oil_oilsands
rhd_refine_iron_factory
rhd_refine_copper_factory
rhd_refine_gold_factory
rhd_refine_oil_refinery
rhd_zone_city
rhd_jail_city
```

The default virtual resources are defined in `core/fn_init.sqf` and can be renamed/extended there.

## 5. Shops

RHD scans the active Arma configuration at runtime.

**Vehicles:** public `LandVehicle`, `Air` and `Ship` classes.

**Equipment:** public weapons, magazines, uniforms/gear, goggles and backpacks.

The generated catalog can therefore include base Arma content plus content from any loaded public addon. The server revalidates the class, price and player distance before a purchase.

Vehicle spawning works in both modes:

```text
ANTISTASI  -> A3A safe vehicle spawning when available
STANDALONE -> base-game safe-position fallback
```

## 6. Farming / mining / refining

Place the corresponding resource markers in Eden. RHD virtual inventory is defined in `core/fn_init.sqf`.

Default refining:

```text
iron_ore   -> iron    | 2 ore -> 1 iron
copper_ore -> copper  | 2 ore -> 1 copper
gold_ore   -> gold    | 3 ore -> 1 gold
oil_sand   -> oil     | 2 sand -> 1 oil
```

## 7. District pressure

Place `rhd_zone_<name>` markers wherever civilian crime/heat should be simulated.

RHD settings control radius, heat growth/decay and update rate. Antistasi strategic zones remain A3A-owned when A3A is active.

## 8. Billboards

Place normal `Land_Billboard_F` objects.

With RHD Billboard Branding enabled, RHD applies:

```text
assets/branding/RHDLifeCore.jpg
```

Skip one object with:

```sqf
this setVariable ["rhd_billboard_skip", true, true];
```

## 9. Configuration file

Edit only:

```text
core/fn_init.sqf
```

Use it for:

```text
admin Steam64 IDs
job display names and pay rates
virtual item values/categories
gather quantities
refining recipes
vehicle/equipment price multipliers
maximum generated prices
exact class price overrides
optional A3A integration tuning
RHD district pressure tuning
persistence save interval
optional bridge startup timing
```

Do not put map coordinates in this file.

## 10. Eden save workflow

1. Place the RHD Life module.
2. Optionally place the Antistasi bridge.
3. Place all RHD markers and billboard objects.
4. Confirm the marker names exactly match the prefixes above.
5. Save the mission in Eden.
6. Eden creates/updates `mission.sqm`.
7. Package the saved mission as `RHD_LifeCore.<world>.pbo` for the dedicated server.

## 11. Rules

Do not hand-edit `mission.sqm`.

Do not put RHD PBOs into the mission folder.

Do not copy A3A, ACE3, CBA_A3 or cTab+ PBOs into RHD.

Do not hard-code terrain coordinates into RHD SQF.

Use the repository `README.md` for the complete one-page deployment and configuration reference.
