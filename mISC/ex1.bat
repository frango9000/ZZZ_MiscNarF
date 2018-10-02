@echo off
goto ASKING

:asking
echo what excercise do you want to execute?
set /P exn=
goto ex%exn%
echo Excercise Number not found
pause >nul

:restart
echo Press any key to go to the begining
pause >nul
goto asking

:ex1
echo name the dir
set /P customdir=
echo(
echo the dir will be: %customdir%
echo(
echo name the root
set /P rootdir=
echo(
echo the folder %customdir% will be created in %rootdir%
echo it will look like this
echo %rootdir%%customdir%
echo( 
echo done
md %rootdir%%customdir%
cd %rootdir%%customdir%
md temp
md save
goto restart


:ex2
echo "set the directory to be deleted (c:\junk)"
set /P deldir=
if exist %deldir% (

	echo %deldir% will be deleted
	rd /S /Q %deldir%
		) else (
	echo %deldir% not found
	)

pause
goto restart

:ex3
echo how many files to create inside c:\junk
set /P ex3nof=
set /A "ex3nofr=ex3nof"
set /A "ex3nofi=1"

FOR /L %%G IN (1,1,%ex3nof%) DO ( call :ex3for "%%G")
Echo Excercise 3 Done!
pause >nul
goto restart

:ex3for
echo Name the file ^#%ex3nofi%^:
set /P ex3filename=
echo >C:\junk\%ex3filename%
set /A "ex3nofr-=1"
set /A "ex3nofi+=1"
echo Done! %ex3nofr% remaining
echo(
goto :eof


:ex4

echo Move the files that start with:
set /p ex4sw=

echo move to:
set /p ex3mt=

echo D| xcopy c:\junk\%ex4sw%* c:\unker /i /s

echo(
echo Done!
echo(

echo hello
pause >nul
goto restart


