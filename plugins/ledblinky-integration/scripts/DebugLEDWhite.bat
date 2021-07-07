@echo off
call ..\config.cmd

if %is_ledblinky_activated%==1 (
  cd..\..\LEDBlinky
  start "" LEDBlinky.exe WHITE DEBUG
)