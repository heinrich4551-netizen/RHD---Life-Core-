# RHD - LifeCore | RCiv / Antistasi Ultimate Integration

The user-supplied **RCiv - Realistic Civilians** package (Steam Workshop `3690291228`) is supported through the optional `rhd_rciv_compat` addon.

## Architecture

RHD does **not** repackage the RCiv PBO. Install RCiv from Steam separately, then load the RHD RCiv compatibility PBO.

The bridge requires the published `RCiv` and `A3A_core` addon identifiers plus CBA. It leaves Antistasi Ultimate authoritative for campaign AI and civilian lifecycle.

When Antistasi is detected, the bridge:

- disables RCiv's independent civilian spawner;
- keeps RCiv's all-AI explosion override disabled;
- marks known Antistasi-managed civilians with `rciv_blacklist`;
- removes any matching civilian from `RCIV_activeUnits` if RCiv registered it before A3A finished initialization.

This avoids a second civilian population or an RCiv AI brain taking control of A3A-managed civilians.

## Install

1. Install CBA_A3, cTab+, Antistasi Ultimate and RHD - LifeCore as normal.
2. Install RCiv - Realistic Civilians from Steam Workshop (`3690291228`).
3. Build or install `rhd_rhd_rciv_compat.pbo` from `addons/rhd_rciv_compat`.
4. Place the bridge PBO in your RHD `addons` load path.

The GitHub workflow `.github/workflows/rciv-compat.yml` builds and validates a standalone optional package on every main-branch update.
