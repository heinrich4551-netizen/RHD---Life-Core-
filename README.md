# RHD Life Core

A terrain-agnostic Arma 3 Life RP mission framework designed for **3DEN-first setup**. No external framework is required. Place your locations, NPCs, vehicles, and markers in Eden; the mission scripts discover them by variable name/marker prefix at runtime.

## Included

- Persistent player identity, cash/bank, inventory, licenses, job and jail state.
- F6 player menu, F7 jobs menu, F8 RHD shop menu.
- Farming: Apples, Cannabis Plant, Coca Leaf, Corn Cob, Grapes, Peaches.
- Mining: Iron Ore, Copper Ore, Gold Ore, Diamond, Oil Sand.
- Refining: Iron Ore -> Iron, Copper Ore -> Copper, Gold Ore -> Gold, Oil Sand -> Oil.
- Generic buy/sell shop system using the RHD economy namespace.
- Police, EMS and civilian job templates.
- Vehicle spawn/garage helpers and basic interaction actions.
- Server-authoritative transactions with anti-negative-money/inventory checks.
- 3DEN marker/object driven locations; no hard-coded terrain coordinates.

## 3DEN setup

Create a mission in Eden on any terrain and copy this repository's mission files into the mission folder. The scripts expect these optional marker prefixes:

- `rhd_farm_*` - farming areas
- `rhd_mine_*` - mining areas
- `rhd_refine_*` - refining areas
- `rhd_shop_*` - shops
- `rhd_garage_*` - garages
- `rhd_spawn_*` - job/vehicle spawn locations
- `rhd_jail_*` - jail area

Markers are optional. If no matching marker exists, the corresponding feature is simply unavailable instead of crashing the mission.

## Recommended Eden variables

Set variable names on objects/NPCs where convenient:

- `rhd_shop` - shop NPC
- `rhd_garage` - garage NPC
- `rhd_farm` - farming interaction object
- `rhd_mine` - mining interaction object
- `rhd_refine` - refinery interaction object

You can also use marker-only locations; the framework creates interaction actions on nearby players.

## Installation

1. Make an Arma 3 mission in Eden on the desired terrain.
2. Copy the files in this repository into the mission directory.
3. Save the Eden mission once so Arma generates/updates `mission.sqm`.
4. Place the optional marker prefixes and named objects described above.
5. Preview or host the mission. A dedicated server should run with `-filePatching` only when developing; do not require it for release.

This project intentionally avoids terrain-specific coordinates and third-party framework dependencies.
