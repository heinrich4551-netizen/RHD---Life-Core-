# RHD Life — Performance Architecture

RHD Life is designed around **local simulation bubbles**, not a full-island AI population.

## Ambient limits

The ambient director uses hard global caps:

- Day: 10 civilian actors and 4 traffic vehicles.
- Night: 5 civilian actors and 2 traffic vehicles.
- Roadside incidents: 2 maximum.
- Ambient entities spawn only around active players.
- Entities are removed after leaving the active radius or aging out.

These values are intentionally conservative. Increase them only after measuring server FPS and client performance on the target hardware.

## Why this approach works

The system avoids placing hundreds of AI units in Eden or running a permanent patrol simulation over the entire map. AI pathfinding and group management therefore scale with the number of players who are actually in the world instead of the size of the terrain.

Ambient civilians reuse one server-side civilian group. Temporary incidents are short-lived and are not part of the core economy or player persistence systems.

## 3DEN recommendations

Use Eden for the permanent world: buildings, roads, shops, banks, stations, farms, mines, refineries and decorative traffic.

Keep permanent ambient AI to a minimum. Let RHD create temporary life near players instead. Avoid placing large numbers of disabled or hidden AI units just to make towns look populated.

## Server testing

Profile the mission with the intended player count before raising limits. Pay attention to server FPS, client FPS in populated towns, AI count, and network traffic.

The safe tuning order is:

1. Add more permanent scenery before adding more AI.
2. Raise ambient civilian limits slowly.
3. Raise traffic limits only after AI pathfinding remains stable.
4. Keep rare incidents capped even on high-population servers.

## Multiplayer safety

Economy, inventory, bank, jobs, gathering, refining and dispatch decisions remain server authoritative. Ambient systems do not grant money, inventory or persistent ownership.
