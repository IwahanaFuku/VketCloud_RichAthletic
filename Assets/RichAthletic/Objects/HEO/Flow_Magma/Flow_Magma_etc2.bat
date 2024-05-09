md tex_etc\ 
del tex_etc\*.pvr
PVRTexToolCLI.exe -i "tex_sample\000_Magma_Albedo_comp.png" -o tex_etc\000.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI.exe -i "tex_sample\001_Magma_Normal_comp.png" -o tex_etc\001.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
PVRTexToolCLI.exe -i "tex_sample\002_Magma_Emission_comp.png" -o tex_etc\002.pvr -m 16 -f ETC2_RGBA,UBN,sRGB
pause
