@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set iter=30

SET one=0


FOR /L %%G IN (1,1,%iter%) DO ( 
set one=!one!%%G
echo !one!
)
pause
