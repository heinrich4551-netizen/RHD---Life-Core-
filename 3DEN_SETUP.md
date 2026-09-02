# RHD Life — 3DEN Setup

This framework is intentionally terrain agnostic. Build the actual map layout in Eden and keep the script package unchanged between terrains.

## Required

Create a normal multiplayer mission in Eden, then copy the framework files into that mission folder. Save the mission in Eden. Do not hand-edit `mission.sqm` unless you know exactly why you need to.

## Marker conventions

Use any marker shape/size. The scripts use marker position and name only.

### Farming

- `rhd_farm_apples`
- `rhd_farm_cannabis`
- `rhd_farm_coca`
- `rhd_farm_corn`
- `rhd_farm_grapes`
- `rhd_farm_peaches`

Civilian and Farmer jobs can gather at farming markers. Farmer is the intended job for production RP.

### Mining

- `rhd_mine_iron`
- `rhd_mine_copper`
- `rhd_mine_gold`
- `rhd_mine_diamond`
- `rhd_mine_oil`

Only the Miner job can gather at mining markers.

### Refining

- `rhd_refine_iron` — 2 Iron Ore -> 1 Iron
- `rhd_refine_copper` — 2 Copper Ore -> 1 Copper
- `rhd_refine_gold` — 3 Gold Ore -> 1 Gold
- `rhd_refine_oil` — 2 Oil Sand -> 1 Oil

Only the Refiner job can refine.

### Shops

Use `rhd_shop_<name>` markers for your shop locations. The current shop inventory is centralized in `core/fn_init.sqf` and is available from F8.

### Banks

Use `rhd_bank_<name>` markers for visual/organizational bank locations. The starter bank interaction currently deposits or withdraws $100 per action; expand the UI when you want variable amounts.

### Jail

Use `rhd_jail_<name>` markers for future jail/booking expansion. Keep at least one marker named `rhd_jail_main` if you add jail scripts.

## Eden object variables

You may give NPCs/objects these variable names for future expansion:

- `rhd_shop`
- `rhd_bank`
- `rhd_garage`
- `rhd_farm`
- `rhd_mine`
- `rhd_refine`

The current framework does not require those objects; marker-driven interactions are the portable baseline.

## Player controls

- **F6** — Player/account/inventory menu
- **F7** — Job selection
- **F8** — RHD Shop
- Action menu — gathering, refining, banking, job duty, police ticketing, EMS treatment

## Recommended Eden layout

For each town, place:

1. Spawn/player start.
2. RHD shop marker and optional shop NPC.
3. RHD bank marker and optional ATM/stand object.
4. Police station and police spawn.
5. EMS station and EMS spawn.
6. Civilian job center.
7. One or more farms.
8. One or more mines.
9. One or more refineries.
10. Jail/holding location.

The framework never assumes a specific terrain, town name, coordinate, or asset pack.
