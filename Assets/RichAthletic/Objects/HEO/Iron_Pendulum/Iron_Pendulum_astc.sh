#!/bin/sh
mkdir -p tex_astc/ 
rm -f tex_astc/*.pvr
PVRTexToolCLI -i "tex_sample/000_Metal.png" -o tex_astc/000.pvr -m 16 -f ASTC_4x4,UBN,sRGB
PVRTexToolCLI -i "tex_sample/001_Metal_Normal.png" -o tex_astc/001.pvr -m 16 -f ASTC_4x4,UBN,sRGB
#!/bin/sh
mkdir -p tex_reflection_cube_astc/0/ 
rm -f tex_reflection_cube_astc/0/*.pvr
PVRTexToolCLI -i "./tex_reflection_cube/0/reflection_cube_0.png" -o tex_reflection_cube_astc/0/reflection_cube_0.pvr -m 16 -f ASTC_4x4,UBN,sRGB
PVRTexToolCLI -i "./tex_reflection_cube/0/reflection_cube_1.png" -o tex_reflection_cube_astc/0/reflection_cube_1.pvr -m 16 -f ASTC_4x4,UBN,sRGB
PVRTexToolCLI -i "./tex_reflection_cube/0/reflection_cube_2.png" -o tex_reflection_cube_astc/0/reflection_cube_2.pvr -m 16 -f ASTC_4x4,UBN,sRGB
PVRTexToolCLI -i "./tex_reflection_cube/0/reflection_cube_3.png" -o tex_reflection_cube_astc/0/reflection_cube_3.pvr -m 16 -f ASTC_4x4,UBN,sRGB
PVRTexToolCLI -i "./tex_reflection_cube/0/reflection_cube_4.png" -o tex_reflection_cube_astc/0/reflection_cube_4.pvr -m 16 -f ASTC_4x4,UBN,sRGB
PVRTexToolCLI -i "./tex_reflection_cube/0/reflection_cube_5.png" -o tex_reflection_cube_astc/0/reflection_cube_5.pvr -m 16 -f ASTC_4x4,UBN,sRGB
