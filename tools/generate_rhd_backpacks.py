from __future__ import annotations
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
import math, zipfile, json

ROOT = Path('build/rhd_backpack_assets_source')
MODELS = ROOT / 'models'
TEX = ROOT / 'textures'
DOCS = ROOT / 'docs'
for d in (MODELS, TEX, DOCS):
    d.mkdir(parents=True, exist_ok=True)

profiles = [
    ('RHD_Bag_Ranger','Ranger Green',(0.22,0.25,0.16),1.00,0.90,0.95),
    ('RHD_Bag_Multicam','Multi Terrain',(0.35,0.30,0.20),1.08,1.00,1.05),
    ('RHD_Bag_Black','Black',(0.05,0.05,0.05),1.00,0.95,1.00),
    ('RHD_Bag_Tan','Coyote Tan',(0.48,0.37,0.22),1.05,0.96,1.08),
    ('RHD_Bag_Grey','Wolf Grey',(0.28,0.29,0.28),0.98,0.92,0.98),
    ('RHD_Bag_Woodland','Woodland',(0.15,0.21,0.12),1.10,1.02,1.03),
    ('RHD_Bag_Medic','Medic Green',(0.20,0.28,0.17),1.04,0.98,1.00),
    ('RHD_Bag_Police','Police Navy',(0.03,0.07,0.12),1.00,0.93,1.02),
    ('RHD_Bag_Security','Security Black',(0.04,0.045,0.05),1.02,0.96,1.00),
    ('RHD_Bag_SOF','SOF Tan',(0.34,0.28,0.19),1.10,1.03,1.05),
    ('RHD_Bag_Utility','Olive Drab',(0.20,0.24,0.12),1.15,1.02,1.10),
    ('RHD_Bag_Comms','Comms Multicam',(0.30,0.29,0.20),1.10,1.01,1.04),
    ('RHD_Bag_LMG','LMG Olive',(0.18,0.23,0.12),1.18,1.06,1.07),
    ('RHD_Bag_Marksman','Marksman Tan',(0.40,0.33,0.23),1.12,1.04,1.08),
    ('RHD_Bag_Contractor','Contractor Multicam',(0.31,0.28,0.19),1.12,1.02,1.10),
    ('RHD_Bag_Executive','Executive Black',(0.03,0.03,0.035),1.00,0.90,1.00),
]

def box(x0,y0,z0,x1,y1,z1, verts, faces):
    base = len(verts)
    verts.extend([
        (x0,y0,z0),(x1,y0,z0),(x1,y1,z0),(x0,y1,z0),
        (x0,y0,z1),(x1,y0,z1),(x1,y1,z1),(x0,y1,z1),
    ])
    faces.extend([
        (base+0,base+1,base+2),(base+0,base+2,base+3),
        (base+4,base+6,base+5),(base+4,base+7,base+6),
        (base+0,base+4,base+5),(base+0,base+5,base+1),
        (base+1,base+5,base+6),(base+1,base+6,base+2),
        (base+2,base+6,base+7),(base+2,base+7,base+3),
        (base+3,base+7,base+4),(base+3,base+4,base+0),
    ])

def cyl(cx,cy,cz,r,h,verts,faces,n=8):
    base = len(verts)
    for i in range(n):
        a = 2*math.pi*i/n
        verts.append((cx+r*math.cos(a),cy+r*math.sin(a),cz))
    for i in range(n):
        a = 2*math.pi*i/n
        verts.append((cx+r*math.cos(a),cy+r*math.sin(a),cz+h))
    for i in range(n):
        j = (i+1)%n
        faces.append((base+i,base+j,base+n+j))
        faces.append((base+i,base+n+j,base+n+i))

def make_obj(name, variant, scale):
    sx,sy,sz = scale
    verts=[]; faces=[]
    box(-0.42*sx,-0.18*sy,0,0.42*sx,0.22*sy,1.00*sz,verts,faces)
    box(-0.34*sx,-0.34*sy,0.12*sz,0.34*sx,-0.18*sy,0.42*sz,verts,faces)
    box(-0.28*sx,-0.37*sy,0.02*sz,0.28*sx,-0.18*sy,0.20*sz,verts,faces)
    box(-0.56*sx,-0.14*sy,0.15*sz,-0.42*sx,0.14*sy,0.68*sz,verts,faces)
    box(0.42*sx,-0.14*sy,0.15*sz,0.56*sx,0.14*sy,0.68*sz,verts,faces)
    if variant in {'Comms Multicam','Police Navy','Security Black'}:
        box(-0.22*sx,0.22*sy,0.55*sz,-0.08*sx,0.38*sy,0.90*sz,verts,faces)
        box(0.08*sx,0.22*sy,0.55*sz,0.22*sx,0.38*sy,0.90*sz,verts,faces)
    if variant == 'Medic Green':
        box(-0.20*sx,-0.40*sy,0.42*sz,0.20*sx,-0.18*sy,0.72*sz,verts,faces)
    if variant == 'LMG Olive':
        box(-0.57*sx,0.02*sy,0.36*sz,-0.42*sx,0.20*sy,0.75*sz,verts,faces)
        box(0.42*sx,0.02*sy,0.36*sz,0.57*sx,0.20*sy,0.75*sz,verts,faces)
    if variant in {'Marksman Tan','Contractor Multicam'}:
        box(-0.34*sx,0.20*sy,0.02*sz,0.34*sx,0.36*sy,0.20*sz,verts,faces)
    if variant == 'Executive Black':
        box(-0.31*sx,-0.30*sy,0.46*sz,0.31*sx,-0.18*sy,0.78*sz,verts,faces)
    if variant in {'Ranger Green','Woodland','Olive Drab','SOF Tan'}:
        box(-0.52*sx,-0.18*sy,0.72*sz,-0.42*sx,0.08*sy,0.92*sz,verts,faces)
    if variant in {'Comms Multicam','Police Navy','LMG Olive','Security Black'}:
        cyl(0.30*sx,0.24*sy,0.90*sz,0.018,0.52*sz,verts,faces)
    for x in (-0.32,0.32):
        box(x*sx-0.035*sx,-0.01*sy,0.75*sz,x*sx+0.035*sx,0.08*sy,1.05*sz,verts,faces)
    out=MODELS/f'{name}.obj'
    with out.open('w',encoding='utf-8') as f:
        f.write(f'# RHD LifeCore custom backpack source mesh: {name}\n')
        f.write(f'# variant={variant}\n')
        for v in verts: f.write(f'v {v[0]:.5f} {v[1]:.5f} {v[2]:.5f}\n')
        for a,b,c in faces: f.write(f'f {a+1} {b+1} {c+1}\n')

def make_texture(name, variant, rgb):
    w=h=1024
    base=tuple(int(c*255) for c in rgb)
    im=Image.new('RGB',(w,h),base); d=ImageDraw.Draw(im)
    dark=tuple(max(0,c-25) for c in base); light=tuple(min(255,c+18) for c in base)
    for y in range(0,h,32):
        for x in range(0,w,32):
            if ((x//32)+(y//32))%2==0:
                d.rectangle([x,y,x+15,y+15],fill=dark)
    for x in range(24,w,80): d.rectangle([x,0,x+9,h],fill=dark)
    for y in range(24,h,64): d.rectangle([0,y,w,y+8],fill=dark)
    for margin in (30,80,150,230):
        d.rectangle([margin,margin,w-margin,h-margin],outline=light,width=3)
    px0,py0,px1,py1=60,760,380,940
    d.rounded_rectangle([px0,py0,px1,py1],radius=18,fill=tuple(max(0,c-45) for c in base),outline=light,width=4)
    font=ImageFont.load_default()
    d.text((px0+20,py0+20),'RHD',fill='white',font=font)
    d.text((px0+20,py0+60),variant.upper(),fill='white',font=font)
    if 'Medic' in variant:
        d.rectangle([px0+220,py0+20,px0+300,py0+100],fill=(190,30,30)); d.text((px0+242,py0+42),'+',fill='white',font=font)
    elif 'Police' in variant:
        d.rectangle([px0+210,py0+20,px0+310,py0+100],fill=(50,75,120)); d.text((px0+232,py0+45),'PD',fill='white',font=font)
    elif 'Security' in variant:
        d.rectangle([px0+205,py0+20,px0+315,py0+100],fill=(20,20,20)); d.text((px0+220,py0+45),'SEC',fill='white',font=font)
    if 'Executive' in variant:
        d.rectangle([px0+400,py0+20,px0+660,py0+95],fill=(18,18,22),outline=light,width=2); d.text((px0+425,py0+45),'EXECUTIVE',fill='white',font=font)
    if 'LMG' in variant:
        for i in range(6): d.rounded_rectangle([420+i*35,740,445+i*35,810],radius=5,fill=(40,40,35),outline=light)
    im.save(TEX/f'{name}_co.png')
    Image.new('RGB',(w,h),(128,128,255)).save(TEX/f'{name}_nohq.png')
    Image.new('RGB',(w,h),(80,80,80)).save(TEX/f'{name}_smdi.png')

for name,variant,rgb,sx,sy,sz in profiles:
    make_obj(name,variant,(sx,sy,sz)); make_texture(name,variant,rgb)

(DOCS/'BUILD_ASSETS.md').write_text('''# RHD LifeCore Custom Backpack Asset Build\n\nGenerates 16 distinct backpack source meshes and per-item texture source maps.\n\nProduction conversion requires Bohemia Interactive Arma 3 Tools/Object Builder for `.p3d` and TexView 2 for `.paa`. The generated source is intentionally kept in authoring formats rather than pretending PNG/OBJ files are native Arma binaries.\n''',encoding='utf-8')
(ROOT/'manifest.json').write_text(json.dumps({'count':16,'maximumLoad':150,'items':[p[0] for p in profiles]},indent=2),encoding='utf-8')
print(ROOT)
