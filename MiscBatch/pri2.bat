@echo on

set active=1
set end=9
GOTO SETVARS

:SETVARS
set /A active+=1
set counta=0
set coefa=0
set countb=0
set coefb=0
set oddn=1
IF %active% LEQ %end% ( GOTO PRIME ) else ( GOTO FINISH )

:PRIME
echo ACTIVE %active%
FOR /L %%y IN (1,1,%end%) DO (
 CALL :PCHECK1
 CALL :ALLCHECK1
 IF %countb% LEQ 2 ( GOTO ISPRIME ) ELSE ( GOTO NOTPRIME )
)


:PCHECK1
 FOR /F %%A IN (c:\primestemp.txt) DO ( CALL :PCHECK2 %%A)

:PCHECK2
	IF %counta% LEQ 2 (
		set /A "coefa= %active% %% %1" 
		if %coefa% EQU 0 set /A counta+=1
		GOTO:EOF
	) else ( GOTO NOTPRIME )


:ACHECK1
 IF %counta% LEQ 2 (
	FOR /L %%p IN (1,1,%active%) DO ( CALL :ACHECK2 )
 ) else ( GOTO :NOTPRIME )

:ACHECK2
		IF %countb% LEQ 2 (
			set /A "coefb=%active% %% %oddn%
				set oddn
			IF %coefb% EQU 0 set countb+=1
				set countb
			set /A oddn+=2
			GOTO:EOF
			) else ( GOTO NOTPRIME )

:ISPRIME
ECHO %active% is a PRIME number
PAUSE
GOTO SETVARS

:NOTPRIME
echo %active% is NOT a Prime number
PAUSE
GOTO SETVARS

:FINISH
echo Job Done
pause
EXIT