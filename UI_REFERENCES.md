# RHD UI Reference Notes

RHD uses independently written UI code. Existing Arma 3 Life projects were reviewed for proven layout and usability patterns.

## Visual option A — Classic Life

Inspired by the long-running Altis Life convention of a large player dashboard with clear account, license/inventory and action sections.

Reference:
- AsYetUntitled/Framework — player inventory layout: https://github.com/AsYetUntitled/Framework/blob/v5.X.X/Altis_Life.Altis/dialog/player_inv.hpp

Important license note:
The current AsYetUntitled framework license is CC BY-NC-ND 4.0. RHD does not copy or adapt its source code. The reference is used only to evaluate established UI conventions.

## Visual option B — Tablet Slate

Inspired by Scarso327's tablet approach: a dark slate application surface, compact navigation, account information at the top and modular screens.

Reference:
- Scarso327/AltisLife-Framework — DialogTablet.hpp: https://github.com/Scarso327/AltisLife-Framework/blob/master/Client%20Side/Framework/UI/DialogTablet/DialogTablet.hpp

The Scarso327 framework is MIT licensed. RHD does not depend on ULP and does not import its framework code; only general UI structure was used as a design reference.

## Visual option C — Minimal Ops

Inspired by the concept behind the small always-visible Altis Life status bar: keep critical information available without opening a menu.

Reference:
- midgetgrimm/AltisLife-StatusBar: https://github.com/midgetgrimm/AltisLife-StatusBar

The referenced project itself states that it is outdated and recommends newer alternatives, so RHD only follows the lightweight status-bar concept and uses its own implementation.

## RHD implementation

All RHD UI logic lives under `core/ui`.

- `fn_openMenu.sqf` — themed F6 player dashboard.
- `fn_refresh.sqf` — themed F7 job list.
- `core/economy/fn_shopOpen.sqf` — themed F8 shop.
- `fn_setTheme.sqf` — local theme selector using Profile Namespace.
- `fn_initHud.sqf` — lightweight always-visible status HUD, refreshed every 2 seconds.

Themes are local to each player. Changing a theme does not affect server gameplay, persistence, AI, or network traffic beyond the normal UI actions.
