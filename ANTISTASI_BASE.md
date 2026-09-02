# Antistasi Ultimate Integration — RHD LifeCore

**RHD - LifeCore | Author: LT. Toad | Version 2.1.1**

Antistasi Ultimate is an **optional integration**, not the base dependency of RHD.

## Supported modes

```text
STANDALONE
  RHD Life RP runs by itself.
  A3A is not required.

ANTISTASI
  A3A is installed and the RHD Antistasi Ultimate Bridge module is placed.
  A3A remains authoritative for strategic campaign state.
```

RHD's own state includes player identity, cash/bank, jobs, virtual resources, shops, Police/EMS RP, district pressure, tablet, branding and UID-gated administration.

## How RHD uses A3A

When the optional bridge is enabled, RHD waits for the Antistasi campaign to report `serverInitDone` before exposing campaign-backed state. This keeps RHD from creating a second strategic simulation alongside A3A.

Selected RHD operations may use public A3A interfaces for aggression/resources/safe vehicle spawning when those interfaces exist.

For vehicle purchases:

```text
A3A active + public safe spawn available -> A3A safe spawn
A3A absent or bridge unused               -> RHD base-game safe spawn fallback
```

## 3DEN bridge module

Place:

`Systems -> RHD - LifeCore -> RHD - LifeCore | Antistasi Ultimate Bridge (Optional)`

The bridge exposes three editor settings:

```text
Use Antistasi Ultimate when installed
Create Antistasi HQ Anchors
Enable Antistasi Terrain Adapter
```

Do not place this module just because A3A happens to be installed. Omit it for a pure standalone RHD mission.

## Terrain handling

When A3A is active, its terrain-specific `mapInfo` should remain the preferred source of strategic map metadata. RHD can provide a generic fallback through the bridge for common infrastructure detection.

A generic fallback is not a replacement for terrain-specific A3A data for unusual airports, building layouts, faction definitions or other specialized campaign behavior.

## Source boundary

The pinned Git submodule under `vendor/antistasi-ultimate` is a development/auditing reference. It is not copied into the RHD runtime package and does not turn A3A into a hard dependency.

See `LICENSES/ANTISTASI_ULTIMATE_LICENSE.txt` and `THIRD_PARTY_NOTICES.md` for distribution boundaries.
