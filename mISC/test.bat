@echo off
color 0c

:passset

echo set a password:
set /P pass=

echo .
echo you set %pass% as password
echo .
goto passask

:passask
echo enter pass:
set /P imputpass=

if %imputpass% == %pass% ( echo Access Granted ) else ( echo Access Denied )
echo .
echo .
echo .
echo .
echo .
goto passset

