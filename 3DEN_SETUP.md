# RHD - LifeCore — 3DEN Setup

**Author: LT. Toad**

This framework is terrain agnostic. Build the actual world layout in **Arma 3 Eden (3DEN)** and keep the script package the same between terrains.

## Required

Create a normal multiplayer mission in Eden, then copy the RHD mission files into that mission folder. Save the mission in Eden.

**Do not hand-edit `mission.sqm` unless you know exactly why you need to.** Eden should generate and maintain it.

## Marker rules

RHD discovers many locations by marker name. The marker's **shape, color and size are yours to choose**; RHD primarily uses the marker name and position.

### Farming

Use the `rhd_farm_` prefix.

Examples:

- `rhd_farm_apples`
- `rhd_farm_cannabis`
- `rhd_farm_coca`
- `rhd_farm_corn`
- `rhd_farm_grapes`
- `rhd_farm_peaches`

Civilian and Farmer jobs can use farming locations. Farmer is the intended production RP role.

### Mining

Use the `rhd_mine_` prefix.

Examples:

- `rhd_mine_iron`
- `rhd_mine_copper`
- `rhd_mine_gold`
- `rhd_mine_diamond`
- `rhd_mine_oil`

Only the Miner job is intended for mining.

### Refining

Use the `rhd_refine_` prefix.

Examples:

- `rhd_refine_iron` — 1 Iron Ore -> 2 Iron
- `rhd_refine_copper` — 1 Copper Ore -> 2 Copper
- `rhd_refine_gold` — 1 Gold Ore -> 3 Gold
- `rhd_refine_oil` — 1 Oil Sand -> 2 Oil

Only the Refiner job is intended for refining.

### Shops

Use `rhd_shop_<name>` markers for shop locations.

Example:

`rhd_shop_kavala`

The shop inventory and prices are centralized in `core/fn_init.sqf`.

### Banks

Use `rhd_bank_<name>` markers for bank/ATM locations.

Example:

`rhd_bank_kavala`

The starter bank interface uses $100 deposit/withdraw transactions.

### Fuel stations

Use `rhd_fuel_<name>` markers.

Examples:

- `rhd_fuel_kavala`
- `rhd_fuel_industrial`
- `rhd_fuel_harbor`

### Districts / Conflict

Use `rhd_zone_<name>` markers to define persistent RHD districts.

Examples:

- `rhd_zone_kavala`
- `rhd_zone_harbor`
- `rhd_zone_industrial`

District state is maintained by the RHD Conflict layer. The cTab player tablet has a **DISTRICTS** page that reports control state, heat, supply and nearby Police presence.

Current control states:

- `ORDERLY` — low pressure
- `CONTESTED` — medium pressure
- `CRIMINAL PRESSURE` — high pressure

Police presence reduces heat over time. Server-side gameplay systems can also add heat with `RHD_fnc_recordCrime`.

The system is inspired by persistent-world pressure concepts from Antistasi Ultimate, but it is implemented inside RHD - LifeCore and does not require Antistasi Ultimate to run.

### Jail

Use `rhd_jail_<name>` markers for jail/holding areas.

Keep `rhd_jail_main` as the primary marker if you later add expanded jail/booking systems.

## Named Eden objects

These variable names are optional and are intended to make future interaction expansion easier:

- `rhd_shop`
- `rhd_bank`
- `rhd_garage`
- `rhd_farm`
- `rhd_mine`
- `rhd_refine`
- `rhd_fuel`

The portable baseline remains marker-driven, so you do not have to place a special object to make a location exist.

## Ambient world system

No ambient markers are required.

RHD creates a small amount of civilian life and traffic around active players, then removes it when it is too far away or too old.

Current conservative global caps:

- 10 civilian actors during daylight.
- 5 civilian actors at night.
- 4 civilian traffic vehicles during daylight.
- 2 civilian traffic vehicles at night.
- 2 short-lived roadside incidents maximum.

See `PERFORMANCE.md` before increasing these values.

## Recommended town layout

A typical town can contain:

1. Player/spawn area.
2. RHD shop.
3. RHD bank/ATM.
4. Fuel station.
5. Police station and vehicle spawn.
6. EMS station and vehicle spawn.
7. Civilian/job center.
8. Farm location(s).
9. Mine location(s).
10. Refinery.
11. District/conflict marker.
12. Jail/holding location.

The framework never assumes a specific terrain, town name, coordinate or asset pack.

## Player interface

The player menu is a **cTab-backed RHD tablet**.

Players can access:

- Status / inventory
- Jobs
- Shop
- Banking
- Services
- District pressure

F6/F7/F8 are convenience shortcuts into the same tablet surface. They are not separate player menu systems.

## Administration

Administration is deliberately separate from the player tablet.

Administrators use **ACE Self Actions -> RHD Administration**.

No admin item and no dedicated admin hotkey are required.

Admin authorization is configured in `core/fn_init.sqf` using Steam64 IDs.
