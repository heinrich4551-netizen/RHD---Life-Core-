# RHD - LifeCore

**Arma 3 Life RP framework**  
**Author: LT. Toad**

RHD - LifeCore is a **Life RP layer built around the Antistasi Ultimate campaign framework**. Antistasi provides the strategic persistent world; RHD adds civilian life, jobs, economy, crime, services, branding, cTab and administration around that world.

## Architecture

```text
ANTISTASI ULTIMATE
    |
    |-- campaign save/load
    |-- strategic zones and cities
    |-- faction control
    |-- garrisons / patrols / QRFs
    |-- aggression / enemy resources
    |-- convoys / attacks / missions
    |-- HQ / Petros / arsenal
    |
    +---- RHD - LifeCore
            |-- player identity / economy
            |-- jobs / farming / mining / refining
            |-- shops / banking / services
            |-- police / EMS / crime RP
            |-- cTab player tablet
            |-- ACE3 interactions
            |-- separate UID-gated administration
            |-- RHD branding / billboards
            +-- Life RP pressure tied back into A3A
```

RHD does **not** run a competing strategic war simulation. Its Conflict layer reads Antistasi strategic zones and aggression, then adds local Life RP pressure for civilian gameplay. Crime can feed the Antistasi aggression model through the RHD bridge.

## What RHD uses from Antistasi Ultimate

RHD is designed to call the installed A3A public function interface for selected operations. The current integration uses:

- `A3A_fnc_addAggression` for crime consequences.
- `A3A_fnc_addEnemyResources` through the RHD resource adapter for future world events.
- `A3A_fnc_safeVehicleSpawn` for admin/vehicle spawning.
- `A3A_fnc_spawnVehicleAtMarker` as the recommended pattern for marker-based vehicle spawning.
- `controlsX`, `sidesX`, `aggression`, HQ/Petros state and other campaign globals exposed by A3A.
- A3A campaign initialization state (`serverInitDone`) before RHD starts its server-side bridge.

The upstream A3A server initialization explicitly builds the campaign state, initializes zones, loads/creates saves, initializes garrisons and then publishes `serverInitDone` before starting long-running campaign loops. fileciteturn426file0

## Source integration

The repository contains a Git submodule:

```text
vendor/antistasi-ultimate
```

It is pinned to the Antistasi Ultimate `unstable` revision used as the development base.

Clone the repository with:

```bash
git clone --recurse-submodules https://github.com/heinrich4551-netizen/RHD---Life-Core-.git
```

If you already cloned it:

```bash
git submodule update --init --recursive
```

For normal server operation, install the official Antistasi Ultimate build through its normal distribution channel. The source submodule is primarily for development, auditing and keeping the RHD integration aligned with the chosen upstream revision.

## Beginner workflow

**Eden Editor** handles terrain objects, towns, NPCs, service locations, billboards and RHD markers.

**`core/fn_init.sqf`** handles the easy server configuration: admins, jobs, prices, recipes and the A3A/RHD bridge tuning.

**`ANTISTASI_BASE.md`** explains the relationship between the A3A campaign and the Life RP layer.

## RHD player experience

The normal player interface is a cTab+ tablet with:

- Status / Inventory
- Jobs
- Market
- Banking
- Services
- Districts

ACE3 provides contextual interactions.

The admin interface is intentionally separate from the player tablet and is opened from ACE Self Actions. There is no admin item and no dedicated admin hotkey.

## Branding

The supplied Kavala artwork is stored at:

`assets/branding/RHDLifeCore.jpg`

Mission branding:

- **Name:** `RHD - LifeCore`
- **Author:** `LT. Toad`

Every `Land_Billboard_F` in the mission is automatically given the RHD artwork at startup. Set the object variable `rhd_billboard_skip = true` in Eden to leave an individual billboard unchanged.

## Dependencies

Required for the full RHD feature set:

- Arma 3
- Antistasi Ultimate
- CBA_A3
- ACE3
- cTab+

The additional Workshop IDs requested by the project owner are recorded in `STEAM_WORKSHOP_DEPENDENCIES.md`. Their exact titles and transitive dependency chains are intentionally not guessed until official Steam metadata is available.

## Licensing

Antistasi Ultimate's repository license is MIT for the main Antistasi Ultimate / Plus / Community Edition code, while the upstream license explicitly identifies separately licensed APL-ND components. RHD keeps those boundaries and does not modify or redistribute the restricted components. fileciteturn427file0

See `THIRD_PARTY_NOTICES.md` and `LICENSES/ANTISTASI_ULTIMATE_LICENSE.txt`.

## Project structure

```text
core/fn_init.sqf       -> main beginner configuration
core/antistasi/        -> A3A integration bridge
core/conflict/         -> Life RP pressure around A3A zones
core/economy/          -> shop / market
core/bank/             -> banking
core/jobs/             -> jobs / duty
core/industry/         -> farming / mining / refining
core/rp/               -> police / EMS / RP
core/services/         -> fuel / services
core/ui/               -> cTab player tablet
core/ace/              -> ACE3 integration
core/admin/            -> separate administration
core/ambient/          -> civilians / traffic / incidents
core/branding/         -> billboard branding
assets/branding/       -> RHD artwork
vendor/antistasi-ultimate -> pinned Antistasi Ultimate development base
```

`mission.sqm` remains an Eden-generated file rather than a hand-maintained source file.
