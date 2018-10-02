@ECHO off

set one=%1
set two=0
set resulf=2

FOR /L %%O IN (1,1,50) DO (call :go)

:go
set /A "result=%one% << %two%"
FOR /L %%A IN (1,1,%two%) DO call :power
echo %one% shift r %two% = %result% _ %resulf%
set /A two+=1
set resulf=2
goto:eof

:power
SET /A resulf *= 2
rem set resulf
goto:eof


pause