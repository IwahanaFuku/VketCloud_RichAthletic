#!/bin/sh
mkdir -p tex_astc/ 
rm -f tex_astc/*.pvr
PVRTexToolCLI -i "tex_sample/000_Brick_Albedo_comp.png" -o tex_astc/000.pvr -m 16 -f ASTC_4x4,UBN,sRGB
PVRTexToolCLI -i "tex_sample/001_Brick_Normal_comp.png" -o tex_astc/001.pvr -m 16 -f ASTC_4x4,UBN,sRGB
