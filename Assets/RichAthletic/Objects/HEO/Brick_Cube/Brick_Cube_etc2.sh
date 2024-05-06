#!/bin/sh
mkdir -p tex_etc/ 
rm -f tex_etc/*.pvr
PVRTexToolCLI -i "tex_sample/000_Brick_Albedo.png" -o tex_etc/000.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI -i "tex_sample/001_Brick_Normal.png" -o tex_etc/001.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
