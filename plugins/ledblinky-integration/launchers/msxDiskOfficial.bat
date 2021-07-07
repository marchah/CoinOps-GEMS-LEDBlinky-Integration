@echo off
call ..\config.cmd
set rom_directory_path=%~1
set rom_name=%2

set "EMULATOR_PATH=..\..\Emulators Official\mame"

cd..\..\LEDBlinky
if %is_ledblinky_activated%==1 (
  start "" LEDBlinky.exe %rom_name% Microsoft_MSX
)


cd "%EMULATOR_PATH%"
start /wait /B "" mameNEW64.exe nms8250 -ui_active -cart1 fmpac -cart2 sdsnatch -rompath "%rom_directory_path%;roms;bios" -flop1 %rom_name%

:WAITLOOP
tasklist /FI "IMAGENAME eq mameNEW64.exe" 2>NUL | find /I /N "mameNEW64.exe">NUL
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