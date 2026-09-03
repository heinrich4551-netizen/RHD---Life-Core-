# RHD Backpack Authoring Assets

The source generator and generated authoring package define the custom-asset target for the 16 RHD backpacks.

Every backpack gets an individual geometry source and individual texture set; no two classes intentionally share the same source asset.

## Target runtime layout

```text
addons/rhd_backpacks/
├── models/
│   ├── RHD_Bag_Ranger.p3d
│   ├── RHD_Bag_Multicam.p3d
│   └── ...
├── textures/
│   ├── RHD_Bag_Ranger_co.paa
│   ├── RHD_Bag_Ranger_nohq.paa
│   ├── RHD_Bag_Ranger_smdi.paa
│   └── ...
├── materials/
│   └── RHD_Bag_*.rvmat
└── config.cpp
```

## Authoring package

The generated local source package contains 16 OBJ meshes and 48 texture-source PNG maps (color, normal and specular) so the native Arma binary conversion can be repeated deterministically.

The current repository keeps the safe, playable backpack config while the custom native conversion is authored with Object Builder/TexView 2. This avoids shipping invalid placeholder binaries.
