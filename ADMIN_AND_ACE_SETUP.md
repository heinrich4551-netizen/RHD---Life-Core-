# RHD Admin + ACE3 Setup

## ACE3

RHD detects ACE3 at runtime using `CfgPatches >> ace_main`. The player-facing RHD tablet requires cTab+; ACE adds the RHD interaction layer and privileged admin entry point.

The ACE integration uses ACE's supported interaction-menu functions:

- `ace_interact_menu_fnc_createAction`
- `ace_interact_menu_fnc_addActionToObject`
- `ace_interact_menu_fnc_addActionToClass`
- `ace_common_fnc_canInteractWith`

Recommended mod order for a server using ACE3 is to load CBA_A3, cTab+ and ACE3 with their normal dependencies before the mission starts.

## Admin authorization

Open `core/fn_init.sqf` and change:

```sqf
missionNamespace setVariable ["RHD_ADMIN_UIDS", [], true];
```

to:

```sqf
missionNamespace setVariable ["RHD_ADMIN_UIDS", ["7656119XXXXXXXXXX"], true];
```

Use Steam64 IDs only. Do not gate the admin panel by player name.

## Unified admin panel

The admin panel is `RHD_ADMIN` and is intentionally modeled after the compact XEAT_AdminTool layout: player list on the left, action list on the right, then a shared value/item/job area and one Execute button.

Available controls currently include:

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

All privileged requests are sent to the server and re-check the admin UID before execution. The normal civilian/player UI has no path to these actions.

## Admin access

Allowlisted admins receive **RHD Administration** under ACE self-interactions. This is deliberately separate from the cTab player tablet and does not require an inventory item or a dedicated keyboard shortcut.

## Player cTab access

All players receive **RHD Life Tablet** under ACE self-interactions. The RHD UI is hosted on cTab's `cTab_Tablet_dlg` and provides the player status/inventory, jobs, shop, bank and services pages in one surface.

F6/F7/F8 remain convenience shortcuts into the same cTab-backed surface; they do not create separate RHD dialogs.

## ACE interaction behavior

EMS players receive **RHD EMS: Treat Patient** on player targets, using ACE's interaction-distance/interaction validity checks and the existing RHD server-side treatment authority.

RHD does not replace ACE medical or ACE interaction internals. It uses ACE as the interaction layer and keeps the Life rules in RHD.

## XEAT_AdminTool attribution

The visual structure of `RHD_ADMIN` is an adaptation of the XEAT_AdminTool administrator dialog layout by Kaj Oskar "xedom" Rusilowski.

Source: https://github.com/xedom/XEAT_AdminTool

The XEAT project license is Arma Public License Share Alike (APL-SA). Its license requires attribution, Arma-only use, noncommercial use, and ShareAlike for adapted material. RHD therefore keeps the attribution here and treats the adapted administrator UI source as APL-SA material.

## cTab attribution

cTab+ is a separate project under GPLv2. RHD does not copy cTab addon source; it uses cTab's public mission-facing function `cTab_fnc_open` and hosts RHD-owned controls on the active tablet display.

Source: https://github.com/jetelain/cTab

See `CTAB_INTEGRATION.md` for the player UI integration and testing notes.

## ACE3 attribution

ACE3 is a separate project licensed primarily under GPLv2, with additional per-folder licenses noted by the project. RHD does not copy ACE3 source; it calls ACE3's public interaction APIs at runtime.

Source: https://github.com/acemod/ACE3
