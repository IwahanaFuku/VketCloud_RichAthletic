#!/bin/sh
mkdir -p tex_etc/ 
rm -f tex_etc/*.pvr
PVRTexToolCLI -i "tex_sample/000_Magma_Albedo.png" -o tex_etc/000.pvr -m 16 -f ETC2_RGB,UBN,sRGB
PVRTexToolCLI -i "tex_sample/001_Magma_Normal.png" -o tex_etc/001.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI -i "tex_sample/002_Magma_Emission.png" -o tex_etc/002.pvr -m 16 -f ETC2_RGB,UBN,sRGB
