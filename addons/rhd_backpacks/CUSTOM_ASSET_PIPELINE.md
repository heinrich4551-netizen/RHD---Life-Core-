# RHD LifeCore Custom Backpack Asset Pipeline

The 16 RHD backpack classes are intended to become fully custom, RHD-owned assets rather than simple aliases of BIS backpack geometry.

## 16 production item classes

- `RHD_Bag_Ranger`
- `RHD_Bag_Multicam`
- `RHD_Bag_Black`
- `RHD_Bag_Tan`
- `RHD_Bag_Grey`
- `RHD_Bag_Woodland`
- `RHD_Bag_Medic`
- `RHD_Bag_Police`
- `RHD_Bag_Security`
- `RHD_Bag_SOF`
- `RHD_Bag_Utility`
- `RHD_Bag_Comms`
- `RHD_Bag_LMG`
- `RHD_Bag_Marksman`
- `RHD_Bag_Contractor`
- `RHD_Bag_Executive`

All are `CfgVehicles` backpack items with `scope = 2`, `scopeArsenal = 2`, and `maximumLoad = 150`.

## Source generation

`tools/generate_rhd_backpacks.py` generates 16 distinct low-poly authoring meshes and three per-item texture source maps:

- `<class>.obj` — custom geometry source
- `<class>_co.png` — custom color/albedo source
- `<class>_nohq.png` — normal-map source
- `<class>_smdi.png` — specular/roughness source

The generated geometry includes role-specific pouch arrangements, radio/antenna elements, medical/admin compartments, ammunition support features, and executive/laptop features.

## Native Arma conversion

OBJ/PNG are authoring formats, not Arma runtime formats. The final production conversion must be performed with the Bohemia Interactive Arma 3 tools:

1. Import and finish the mesh in Blender/Object Builder.
2. Perform final retopology, UV mapping, normals and named selections.
3. Export a valid Arma `.p3d` model.
4. Convert the texture source maps to `.paa` in TexView 2.
5. Create/update `.rvmat` material files.
6. Point the `CfgVehicles` classes at the generated RHD `.p3d` and `.paa` files.
7. Rebuild the `rhd_rhd_backpacks.pbo` and run the repository PBO checks.

The repository deliberately does **not** create fake `.p3d` or `.paa` files by renaming OBJ/PNG files. Invalid native binaries would break Arma in the same way as the earlier malformed PBOs.

## Visual reference

The 16-item concept sheet supplied for this project is the design reference for the custom silhouettes, pouch layout, camouflage families and role variants. The release build can continue using the current safe BIS-base classes until the native conversion step is completed.
