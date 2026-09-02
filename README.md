# RHD - LifeCore

**Arma 3 Life RP addon / mission framework**  
**Author: LT. Toad**

RHD - LifeCore is a **Life RP layer and addon built around the Antistasi Ultimate campaign framework**. Antistasi supplies the persistent strategic world. RHD adds civilian life, economy, jobs, crime, services, dynamic shops and Life RP around that world.

## Architecture

```text
ANTISTASI ULTIMATE
    |
    |-- campaign startup / save-load
    |-- terrain analysis / mapInfo
    |-- strategic zones / cities
    |-- factions / garrisons / patrols
    |-- QRF / attacks / convoys / missions
    |-- aggression / enemy resources
    |-- HQ / Petros / arsenal
    |
    +---- RHD - LifeCore ADDON + MISSION
            |-- 3DEN Antistasi Base module
            |-- 3DEN Life RP Systems module
            |-- player identity / cash / bank
            |-- jobs / farming / mining / refining
            |-- virtual Life RP market
            |-- dynamic base + loaded-mod equipment shops
            |-- dynamic base + loaded-mod vehicle shops
            |-- police / EMS / crime RP
            |-- cTab player tablet
            |-- ACE3 interactions
            |-- separate UID-gated administration
            |-- RHD branding / Land_Billboard_F automation
            +-- Life RP pressure fed into A3A aggression
```

RHD does **not** run a second war engine. The Antistasi campaign remains the strategic authority; RHD consumes its public API/state and adds Life RP systems around it.

## 3DEN-first setup

Place these two modules in Eden:

```text
Systems -> RHD - LifeCore -> Antistasi Ultimate Base
Systems -> RHD - LifeCore -> Life RP Systems
```

The **Antistasi Ultimate Base** module explicitly starts the installed A3A campaign and provides the small host-mission anchors required by the campaign startup.

The **Life RP Systems** module enables the RHD-only systems.

Then place the actual shops, banks, farms, mines, refineries, districts, jail locations and billboards in Eden. No map coordinates are hidden inside the gameplay configuration.

See `3DEN_MODULES.md`, `3DEN_SETUP.md` and `EDITOR_QUICKSTART.md`.

## Antistasi integration

The RHD bridge waits for the A3A campaign `serverInitDone` state before enabling RHD features that depend on the strategic world. RHD then uses A3A public functionality including:

- `A3A_fnc_addAggression` for crime consequences.
- `A3A_fnc_addEnemyResources` through the RHD bridge for strategic resource events.
- `A3A_fnc_safeVehicleSpawn` for collision-aware vehicle spawning.
- A3A campaign state such as `controlsX`, `sidesX`, aggression, HQ/Petros and campaign zones.

The upstream A3A server initializer itself owns campaign save/load, zones, garrisons and background strategic loops and publishes its initialized state before continuing with those long-running systems. 

The current A3A source revision exposes version `11.9.12` and requires mission version `10.0.0` or newer. RHD advertises the current revision in its mission-side `A3A` compatibility class. fileciteturn703file0

## Terrain compatibility

RHD is intentionally **terrain agnostic**. A3A's own mapInfo is preferred for the active terrain. When the terrain has no A3A mapInfo entry, the RHD Antistasi Base module can install a generic fallback with common service/terrain defaults.

This improves compatibility for unmapped terrains, but it cannot invent map-specific data that only a terrain author or A3A mapInfo definition can provide. Community terrains with unusual airports, custom factions or specialized infrastructure still need in-game validation.

## Dynamic shops

The RHD shop system reads the active Arma 3 configuration at runtime.

**VEHICLES** automatically discovers public `LandVehicle`, `Air` and `Ship` classes.

**EQUIPMENT** automatically discovers public weapons, magazines, gear, goggles and backpacks.

This means base-game content and public content from loaded dependency mods become available without maintaining a separate manual class list for every Workshop addon.

The server recalculates and validates the purchase price. Vehicle purchases use the RHD/A3A safe-spawn bridge.

## RHD player interface

cTab+ hosts a single RHD player tablet with:

```text
STATUS
JOBS
MARKET
VEHICLES
EQUIPMENT
BANK
SERVICES
DISTRICTS
CAMPAIGN
```

ACE3 supplies contextual interaction. Administration remains completely separate from the player tablet and is available only through the UID-gated ACE `RHD Administration` action.

There is no admin inventory item and no dedicated admin hotkey.

## Branding

Mission name: `RHD - LifeCore`  
Author: `LT. Toad`

Artwork:

`assets/branding/RHDLifeCore.jpg`

`Land_Billboard_F` objects placed in Eden are automatically branded when the Life module's branding option is enabled. Set `rhd_billboard_skip = true` on an individual object to leave it unchanged.

## Dependencies

### Required addon stack

- Arma 3
- Antistasi Ultimate
- CBA_A3
- ACE3
- cTab+
- RHD - LifeCore addon

The RHD addon declares the following addon dependencies in `CfgPatches`:

```text
A3A_core
cba_main
ace_main
ctab_core
```

The four additional Workshop IDs supplied by the project owner, plus Workshop ID `1123403138`, are documented in `STEAM_WORKSHOP_DEPENDENCIES.md`. Their exact titles and transitive dependency chains are not guessed when Steam metadata cannot be verified from the development environment.

## Source base

A Git submodule tracks the selected Antistasi Ultimate development source under:

```text
vendor/antistasi-ultimate
```

Clone with:

```bash
git clone --recurse-submodules https://github.com/heinrich4551-netizen/RHD---Life-Core-.git
```

The submodule is for source auditing/development. Normal server operation uses the official Antistasi Ultimate addon distribution.

## Licensing boundary

The Antistasi Ultimate repository identifies the main Antistasi Ultimate / Plus / Community Edition code as MIT while also identifying separately licensed APL-ND integrated components. RHD does not modify or redistribute those restricted components. fileciteturn427file0

See `THIRD_PARTY_NOTICES.md`, `LICENSES/ANTISTASI_ULTIMATE_LICENSE.txt` and `ADDON_BUILD.md`.

## Project structure

```text
addons/rhd_lifecore/       -> compiled RHD addon + 3DEN modules
core/fn_init.sqf           -> beginner server configuration
core/antistasi/            -> A3A bridge
core/conflict/             -> Life RP district pressure
core/economy/              -> market + dynamic shops
core/bank/                 -> banking
core/jobs/                 -> jobs / duty
core/industry/             -> farming / mining / refining
core/rp/                   -> police / EMS / RP
core/services/             -> vehicle/fuel services
core/ui/                   -> cTab player tablet
core/ace/                  -> ACE3 integration
core/admin/                -> separate administration
core/ambient/              -> civilians / incidents
core/branding/             -> billboard branding
assets/branding/           -> RHD artwork
vendor/antistasi-ultimate  -> pinned Antistasi source base

3DEN_MODULES.md            -> module setup
3DEN_SETUP.md              -> map setup
EDITOR_QUICKSTART.md       -> beginner guide
STEAM_WORKSHOP_DEPENDENCIES.md -> required Workshop stack
```

`mission.sqm` remains an Eden-generated file and should not be maintained by hand.
