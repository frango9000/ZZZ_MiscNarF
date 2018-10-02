@echo on


SET start=1
SET divby=0
set end=5
set active=1
set /A realend=%end%-1
set pcounter=0
set tcounter=0
set tempn=1
set coef=1
set checkt=1
set priproto=1

FOR /L %%G IN (1,1,%realend%) DO ( 
echo %active%
call :checker
if %tcounter% LEQ 2 ( 
call :for1
set tcounter=0
) else ( set /A active+=1 ) 

)



:for1
FOR /L %%O IN (1,1,%active%) DO call :for2
if %pcounter% LEQ 2 echo ______%active%

set pcounter=0
set tcounter=0
set tempn=1
set /A active+=1
goto:eof


:for2
@echo off
set /A "coef=%active% %% %tempn%"
if %coef% EQU 0 set /A pcounter+=1
set /A tempn+=1
@echo on
goto:eof


:checker
FOR /F %%A IN (c:\primestemp.txt) DO call :moduleb %%A

:moduleb
set primec=%1
if %tcounter% LEQ 2 (
set /A "checkt=%active% %% %1"
if %checkt% EQU 0 set /A tcounter+=1 )
goto :eof
)

pause