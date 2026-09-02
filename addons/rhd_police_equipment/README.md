# RHD - LifeCore | Police Equipment v1

## Master design selected: Option 06 — Modular Duty System

This addon is the design/implementation home for RHD Police Equipment v1. The master carrier is a modular duty platform intended to support interchangeable placards, MOLLE side panels, radio, medical, admin, evidence and utility components.

### Design goals

- RHD-branded but visually grounded in real-world police/tactical equipment.
- Modular construction so one base carrier supports multiple police roles.
- Configuration-first Arma implementation; final P3Ds are not locked until the reference gate is approved.
- No third-party asset is copied into the repository unless its license explicitly permits modification and redistribution.
- Night vision will be integrated through the requested NODS / Night Operations Workshop dependency rather than duplicated.

### Planned variants

- RHD Police Patrol
- RHD Police Supervisor
- RHD Police Tactical
- RHD Police Response
- RHD Police Low Visibility

### Planned customization points

1. front placard
2. left magazine panel
3. right magazine panel
4. radio pouch
5. admin pouch
6. medical pouch
7. evidence pouch
8. handcuff pouch
9. tourniquet carrier
10. utility pouch
11. grenade/chemical pouch
12. flashlight mount
13. side MOLLE left upper
14. side MOLLE left lower
15. side MOLLE right upper
16. side MOLLE right lower
17. rear identifier panel
18. rear utility pouch
19. shoulder identifier left
20. shoulder identifier right
21. rank tab
22. name tab
23. badge panel
24. unit panel
25. antenna routing point
26. hydration routing point
27. cable/comm routing point
28. low-profile cummerbund
29. heavy-response cummerbund
30. plate cover style
31. placard colorway
32. webbing colorway
33. hardware colorway
34. RHD insignia state
35. camouflage/material preset

## Reference gate

Before each production model is finalized, six visual reference options should be presented for approval. The selected option becomes the model target and is then translated into Blender/Object Builder geometry, PBR textures, Arma selections and config classes.

## Asset sourcing policy

Public GitHub sources may be used as design or technical references. Actual source assets are only incorporated after checking the upstream license and redistribution terms. Source/license evidence is recorded in `SOURCE_AUDIT.md`.

## Current status

**Design locked:** Option 06.

**3D modeling:** not locked yet.

**Next production gate:** approve the detailed Option 06 carrier silhouette and texture treatment, then create the production UV/material specification.