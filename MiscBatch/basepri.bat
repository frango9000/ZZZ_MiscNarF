@echo off


SET start=1
SET divby=0
set end=%1
set /A realend=%end%-1
set active=1
set pcounter=0
set tempn=1
set coef=1

FOR /L %%G IN (1,1,%realend%) DO call :for1

:for1

FOR /L %%O IN (1,1,%active%) DO call :for2
if %pcounter% LEQ 2 echo prime!!! %active%
set pcounter=0
set tempn=1
set /A active+=1
goto:eof


:for2

IF NOT DEFINED tempn (set tempn=1)
set /A "coef=%active% %% %tempn%"
if %coef% EQU 0 set /A pcounter+=1
set /A tempn+=1

goto:eof



pause