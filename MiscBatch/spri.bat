@echo off


SET start=1
SET divby=0
set end=%1
set /A realend=%end%-1
set active=1
set check2=1
set check3=1
set check5=1
set checv2=1
set checv3=1
set checv5=1
set pcounter=0
set tempn=1
set coef=1

FOR /L %%G IN (1,1,%realend%) DO call :for1

:for1

if %active% GTR 5 (
set /A "check2 = %active% %% 2"
set /A "check3 = %active% %% 3"
set /A "check5 = %active% %% 5"
)


if %check2% NEQ 0 (
if %check3% NEQ 0 (
if %check5% NEQ 0 (


FOR /L %%O IN (1,1,%active%) DO call :for2
if %pcounter% LEQ 2 echo prime!!! %active%
)))

set pcounter=0
set tempn=1
set /A active+=1
goto:eof

:for2
IF NOT DEFINED tempn (set tempn=1)
if %tempn% GTR 5 (
set /A "checv2 = %tempn% %% 2"
set /A "checv3 = %tempn% %% 3"
set /A "checv5 = %tempn% %% 5"
)

if %checv2% NEQ 0 (
if %checv3% NEQ 0 (
if %checv5% NEQ 0 (

set /A "coef=%active% %% %tempn%"
if %coef% EQU 0 set /A pcounter+=1
)))
set /A tempn+=1
set checv2=1
set checv3=1
set checv5=1
goto:eof



pause