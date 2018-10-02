@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set iter=%1
set fnum=1
set prev=0
echo %prev%
if "%fnum%"=="" ( set fnum=1 )
echo %fnum%

FOR /L %%G IN (1,1,%iter%) DO (
if "!prev!"=="" (set prev=!fnum!)
set tempn=!fnum!
set /A fnum+=!prev!
set prev=!tempn!
echo !fnum!
)
pause