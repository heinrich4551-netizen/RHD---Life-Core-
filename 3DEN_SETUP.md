# RHD Life — 3DEN Setup

This framework is terrain agnostic. Build the actual map layout in Eden and keep the script package unchanged between terrains.

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

Use `rhd_bank_<name>` markers for visual/organizational bank locations. The starter bank interaction currently deposits or withdraws $100 per action.

### Fuel stations

Use `rhd_fuel_<name>` markers, for example:

- `rhd_fuel_kavala`
- `rhd_fuel_industrial`
- `rhd_fuel_harbor`

A driver at a fuel marker can refuel the current vehicle. The server calculates the price from the fuel missing and validates the distance before charging the player.

### Jail

Use `rhd_jail_<name>` markers for future jail/booking expansion. Keep at least one marker named `rhd_jail_main` if you add jail scripts.

## Ambient world system

No ambient markers are required. The server creates a small amount of civilian life and traffic around active players, then removes it when it is too far away or too old.

Current hard limits are deliberately conservative:

- 10 civilian actors during daylight.
- 5 civilian actors at night.
- 4 civilian traffic vehicles during daylight.
- 2 civilian traffic vehicles at night.
- 2 short-lived roadside incidents maximum.

The system does not attempt to simulate the whole island. It only simulates the small bubble players can actually experience.

## Eden object variables

You may give NPCs/objects these variable names for future expansion:

- `rhd_shop`
- `rhd_bank`
- `rhd_garage`
- `rhd_farm`
- `rhd_mine`
- `rhd_refine`
- `rhd_fuel`

The framework does not require those objects; marker-driven interactions are the portable baseline.

## Player controls

- **F6** — Player/account/inventory menu
- **F7** — Job selection
- **F8** — RHD Shop
- Action menu — gathering, refining, banking, refueling, job duty, police ticketing, EMS treatment

## Recommended Eden layout

For each town, place:

1. Spawn/player start.
2. RHD shop marker and optional shop NPC.
3. RHD bank marker and optional ATM/stand object.
4. Fuel station marker and optional pump objects.
5. Police station and police spawn.
6. EMS station and EMS spawn.
7. Civilian job center.
8. One or more farms.
9. One or more mines.
10. One or more refineries.
11. Jail/holding location.

The framework never assumes a specific terrain, town name, coordinate, or asset pack.
