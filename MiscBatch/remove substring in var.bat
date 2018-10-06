@echo off

set iter1=5
set iter2=5

SET longvar=1234567890abcdefghij
SET one=10
SET stwo=0

FOR /L %%G IN (1,1,%iter1%) DO call :for1

:for1
Set two=%stwo%
FOR /L %%O IN (1,1,%iter2%) DO call :for2
set /A one+=1
goto:eof

:for2
if %two%==0 (
call set echovar=%%longvar:~%one%%%
set ifel=if
) else (
call set echovar=%%longvar:~%one%,%two%%%
set ifel=el
)
echo %ifel% _ %one% _ %two%: %echovar%
set /A two-=1
goto:eof



pause