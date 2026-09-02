# RHD - LifeCore | Police Equipment v1

**Author:** LT. Toad  
**Status:** Design / reference phase — no final 3D models committed yet

## Scope

RHD Police Equipment v1 establishes the production specification for a modular police equipment family intended for Arma 3 and later integration with the RHD - LifeCore F6/F7/F8 systems.

The visual direction follows the supplied tactical references: modern plate carriers, modular MOLLE, low-profile patrol configurations, response/SWAT configurations, helmets, radios, utility pouches, and subdued RHD branding.

## Production rule

No third-party model is to be repackaged into RHD - LifeCore until its repository/asset license explicitly permits the intended modification and redistribution. Public availability alone is not treated as permission.

## Equipment families

1. Patrol uniform
2. Modular patrol vest / plate carrier
3. Duty belt
4. Patrol cap
5. Tactical helmet
6. Patrol backpack
7. Shoulder/handheld radio
8. Badge / identifier system
9. Service pistol
10. Patrol carbine
11. Magazines and weapon attachments
12. Night-vision compatibility layer

## 35-slot customization target

The customization system is designed around 35 independent equipment options/slots. These are configuration targets, not a promise that every slot will be physically present on every variant.

### Vest / carrier slots

1. Front plate profile
2. Rear plate profile
3. Front placard
4. Rifle magazine cell 1
5. Rifle magazine cell 2
6. Rifle magazine cell 3
7. Pistol magazine cell 1
8. Pistol magazine cell 2
9. Radio pouch
10. Admin pouch
11. Medical pouch
12. Evidence pouch
13. Handcuff pouch
14. Utility pouch left
15. Utility pouch right
16. Tourniquet holder
17. Breaching/tool pouch
18. Flashlight holder
19. Chem-light/marker holder
20. Side/cummerbund panel
21. Rear MOLLE panel
22. Identifier panel
23. Rank panel
24. Unit/agency patch panel
25. Armor color/material variant
26. Shoulder accessory mount
27. Chest accessory mount
28. Cable routing / comms detail
29. Back panel identifier
30. Loadout preset A
31. Loadout preset B
32. Loadout preset C
33. Loadout preset D
34. Low-profile/no-armor preset
35. Heavy-response preset

## Initial class naming

```text
RHD_Police_Uniform
RHD_Police_Vest
RHD_Police_Vest_Patrol
RHD_Police_Vest_Tactical
RHD_Police_Vest_Supervisor
RHD_Police_Vest_Response
RHD_Police_DutyBelt
RHD_Police_Cap
RHD_Police_Helmet
RHD_Police_Backpack
RHD_Police_Radio
RHD_Police_Badge
RHD_Police_Pistol
RHD_Police_Carbine
```

## Model standards

Each final P3D must be authored with Arma-appropriate geometry, Memory, Geometry, Fire Geometry, View Geometry, ShadowVolume, and distance LODs as applicable. Weapon models must have correct memory points and attachment/proxy positions.

## Texture standards

Development master: 4096px where useful. Release target: 2048px or lower when visual quality allows.

```text
*_co.paa     Base color / albedo
*_nohq.paa   Normal map
*_smdi.paa   Specular / gloss / metallic data
*.rvmat      Arma material definition
```

RHD branding should use shared texture assets where practical so agency, rank, unit, and identifier variants can be changed without remodeling the base equipment.

## Dependencies

The existing RHD - LifeCore core addon currently declares A3A Core, CBA, ACE, and cTab as required dependencies. fileciteturn10file0L1-L2

The user-specified Workshop customization dependency is **Steam Workshop ID 3352708204**. Its exact addon class/API contract still needs to be verified before a hard `requiredAddons[]` entry is written.

The user-specified night-vision dependency is **Steam Workshop ID 2260572637**. Its exact addon class/API contract still needs to be verified before a hard dependency is written.

## Public-source policy

Use public Arma repositories as source candidates only after license review. For example, the Epoch codebase explicitly identifies APL-SA licensing in its Arma configuration sources, while the F3 project grants a non-exclusive license for non-commercial ArmA 3 simulation content. These are useful examples of license-aware source handling, but neither should be treated as blanket permission to copy unrelated third-party assets. fileciteturn15file12L158-L165 fileciteturn11file6L95-L103

The RHD project already maintains `LICENSES/` and `THIRD_PARTY_NOTICES.md`; source attribution should be recorded there for every adopted asset.

## Current state

Reference selection is required before the first vest/carrier mesh is finalized. The six reference concepts supplied in this design phase are:

- 01 — Patrol Modular
- 02 — Tactical MOLLE
- 03 — Covert / Low Profile
- 04 — SWAT / Response
- 05 — Supervisor
- 06 — Modular Duty System

After selection, the chosen silhouette becomes the master vest/carrier model and the other variants inherit from that design language.
