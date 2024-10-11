@echo off
title Execution Confirmation

echo.
echo Do you want to continue running the script? (y/n)
choice /c yn /m "Press Y to continue or N to cancel."

if %errorlevel% equ 1 goto :fin

:: The rest of your script goes here
md ..\MP4_Files_Moved
for /r %%a in (*.mp4) do move "%%a" ..\MP4_Files_Moved

:fin
echo Script finished.
