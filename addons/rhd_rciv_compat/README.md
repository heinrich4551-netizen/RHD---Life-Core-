# RHD - LifeCore | RCiv Compatibility

This optional addon integrates the separately installed **RCiv - Realistic Civilians** Workshop addon with the RHD - LifeCore Antistasi Ultimate profile.

## What it does

- Detects `A3A_core` / RHD Antistasi state before changing RCiv runtime behavior.
- Disables RCiv's independent civilian spawner while Antistasi is active so RHD does not create a second civilian population outside A3A control.
- Leaves RCiv's global AI explosion override disabled.
- Marks known Antistasi-managed civilian units with `rciv_blacklist` and removes them from the RCiv ambient brain if they were registered before A3A finished initializing.
- Leaves Antistasi's own campaign AI, civilian spawning and strategic state authoritative.

## Installation

Install the RCiv Workshop addon separately, then load this PBO with RHD - LifeCore. The RCiv PBO itself is not redistributed by RHD.

The bridge expects RCiv's published `RCiv` CfgPatches name and RHD's required Antistasi Ultimate profile.

## Redistribution boundary

The bridge was authored from an inspection of the user-supplied RCiv package (`publishedid = 3690291228`). The bridge contains no RCiv P3D, PAA, audio or original RCiv script binaries.

RCiv author attribution remains external to RHD; RHD does not claim ownership of RCiv.
