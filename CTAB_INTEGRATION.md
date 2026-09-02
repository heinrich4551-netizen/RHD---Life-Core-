# RHD cTab Integration

RHD uses [cTab+](https://github.com/jetelain/cTab) as the player-facing tablet surface. The repository is GPL-2.0 and cTab exposes mission-side functions such as `cTab_fnc_open` for opening its interfaces.

## Required mods

- CBA_A3 3.15 or later
- cTab+
- ACE3 remains optional for the RHD framework, but the RHD ACE integration is enabled automatically when ACE is present.

cTab itself is distributed as an external mod. Do not copy the cTab addon PBOs into this mission repository.

## RHD player tablet

The RHD player UI is a mission overlay hosted by the cTab tablet dialog (`cTab_Tablet_dlg`). The overlay provides one player menu surface for:

- Status and inventory
- Jobs
- RHD Market / shop
- Banking
- Gathering and refining services

The legacy F6/F7/F8 dialogs have been removed from `description.ext`. F6/F7/F8 are retained only as shortcuts that route into cTab pages; they do not create separate RHD dialogs.

The player tablet is also exposed through ACE Self Actions as **RHD Life Tablet**, so a player does not need to carry a cTab item specifically for RHD access.

## Admin access

Administration remains deliberately separate from the player tablet. The `RHD_ADMIN` dialog keeps the compact XEAT-style player/action/value layout and all privileged commands still execute through the UID-gated server dispatcher.

Admins reach it through the ACE Self Actions entry **RHD Administration**. No inventory item and no dedicated keyboard shortcut are required for admin access.

## cTab implementation notes

RHD calls the documented cTab open function rather than modifying cTab source. The mission creates its own controls on the active `cTab_Tablet_dlg` display and cleans them up when the tablet closes.

See cTab documentation and source for its current interface names and behavior:
- https://github.com/jetelain/cTab
- `@cTab/addons/core/functions/fnc_open.sqf`

## Testing

This integration has been source-reviewed against the public cTab repository, but an actual Arma 3 runtime test with CBA_A3 + cTab+ + RHD has not been performed in this environment. Verify the tablet display, ACE Self Actions, F6/F7/F8 routing, and shop/job transactions in a local dedicated-server test before deployment.
