# RHD - LifeCore — Steam Workshop & Dependency Guide

**Author: LT. Toad**

This guide is written for server owners and mission editors who may be new to Arma 3.

## Dependency summary

| Software / Workshop item | Required? | RHD role | Workshop ID |
|---|---|---|---:|
| **Arma 3** | YES | Base game | — |
| **CBA_A3** | YES | Shared framework dependency for cTab+ | `450814997` |
| **ACE3** | YES for the full RHD feature set | ACE interaction layer, EMS interactions and RHD Administration | `463939057` |
| **cTab+** | YES | RHD player tablet | `2262006564` |
| **Antistasi Ultimate** | NO | RHD-owned conflict design inspiration only | — |

## RHD-supplied dependency requests

The following Steam Workshop IDs were supplied for this project and are recorded here so they are not lost during server-pack creation:

```text
1123403138
2618183963
2618122951
2623374243
2623373810
```

### Verification status

I will not guess the titles, required addons, or transitive Workshop dependencies for these five items. Live Steam Workshop metadata is not available in this development environment right now, so publishing a guessed name or dependency chain would be unsafe.

Before calling these items **verified RHD dependencies**, confirm their Workshop titles and dependencies from the Steam pages and then add the exact addon names / `CfgPatches` identifiers to the dependency matrix below.

### Dependency matrix for the additional requested Workshop items

| Workshop ID | Verified title | Required by RHD? | RHD use planned | Dependency chain verified? |
|---:|---|---|---|---|
| `1123403138` | **Pending Steam verification** | Pending | Integrate only after addon API/assets are confirmed | **NO** |
| `2618183963` | **Pending Steam verification** | Pending | Integrate only after addon API/assets are confirmed | **NO** |
| `2618122951` | **Pending Steam verification** | Pending | Integrate only after addon API/assets are confirmed | **NO** |
| `2623374243` | **Pending Steam verification** | Pending | Integrate only after addon API/assets are confirmed | **NO** |
| `2623373810` | **Pending Steam verification** | Pending | Integrate only after addon API/assets are confirmed | **NO** |

Do not add guessed `CfgPatches` names to `description.ext`. Steam Workshop IDs alone cannot be used by Arma's mission configuration as addon dependency identifiers.

## Official RHD dependencies

### CBA_A3

Steam Workshop ID: `450814997`  
https://steamcommunity.com/sharedfiles/filedetails/?id=450814997

cTab+ documents CBA_A3 3.15 or later as a requirement. Use a current supported CBA_A3 release.

### ACE3

Steam Workshop ID: `463939057`  
https://steamcommunity.com/sharedfiles/filedetails/?id=463939057

RHD uses ACE3 for its interaction layer. Core LifeCore systems remain RHD-owned and server-authoritative.

### cTab+

Steam Workshop item / collection referenced by the upstream cTab+ project: `2262006564`  
https://steamcommunity.com/workshop/filedetails/?id=2262006564

RHD opens cTab's existing `cTab_Tablet_dlg` and places RHD-owned controls on it. RHD does not redistribute cTab PBOs.

### Antistasi Ultimate

Source project:  
https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate

**Do not add Antistasi Ultimate to the required mod list for RHD - LifeCore.**

Antistasi Ultimate is a complete persistent multiplayer scenario. Its current repository is a forked SQF project with an MIT main license plus separately licensed integrated material. RHD uses the repository as a design reference only and keeps its own Life RP implementation. fileciteturn344file0 fileciteturn345file0

## What RHD borrows conceptually from Antistasi Ultimate

RHD's `core/conflict/` layer implements RHD-owned equivalents of persistent-world pressure concepts:

- District state
- Criminal pressure / heat
- Police presence reducing local pressure
- Local supply state
- Player-visible district status
- Server-side crime recording

The actual RHD Conflict code is independent and does not start or load Antistasi Ultimate. fileciteturn363file0 fileciteturn365file0

## Client/server mod setup

For the currently verified full RHD feature set:

1. Arma 3
2. CBA_A3
3. ACE3
4. cTab+
5. RHD - LifeCore mission

The mission itself is not an addon PBO, so it does not belong in a normal `@Mod` folder.

For the five user-supplied Workshop IDs, add them only after the titles and transitive dependencies are verified.

## Steam Workshop release checklist

Your Workshop page should contain a visible block similar to this:

```text
RHD - LifeCore
Author: LT. Toad

VERIFIED REQUIRED MODS
- CBA_A3 (Workshop 450814997)
- ACE3 (Workshop 463939057)
- cTab+ (Workshop 2262006564)

ADDITIONAL REQUESTED WORKSHOP ITEMS - VERIFY BEFORE RELEASE
- Workshop 1123403138
- Workshop 2618183963
- Workshop 2618122951
- Workshop 2623374243
- Workshop 2623373810

Arma 3 is required.
Antistasi Ultimate is NOT required.
```

## Mission vs addon dependencies

RHD - LifeCore is a mission framework rather than a standalone addon PBO. Do not copy external addon PBOs into the RHD mission directory.

Install CBA_A3, ACE3, cTab+ and any verified requested Workshop dependencies through their normal Workshop/mod distribution channels.

## First-time setup

1. Install Arma 3.
2. Subscribe to CBA_A3, ACE3 and cTab+.
3. Verify the five requested Workshop IDs before adding them to the server preset.
4. Start Arma 3 and verify the selected mods load without errors.
5. Open Eden Editor (3DEN).
6. Create a multiplayer mission on your selected terrain.
7. Copy the RHD - LifeCore mission files into that mission folder.
8. Edit `core/fn_init.sqf` and add the trusted administrator Steam64 IDs.
9. Place the RHD markers described in `3DEN_SETUP.md`.
10. Place `Land_Billboard_F` objects where you want RHD branding.
11. Save the mission in Eden so `mission.sqm` is generated/updated.
12. Test locally, then test on a dedicated server.

## Troubleshooting

### cTab tablet does not open

Check that CBA_A3 and cTab+ are loaded and that the client has the same supported versions as the server.

### Admin menu does not appear

Check that ACE3 is loaded and that the administrator's Steam64 ID was entered in the `RHD_ADMIN_UIDS` section of `core/fn_init.sqf`.

### Districts are empty

Add one or more Eden markers named with the `rhd_zone_` prefix, for example `rhd_zone_kavala`.

### Billboard remains unchanged

Make sure the object class is `Land_Billboard_F` and that you did not set `rhd_billboard_skip = true` on that object.

### The mission has missing external assets

Do not copy cTab/ACE3/Antistasi addon folders into the mission. Install external mods normally instead.

## Development note

The external projects are credited in `THIRD_PARTY_NOTICES.md`. RHD's player UI, Life systems, administration, branding and district-pressure implementation are maintained as RHD code. Antistasi Ultimate remains an external reference project, not a runtime dependency.
