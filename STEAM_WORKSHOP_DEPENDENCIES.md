# RHD - LifeCore — Steam Workshop & Dependency Guide

**Author: LT. Toad | Published profile: Altis + Antistasi Ultimate**

## Hard external dependencies

The published RHD - LifeCore mod requires these external Arma 3 Workshop items:

| Component | Steam Workshop ID | Role | Required |
|---|---:|---|---|
| CBA_A3 | `450814997` | Shared framework | **Yes** |
| cTab+ | `2262006564` | RHD player tablet/UI host | **Yes** |
| Antistasi Ultimate | `3020755032` | Strategic campaign framework for the published scenario | **Yes** |
| ACE3 | — | Optional interaction enhancement | No |

The RHD addon declaration is:

```cpp
requiredAddons[] = {"cba_main", "ctab_core", "A3A_core"};
```

## Steam Workshop publishing requirement

When creating/updating the RHD Workshop item, add these three Workshop IDs as **required dependencies** in Steam's dependency settings:

```text
450814997  CBA_A3
2262006564 cTab+
3020755032 Antistasi Ultimate
```

Do not mark ACE3 as a required dependency.

Steam maintains dependency metadata separately from the mod files. The RHD `CfgPatches` declaration provides a second runtime safeguard inside Arma 3.

## Recommended load order

```text
Arma 3
  -> CBA_A3
  -> cTab+
  -> Antistasi Ultimate
  -> RHD - LifeCore
  -> optional ACE3 / other mission content
```

The exact Launcher ordering may vary, but all required dependencies must be loaded with RHD.

## What RHD owns

RHD provides:

```text
Life RP player state
cash and banking
jobs and salaries
farming / mining / refining
virtual market
vehicle/equipment shops
police / EMS RP
district crime/heat layer
ambient life
cTab RHD tablet
UID-gated administration
RHD clothing
RHD branding
```

## What Antistasi Ultimate owns

A3A remains authoritative for:

```text
campaign lifecycle
strategic zone state
faction control
garrisons / patrols / QRFs
aggression
campaign resources
HQ/Petros
campaign persistence
```

RHD integrates with this state rather than implementing a second strategic campaign engine.

## ACE3

ACE3 is detected at runtime. RHD adds ACE interaction surfaces when ACE3 is installed but does not require ACE3 for addon loading.

## Distribution boundary

RHD does not redistribute the PBOs of CBA_A3, cTab+, Antistasi Ultimate or ACE3. Install those dependencies through Steam Workshop or their normal distribution channel.
