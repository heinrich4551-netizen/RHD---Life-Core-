# RHD - LifeCore — Admin + ACE3 Setup

**Author: LT. Toad**

This guide covers the ACE3 integration and the separate RHD administrator control surface.

## ACE3

RHD detects ACE3 at runtime using `CfgPatches >> ace_main`.

The player-facing RHD tablet requires cTab+; ACE3 provides the interaction layer and privileged admin entry point.

The ACE integration uses ACE's supported interaction-menu functions:

- `ace_interact_menu_fnc_createAction`
- `ace_interact_menu_fnc_addActionToObject`
- `ace_interact_menu_fnc_addActionToClass`
- `ace_common_fnc_canInteractWith`

Recommended server setup is to load CBA_A3, cTab+ and ACE3 before the mission starts.

## Admin authorization

Open `core/fn_init.sqf` and find the clearly marked `RHD_ADMIN_UIDS` section.

Example:

```sqf
missionNamespace setVariable [
    "RHD_ADMIN_UIDS",
    ["76561198012345678"],
    true
];
```

Use Steam64 IDs only. Do not gate administrator access by player name.

## Unified admin panel

The admin panel is `RHD_ADMIN` and uses a compact player-list / action-list / value / execute layout adapted from the XEAT_AdminTool interface concept.

Current controls include:

- Player information
- Heal / restore
- Kill
- Freeze / unfreeze
- Spectate
- Teleport to player
- Teleport player to admin
- Set cash
- Set bank
- Give item
- Set job
- Repair vehicle
- Refuel vehicle
- Spawn vehicle by classname
- Delete target vehicle
- Set world time
- Set weather
- Server announcement

All privileged requests go to the server and the server re-checks the administrator Steam64 UID before execution.

## Admin access

Allowlisted admins receive **RHD Administration** under ACE Self Actions.

Administration is deliberately separate from the player cTab tablet.

No inventory item, special weapon, action-menu entry or dedicated administrator hotkey is required.

## Player cTab access

Players receive **RHD Life Tablet** through the RHD ACE integration. The tablet hosts:

- Status / inventory
- Jobs
- Shop
- Banking
- Services
- District pressure

F6/F7/F8 remain convenience shortcuts into this same cTab-backed surface.

## District / Conflict system

The RHD Conflict layer is an RHD-owned implementation inspired by persistent-world pressure concepts from Antistasi Ultimate.

Editors create districts in Eden with `rhd_zone_*` markers. The server tracks heat, supply, nearby players and nearby Police activity.

The system does not load Antistasi Ultimate PBOs and does not require Antistasi Ultimate at runtime.

## ACE interaction behavior

EMS players receive **RHD EMS: Treat Patient** on player targets, using ACE interaction validity and distance checks while keeping the actual LifeCore treatment authority on the server.

RHD does not replace ACE medical or ACE interaction internals.

## XEAT_AdminTool attribution

The administrator panel's visual structure is adapted from the XEAT_AdminTool administrator dialog layout by Kaj Oskar "xedom" Rusilowski.

Source:
https://github.com/xedom/XEAT_AdminTool

The XEAT project license is Arma Public License Share Alike (APL-SA). See `THIRD_PARTY_NOTICES.md` for the distribution boundary and attribution.

## cTab attribution

cTab+ is a separate project under GPLv2. RHD does not copy cTab addon source; it uses cTab's mission-facing interface functions and places RHD-owned controls on the active tablet display.

Source:
https://github.com/jetelain/cTab

## ACE3 attribution

ACE3 is a separate project licensed primarily under GPLv2 with additional per-folder licenses noted by the project. RHD does not copy ACE3 source; it calls ACE3's public interaction APIs at runtime.

Source:
https://github.com/acemod/ACE3

## Antistasi Ultimate attribution

Antistasi Ultimate source:
https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate

The main project is MIT licensed, but the upstream repository identifies some integrated components under separate licenses. RHD does not copy or modify the restricted APL-ND components.

See `THIRD_PARTY_NOTICES.md` for details.
