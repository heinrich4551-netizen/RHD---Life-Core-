# RHD - LifeCore Master Life RP + Antistasi Ultimate Module

RHD - LifeCore now uses one optional 3DEN controller module for missions that run Antistasi Ultimate.

## Module

Place exactly one:

`RHD - LifeCore | Master Life RP + Antistasi Ultimate`

The module is defined by `RHD_Module_LifeCoreAntistasi` and runs `RHD_fnc_moduleLifeCoreAntistasi`.

## What the module controls

The module controls the RHD Life RP layer and its connection to the live Antistasi Ultimate campaign:

- Economy / Shops
- Jobs
- Farming / Mining / Refining
- Police / EMS / RP
- Persistence
- Ambient life
- RHD branding
- cTab player tablet
- Crime / conflict pressure
- RHD dynamic locations
- RHD-to-A3A campaign-state bridge

Each system can be enabled or disabled from the module attributes.

## Antistasi ownership

Antistasi Ultimate remains authoritative for its strategic campaign engine. The RHD module does **not** start a second Antistasi campaign when a native A3A mission is already running.

The controller waits for `serverInitDone`, attaches RHD to the A3A state, initializes the RHD bridge, and then starts the RHD terrain/location layer.

## Startup requirement

RHD no longer silently auto-enables the Life RP stack when the master module is absent. This prevents the addon from fighting with mission-side Antistasi initialization.

For a native Antistasi Ultimate mission:

1. Load CBA_A3, cTab+, Antistasi Ultimate, and RHD - LifeCore.
2. Open the Antistasi mission in Eden.
3. Place one `RHD - LifeCore | Master Life RP + Antistasi Ultimate` module.
4. Leave the default settings enabled for the full RHD RP stack.
5. Save and host the mission normally.

The two older RHD bridge/Life modules are retained only for compatibility with existing bundled missions and are hidden from the editor.

## UI/config safety

The RHD addon PBO no longer defines `RscStructuredText`, `RscText`, `RscListbox`, `RscButton`, `RscEdit`, or `RscCombo` based controls and no longer contains an addon-level `RscTitles` definition. This isolates the addon from mission UI config ordering and prevents the previous `Undefined base class 'RscStructuredText'` startup failure.
