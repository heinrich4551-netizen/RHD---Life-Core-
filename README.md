# RHD - LifeCore

**Arma 3 Life RP framework**  
**Author: LT. Toad**

RHD - LifeCore is a terrain-agnostic, 3DEN-first Arma 3 Life framework built around readable configuration, modular systems, server-authoritative transactions and a lightweight persistent world.

## Project identity

- **Name:** RHD - LifeCore
- **Author:** LT. Toad
- **Primary editor workflow:** Arma 3 Eden / 3DEN
- **Player interface:** cTab+ tablet
- **Interaction layer:** ACE3 when installed
- **Administration:** Separate UID-gated RHD admin panel through ACE Self Actions
- **World systems:** RHD-owned conflict, economy, jobs, industry, RP and ambient systems
- **Branding:** `assets/branding/RHDLifeCore.jpg`

The supplied Kavala artwork is used as the mission overview/loading artwork. The in-game mission name and author are `RHD - LifeCore` and `LT. Toad`.

`Land_Billboard_F` objects are automatically branded with the RHD artwork at server startup. Individual billboards can opt out with the Eden variable `rhd_billboard_skip = true`.

## External projects

RHD - LifeCore integrates with external projects through their supported interfaces rather than bundling their entire addons into the mission.

### cTab+
RHD uses cTab+'s tablet display as the player-facing UI host. The mission creates RHD-owned tablet controls on the cTab interface.

### ACE3
RHD uses ACE3 for contextual interaction menus and administrator/EMS access when ACE3 is installed.

### Antistasi Ultimate
RHD includes an **RHD-owned Conflict layer inspired by high-level Antistasi-style persistent-world concepts** such as district pressure, supply, local security presence and changing territorial status. RHD does **not** require Antistasi Ultimate at runtime and does not redistribute Antistasi Ultimate PBOs.

This separation is intentional: Antistasi Ultimate is a complete persistent multiplayer scenario rather than a small mission library. RHD keeps the Life RP economy, identity, jobs and server rules under its own codebase while using compatible design concepts for the world-pressure layer.

## Included gameplay

- Persistent player identity, cash, bank, inventory, licenses, jobs and jail state.
- cTab-backed RHD player tablet for Status, Jobs, Market, Banking, Services and Districts.
- Farming: Apples, Cannabis Plant, Coca Leaf, Corn Cob, Grapes, Peaches.
- Mining: Iron Ore, Copper Ore, Gold Ore, Diamond, Oil Sand.
- Refining: Iron Ore -> Iron, Copper Ore -> Copper, Gold Ore -> Gold, Oil Sand -> Oil.
- Generic buy/sell shop system.
- Police, EMS and civilian jobs.
- Bank, fuel, farming, mining and refining location systems driven by Eden markers.
- RHD Conflict districts using `rhd_zone_*` markers.
- Crime pressure recording and police presence pressure reduction.
- Automatic RHD branding on `Land_Billboard_F` objects.
- Lightweight ambient civilians and traffic with hard performance caps.
- Rare roadside incidents and temporary Police/EMS dispatch events.
- UID-gated unified administration with server-side privilege validation.
- ACE-aware EMS treatment interactions.
- No hard-coded terrain coordinates.

## Beginner editor workflow

Most server owners only need two places:

**1. Eden Editor**  
Place the map objects, NPCs, vehicles, RHD markers and billboards.

**2. `core/fn_init.sqf`**  
Change the clearly marked server settings such as admin UIDs, jobs, pay rates, item prices, recipes and conflict tuning.

Start with `EDITOR_QUICKSTART.md` before editing the deeper scripts.

## 3DEN marker conventions

- `rhd_farm_*` - farming locations
- `rhd_mine_*` - mining locations
- `rhd_refine_*` - refining locations
- `rhd_shop_*` - shops
- `rhd_bank_*` - banks / ATMs
- `rhd_fuel_*` - fuel stations
- `rhd_zone_*` - persistent district/conflict zones
- `rhd_jail_*` - jail area
- `rhd_garage_*` - reserved for vehicle ownership expansion
- `rhd_spawn_*` - reserved job/vehicle spawn locations

## Administration

All administrator functions remain in the separate `RHD_ADMIN` interface. The admin panel is not part of the player tablet.

Access is through **ACE Self Actions -> RHD Administration**. There is no admin inventory item and no dedicated admin hotkey.

Before hosting, edit the administrator list in `core/fn_init.sqf`:

```sqf
missionNamespace setVariable [
    "RHD_ADMIN_UIDS",
    ["76561198012345678"],
    true
];
```

Use Steam64 IDs only.

## Dependencies

For the currently verified full feature set, install:

- Arma 3
- CBA_A3
- cTab+
- ACE3

Antistasi Ultimate is **not** a dependency. Its persistent-world ideas are implemented by the RHD-owned `core/conflict` layer.

The four additional Steam Workshop IDs requested by the project owner are recorded in `STEAM_WORKSHOP_DEPENDENCIES.md`. Their titles, addon class identifiers and transitive dependency chains are not guessed because live Steam metadata is unavailable in this development environment.

## Licensing and attribution

See `THIRD_PARTY_NOTICES.md` for project-by-project licensing boundaries.

The RHD admin interface keeps attribution for its XEAT_AdminTool structural reference. cTab+ and ACE3 remain external dependencies.

## Development notes

`mission.sqm` is intentionally generated by Eden rather than hand-authored by the framework.

The repository is organized so that configuration is separated from system implementation:

```text
core/fn_init.sqf       -> easiest server configuration
core/conflict/         -> district pressure / world conflict
core/economy/          -> shop and market transactions
core/bank/             -> banking
core/jobs/             -> jobs and duty
core/industry/         -> farming, mining, refining
core/rp/               -> Police / EMS / RP
core/services/         -> fuel and service actions
core/ui/               -> cTab player interface
core/ace/              -> ACE3 integration
core/admin/            -> separate administration
core/ambient/          -> civilians, traffic and incidents
core/branding/         -> automatic RHD billboard branding
assets/branding/       -> RHD - LifeCore artwork
```
