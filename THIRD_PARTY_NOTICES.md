# RHD - LifeCore — Third-Party Notices

**RHD - LifeCore**  
**Author: LT. Toad**

This file explains which external projects influenced or support RHD and what RHD actually redistributes.

## Antistasi Ultimate

Project:
https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate

The main Antistasi Ultimate project is released under MIT licensing, with the repository also identifying separately licensed integrated components.

RHD uses **Antistasi-style persistent-world design ideas** for its Conflict layer: district pressure, changing public-order status, local law-enforcement presence and persistent district state.

### What RHD does not redistribute

RHD does not copy Antistasi Ultimate PBOs into the mission and does not require the Antistasi Ultimate mod at runtime.

The Antistasi Ultimate repository explicitly identifies some integrated folders as APL-ND material, including:

- `Tools\StreetArtist`
- `A3-Antistasi\Garage`

Those components have separate licensing terms. RHD therefore does not copy, modify or redistribute those restricted components.

### RHD implementation

The RHD implementation is located in:

`core/conflict/`

Key files:

- `fn_conflictInit.sqf` — beginner-facing conflict settings and initialization.
- `fn_conflictDirector.sqf` — server-side district pressure loop.
- `fn_getZoneStatus.sqf` — public district status helper.
- `fn_recordCrime.sqf` — server-side crime/pressure recorder.

Districts are placed by editors in Eden with marker names beginning with:

`rhd_zone_`

## cTab+

Project:
https://github.com/jetelain/cTab

cTab+ is an external Arma 3 mod used as the host surface for the RHD player tablet. RHD calls cTab's mission-facing interface and creates RHD-owned controls on the active cTab tablet display.

RHD does not redistribute cTab PBOs.

## ACE3

Project:
https://github.com/acemod/ACE3

ACE3 is an external Arma 3 mod used by RHD for interaction-menu integration, contextual EMS interaction and administrator access.

RHD does not redistribute ACE3 PBOs.

## XEAT_AdminTool interface reference

Project:
https://github.com/xedom/XEAT_AdminTool

The RHD administrator panel uses a compact player-list / action-list / value / execute layout adapted from the XEAT_AdminTool interface concept.

RHD keeps the required attribution and the adapted administrator UI is treated as APL-SA material according to the upstream XEAT license.

## RHD branding artwork

The supplied Kavala artwork is included in:

`assets/branding/RHDLifeCore.jpg`

Mission branding:

- Name: `RHD - LifeCore`
- Author: `LT. Toad`

The image is used as the mission `loadScreen` and `overviewPicture`.

## Distribution rule for server owners

Install external projects through their normal official distribution channels. Do not unpack or merge their PBOs into the RHD mission folder.

When publishing RHD, keep this notice file with the mission so the source projects and integration boundaries remain visible to users.
