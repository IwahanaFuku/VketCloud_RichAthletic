md tex_astc\ 
del tex_astc\*.pvr
PVRTexToolCLI.exe -i "tex_sample\000_Magma_Albedo_comp.png" -o tex_astc\000.pvr -m 16 -f ASTC_4x4,UBN,sRGB
PVRTexToolCLI.exe -i "tex_sample\001_Magma_Normal_comp.png" -o tex_astc\001.pvr -m 16 -f ASTC_4x4,UBN,sRGB
PVRTexToolCLI.exe -i "tex_sample\002_Magma_Emission_comp.png" -o tex_astc\002.pvr -m 16 -f ASTC_4x4,UBN,sRGB
pause
