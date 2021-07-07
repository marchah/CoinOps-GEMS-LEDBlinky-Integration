@echo off
call ..\config.cmd
set rom_path=%1
set rom_name=%2

set "EMULATOR_PATH=..\..\Emulators Official\redream"

cd..\..\LEDBlinky
if %is_ledblinky_activated%==1 (
  start "" LEDBlinky.exe %rom_name% Sega_Dreamcast
)

cd "%EMULATOR_PATH%"
start /wait /B "" redream.exe -fullscreen %rom_path%

:WAITLOOP
tasklist /FI "IMAGENAME eq redream.exe" 2>NUL | find /I /N "redream.exe">NUL
if "%ERRORLEVEL%"=="0" goto RUNNING
goto NOTRUNNING

:RUNNING
timeout /t 5
goto WAITLOOP

:NOTRUNNING
cd..\..\plugins\LEDBlinky
if %is_ledblinky_activated%==1 (
  start "" LEDBlinky.exe %frontend_default_animation%
)