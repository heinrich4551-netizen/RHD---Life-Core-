# RHD - LifeCore

**Arma 3 Life RP addon / mission framework**  
**Author: LT. Toad**

RHD - LifeCore is a Life RP framework for Arma 3. It can operate with the two hard addon dependencies below, while optional integrations enhance the experience when installed.

## Architecture

```text
ARMA 3
  |
  +-- CBA_A3 (required)
  |
  +-- cTab+ (required)
  |
  +-- RHD - LifeCore
          |-- 3DEN Life RP Systems module
          |-- player identity / cash / bank
          |-- jobs / farming / mining / refining
          |-- virtual Life RP market
          |-- dynamic base + loaded-mod equipment shops
          |-- dynamic base + loaded-mod vehicle shops
          |-- police / EMS / crime RP
          |-- cTab player tablet
          |-- UID-gated administration
          |-- RHD branding / billboard automation
          |
          +-- OPTIONAL Antistasi Ultimate enhancement
          |     +-- campaign state / zones / aggression / HQ bridge
          |
          +-- OPTIONAL ACE3 enhancement
                +-- ACE contextual interactions / EMS / admin access
```

RHD does not require Antistasi Ultimate or ACE3 to load. When those addons are present, RHD detects them at runtime and enables compatible enhancement paths.

## 3DEN-first setup

Place the RHD Life RP Systems module in Eden:

```text
Systems -> RHD - LifeCore -> Life RP Systems
```

When Antistasi Ultimate is installed, the optional RHD Antistasi Ultimate Bridge module can also be placed to connect RHD to that campaign.

Place the actual shops, banks, farms, mines, refineries, fuel stations, districts, jail locations and billboards in Eden. No map coordinates are hidden inside gameplay configuration.

## Optional Antistasi integration

When `A3A_core` is present, the RHD bridge uses the installed Antistasi campaign's public state/API for campaign status, strategic pressure and related world information. When A3A is absent, the bridge reports `STANDALONE` and RHD continues without attempting to call A3A functions.

## Terrain compatibility

RHD is terrain agnostic. In standalone mode, RHD systems use Eden markers and generic Arma terrain data. With Antistasi Ultimate installed, A3A map information can enhance campaign-backed terrain handling.

## Dynamic shops

The RHD shop system reads the active Arma 3 configuration at runtime.

**VEHICLES** automatically discovers public `LandVehicle`, `Air` and `Ship` classes.

**EQUIPMENT** automatically discovers public weapons, magazines, gear, goggles and backpacks.

Base-game content and public content from any loaded addon can therefore become available without maintaining a fixed manual class list for every Workshop addon.

## RHD player interface

cTab+ hosts the RHD player tablet with:

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

ACE3 is optional. When present, RHD adds ACE contextual actions for the tablet, administration and EMS. Without ACE3, the RHD core continues to provide its own configured interaction paths without referencing ACE functions.

## Branding

Mission name: `RHD - LifeCore`  
Author: `LT. Toad`

Artwork:

`assets/branding/RHDLifeCore.jpg`

`Land_Billboard_F` objects placed in Eden are automatically branded when the Life module's branding option is enabled. Set `rhd_billboard_skip = true` on an individual object to leave it unchanged.

## Dependencies

### Required

- Arma 3
- CBA_A3 — Steam Workshop `450814997`
- cTab+ — Steam Workshop `2262006564`
- RHD - LifeCore addon

### Optional enhancements

- Antistasi Ultimate / A3A
- ACE3
- Any additional Arma 3 content mods used by the server

The RHD addon hard dependency declaration is:

```cpp
requiredAddons[] = {"cba_main", "ctab_core"};
```

No other Steam Workshop addon is a hard RHD dependency.

## Source base

The repository may retain an Antistasi source reference for development/auditing. That source reference is not a runtime hard dependency of the RHD addon.

## Licensing boundary

RHD does not redistribute third-party addon PBOs. See `THIRD_PARTY_NOTICES.md`, `LICENSES/ANTISTASI_ULTIMATE_LICENSE.txt` and `ADDON_BUILD.md`.

## Project structure

```text
addons/rhd_lifecore/       -> compiled RHD addon + 3DEN modules
core/fn_init.sqf           -> beginner server configuration
core/antistasi/            -> optional A3A bridge
core/conflict/             -> Life RP district pressure
core/economy/              -> market + dynamic shops
core/bank/                 -> banking
core/jobs/                 -> jobs / duty
core/industry/             -> farming / mining / refining
core/rp/                   -> police / EMS / RP
core/services/             -> vehicle/fuel services
core/ui/                   -> cTab player tablet
core/ace/                  -> optional ACE3 integration
core/admin/                -> separate administration
core/ambient/              -> civilians / incidents
core/branding/             -> billboard branding
assets/branding/           -> RHD artwork
vendor/antistasi-ultimate  -> optional development source reference

3DEN_MODULES.md            -> module setup
3DEN_SETUP.md              -> map setup
EDITOR_QUICKSTART.md       -> beginner guide
STEAM_WORKSHOP_DEPENDENCIES.md -> dependency matrix
```

`mission.sqm` remains an Eden-generated file and should not be maintained by hand.
