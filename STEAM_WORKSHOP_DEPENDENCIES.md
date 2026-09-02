# RHD - LifeCore — Steam Workshop & Dependency Guide

**Author: LT. Toad**

## Hard external dependencies

RHD - LifeCore has exactly two required external Arma 3 Workshop dependencies:

| Component | Steam Workshop ID | Role |
|---|---:|---|
| CBA_A3 | `450814997` | Shared Arma 3 framework used by the RHD integration layer |
| cTab+ | `2262006564` | RHD player tablet interface |

Arma 3 itself is, of course, required because RHD is an Arma 3 addon/mission framework.

## Optional enhancements

These do **not** belong in `CfgPatches.requiredAddons[]` and are detected at runtime:

- Antistasi Ultimate / A3A: enables the Antistasi campaign bridge, campaign status, strategic-state integration and A3A-backed district information.
- ACE3: enables ACE Self Actions and contextual EMS/admin interactions.
- Other equipment/vehicle mods: automatically contribute public Arma configuration classes to the RHD shop/catalogue when installed and loaded.

RHD therefore remains usable with only Arma 3 + CBA_A3 + cTab+. Optional integrations enhance the experience without becoming hard loading dependencies.

## Architecture rule

The RHD addon hard dependency declaration is limited to:

```cpp
requiredAddons[] = {"cba_main", "ctab_core"};
```

Antistasi and ACE are guarded with runtime checks before their functions/classes are used. The Antistasi bridge falls back to a standalone RHD mode when `A3A_core` is not installed.

## cTab integration

The player tablet is built on cTab+'s tablet display and uses RHD-owned controls/pages. The core does not copy cTab source into RHD.

## CBA integration

CBA is treated as the shared framework dependency. RHD does not embed CBA files or replace CBA functionality.

## Recommended load order

```text
Arma 3
  -> CBA_A3
  -> cTab+
  -> optional Antistasi Ultimate / ACE3 / other content mods
  -> RHD - LifeCore
```

The exact launcher order can vary, but all hard dependencies must be loaded before RHD.

## Mission vs external mods

RHD does not redistribute CBA_A3, cTab+, ACE3 or Antistasi PBOs. Install those through Steam Workshop / their normal distribution channel.

## Licensing

See `THIRD_PARTY_NOTICES.md` and the files under `LICENSES/` for the project's third-party licensing boundary.
