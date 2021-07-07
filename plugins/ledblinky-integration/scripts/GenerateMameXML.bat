@echo off

set "NEXT_MAME_PATH=..\..\..\Emulators Official\mame\"
set "GEMS_DIAMONDS_MAME_PATH=..\..\..\emulators\MAME\"

if exist "%NEXT_MAME_PATH%" (
  cd %NEXT_MAME_PATH%
) else (
  cd "%GEMS_DIAMONDS_MAME_PATH%"
)
mame64.exe -listxml 1>mame.xml
move mame.xml ..\..\plugins\ledblinky-integration\
