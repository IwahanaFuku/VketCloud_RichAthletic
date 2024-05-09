#!/bin/sh
mkdir -p tex_etc/ 
rm -f tex_etc/*.pvr
PVRTexToolCLI -i "tex_sample/000_Metal_comp.png" -o tex_etc/000.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI -i "tex_sample/001_Metal_Normal_comp.png" -o tex_etc/001.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
#!/bin/sh
mkdir -p tex_reflection_cube_etc/0/ 
rm -f tex_reflection_cube_etc/0/*.pvr
PVRTexToolCLI -i "./tex_reflection_cube/0/reflection_cube_0.png" -o tex_reflection_cube_etc/0/reflection_cube_0.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI -i "./tex_reflection_cube/0/reflection_cube_1.png" -o tex_reflection_cube_etc/0/reflection_cube_1.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI -i "./tex_reflection_cube/0/reflection_cube_2.png" -o tex_reflection_cube_etc/0/reflection_cube_2.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI -i "./tex_reflection_cube/0/reflection_cube_3.png" -o tex_reflection_cube_etc/0/reflection_cube_3.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI -i "./tex_reflection_cube/0/reflection_cube_4.png" -o tex_reflection_cube_etc/0/reflection_cube_4.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI -i "./tex_reflection_cube/0/reflection_cube_5.png" -o tex_reflection_cube_etc/0/reflection_cube_5.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
