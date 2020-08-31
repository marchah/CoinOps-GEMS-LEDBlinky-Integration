@echo off
call config.cmd
set rom_path=%1
set rom_name=%2


cd..\LEDBlinky
start "" LEDBlinky.exe %rom_name% MAME

cd..\..\emulators\mame
start /wait /B "" mame64.exe C64 -flop %rom_path% -state 0 -natural

:WAITLOOP
tasklist /FI "IMAGENAME eq mame64.exe" 2>NUL | find /I /N "mame64.exe">NUL
if "%ERRORLEVEL%"=="0" goto RUNNING
goto NOTRUNNING

:RUNNING
timeout /t 5
goto WAITLOOP

:NOTRUNNING
cd..\..\plugins\LEDBlinky
start "" LEDBlinky.exe %frontend_default_animation%