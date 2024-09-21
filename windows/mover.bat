@echo off
title Confirmación de Ejecución

echo.
echo ¿Deseas continuar con la ejecución del script? (s/n)
choice /c yn /m "Presiona S para continuar o N para cancelar."

if %errorlevel% equ 1 goto :fin

:: Aquí va el resto de tu script
md ..\Archivos_MP4_Movidos
for /r %%a in (*.mp4) do move "%%a" ..\Archivos_MP4_Movidos

:fin
echo Script finalizado.
