@echo off

set iter1=6

SET longvar=1234567890abcdefghij
SET one=123
SET two=xxx

FOR /L %%G IN (1,1,%iter1%) DO call :for1

:for1
call set echovar=%%longvar:%one%=%two%%%
echo %one% _ %two%: %echovar%
set /A one+=111
goto:eof



pause