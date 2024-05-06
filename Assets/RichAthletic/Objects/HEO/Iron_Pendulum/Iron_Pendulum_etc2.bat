md tex_etc\ 
del tex_etc\*.pvr
PVRTexToolCLI.exe -i "tex_sample\000_Metal.png" -o tex_etc\000.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI.exe -i "tex_sample\001_Metal_Normal.png" -o tex_etc\001.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
md tex_reflection_cube_etc\0\ 
del tex_reflection_cube_etc\0\*.pvr
PVRTexToolCLI.exe -i ".\tex_reflection_cube\0\reflection_cube_0.png" -o tex_reflection_cube_etc\0\reflection_cube_0.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI.exe -i ".\tex_reflection_cube\0\reflection_cube_1.png" -o tex_reflection_cube_etc\0\reflection_cube_1.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI.exe -i ".\tex_reflection_cube\0\reflection_cube_2.png" -o tex_reflection_cube_etc\0\reflection_cube_2.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI.exe -i ".\tex_reflection_cube\0\reflection_cube_3.png" -o tex_reflection_cube_etc\0\reflection_cube_3.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI.exe -i ".\tex_reflection_cube\0\reflection_cube_4.png" -o tex_reflection_cube_etc\0\reflection_cube_4.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI.exe -i ".\tex_reflection_cube\0\reflection_cube_5.png" -o tex_reflection_cube_etc\0\reflection_cube_5.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
pause
