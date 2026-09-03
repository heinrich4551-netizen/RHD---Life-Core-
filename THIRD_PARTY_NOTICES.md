# RHD - LifeCore — Third-Party Notices

**RHD - LifeCore**  
**Author: LT. Toad**

This file explains which external projects are required by, integrated with, or referenced by RHD and what RHD redistributes.

## Antistasi Ultimate — base framework

Project:
https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate

**Runtime status: REQUIRED.**

RHD - LifeCore is designed as a Life RP layer on top of the Antistasi Ultimate campaign framework. RHD relies on the installed A3A campaign for strategic world state rather than running a parallel war engine.

RHD uses the A3A public function/state interface for selected operations including campaign initialization, aggression, enemy resources, strategic markers and collision-aware vehicle spawning. The RHD bridge waits for `serverInitDone` before enabling the A3A-dependent systems.

The upstream repository describes the main Antistasi Ultimate / Plus / Community Edition code as MIT-licensed while identifying separately licensed integrated components. RHD does not modify or redistribute restricted upstream components.

The selected upstream development revision is tracked by the RHD Git submodule:

`vendor/antistasi-ultimate`

## cTab+

Project:
https://github.com/jetelain/cTab

**Runtime status: REQUIRED.**

cTab+ is the external host for the RHD player tablet. RHD creates RHD-owned controls on cTab's tablet display instead of copying the cTab addon into the mission.

## CBA_A3

**Runtime status: REQUIRED.**

CBA_A3 is a prerequisite for cTab+ and is installed separately through the normal Arma 3 mod distribution channel.

## ACE3

Project:
https://github.com/acemod/ACE3

RHD uses ACE3 as an optional interaction layer where available. RHD does not redistribute ACE3 PBOs.

## GSRI Gear — modern clothing/equipment integration

Projects:
https://github.com/Thibugs/GSRI-Gear  
https://github.com/team-gsri/mods-gear

**Runtime status: OPTIONAL for the GSRI compatibility bridge.**

The public GSRI source tree provides modern uniforms, backpacks, headgear and vests. The two supplied GSRI repositories currently expose the same source-tree revision/content, so RHD treats `team-gsri/mods-gear` as a mirror rather than a second unique asset pool.

GSRI's repository includes an MIT license. RHD does not duplicate the GSRI PAA/P3D binaries in the main RHD addons. Instead, `addons/rhd_gsri_compat` provides a separate compatibility PBO which depends on `gsri_equipment` and supplies RHD/Arsenal categorisation for selected GSRI classes.

The selected GSRI compatibility classes are defined in `addons/rhd_gsri_compat/config.cpp`. The actual asset provider remains the installed GSRI-Gear addon.

## ACE Arsenal Extended

Project:
https://github.com/jetelain/AceArsenalExtended

**Runtime status: OPTIONAL.**

ACE Arsenal Extended provides gear categorisation/model-option support and configuration patterns used by the RHD GSRI compatibility PBO. It is not an RHD asset source itself; its repository contains configuration for external gear packs and Arsenal organisation.

RHD does not redistribute the ACE Arsenal Extended PBOs. The RHD GSRI compatibility layer uses the XtdGear configuration format so the selected GSRI gear can be grouped more cleanly when ACE Arsenal Extended is installed.

## XEAT_AdminTool interface reference

Project:
https://github.com/xedom/XEAT_AdminTool

The separate RHD administrator panel uses a compact player-list / action-list / value / execute arrangement adapted from the XEAT_AdminTool interface concept.

RHD keeps the required attribution and treats the adapted administrator UI material according to the upstream XEAT APL-SA terms.

## RHD branding artwork

The supplied Kavala artwork is stored at:

`assets/branding/RHDLifeCore.jpg`

Mission branding:

- Name: `RHD - LifeCore`
- Author: `LT. Toad`

`Land_Billboard_F` objects are automatically given the RHD artwork on server startup. An individual Eden object can opt out with:

```sqf
rhd_billboard_skip = true;
```

## Additional Steam Workshop integrations

The project owner supplied these Workshop IDs:

- `1123403138`
- `2618183963`
- `2618122951`
- `2623374243`
- `2623373810`

Their titles, `CfgPatches` names and transitive dependencies are **not guessed**. The Steam pages could not be live-verified in this development environment. See `STEAM_WORKSHOP_DEPENDENCIES.md` for the exact verification boundary.

## Distribution rule

External projects should be installed through their official Arma 3 / Steam distribution channels. Do not unpack their PBOs into the RHD mission folder.

Keep this notice with published RHD releases so the integration and licensing boundaries remain clear.
