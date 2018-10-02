@echo on
SETLOCAL EnableDelayedExpansion

set active=4
set end=5
GOTO SETVARS

:SETVARS
set /A "!active!+=1"
set counta=0
set coefa=0
set countb=0
set coefb=0
set oddn=1
IF !active! LEQ %end% ( GOTO PRIME ) else ( GOTO FINISH )

:PRIME
echo !active!
FOR /L %%y IN (1,1,%end%) DO (

 FOR /F %%A IN (c:\primestemp.txt) DO (

	IF !counta! LEQ 2 (
		set /A "coefa= !active! %% %%A"
		if !coefa! EQU 0 set /A counta+=1
	) else GOTO NOTPRIME 
 )

 IF !counta! LEQ 2 (

	FOR /L %%p IN (1,1,!active!) DO (

		IF !countb! LEQ 2 (
			set /A "coefb=!active! %% !oddn!
			IF !coefb! EQU 0 set countb+=1
			set /A "oddn+=2"
			) else GOTO NOTPRIME
	)
 ) else ( GOTO :NOTPRIME )

 IF !countb! LEQ 2 GOTO ISPRIME
)

:ISPRIME
ECHO !active! is a PRIME number!
GOTO SETVARS

:NOTPRIME
echo !active! is NOT a Prime number!
GOTO SETVARS

:FINISH
echo Job Done!
pause