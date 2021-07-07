@echo off
call ..\config.cmd
set rom_name=%1

set "EMULATOR_PATH=..\..\Emulators Official\Sega Model 2"

cd..\..\LEDBlinky
if %is_ledblinky_activated%==1 (
  start "" LEDBlinky.exe %rom_name% Sega_Model_2
)

cd "%EMULATOR_PATH%"
cmd.exe /C %rom_name%.bat

:WAITLOOP
tasklist | find /I "%rom_name%.bat">NUL 2>&1
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