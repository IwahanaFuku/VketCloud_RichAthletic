md tex_etc\ 
del tex_etc\*.pvr
PVRTexToolCLI.exe -i "tex_sample\000_Brick_Albedo.png" -o tex_etc\000.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI.exe -i "tex_sample\001_Brick_Normal.png" -o tex_etc\001.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
pause
