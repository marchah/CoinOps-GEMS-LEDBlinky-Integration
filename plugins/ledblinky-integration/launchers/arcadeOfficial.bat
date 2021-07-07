@echo off
call ..\config.cmd
set rom_name=%1

set "EMULATOR_PATH=..\..\Emulators Official\mame"

cd..\..\LEDBlinky
if %is_ledblinky_activated%==1 (
  start "" LEDBlinky.exe %rom_name% MAME
)

cd "%EMULATOR_PATH%"
start /wait /B "" mame64.exe %rom_name%

:WAITLOOP
tasklist /FI "IMAGENAME eq mame64.exe" 2>NUL | find /I /N "mame64.exe">NUL
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