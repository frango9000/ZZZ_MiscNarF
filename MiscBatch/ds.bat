@echo off
if "%1"=="" (
 echo "Copy to (order No):"
 set /p orderno=
) else (
 SET orderno=%1
)




IF NOT EXIST "C:\Documents and Settings\PKST\Escritorio\%orderno%.txt" ( goto txtmiss )
IF NOT EXIST "C:\Documents and Settings\PKST\Escritorio\%orderno%\\." ( md "C:\Documents and Settings\PKST\Escritorio\%orderno%" )


FOR /F "usebackq tokens=1" %%A IN ("C:\Documents and Settings\PKST\Escritorio\%orderno%.txt") DO ( 
echo D| xcopy D:\DS\Juegos\Juegos\%%A* "C:\Documents and Settings\PKST\Escritorio\%orderno%\." /C /Q /-Y 2>> "C:\Documents and Settings\PKST\Escritorio\%orderno%\error.txt"
)

for %%i in ("C:\Documents and Settings\PKST\Escritorio\%orderno%\error.txt") do ( set size=%%~zi )
if %size% gtr 0 start notepad "C:\Documents and Settings\PKST\Escritorio\%orderno%\error.txt"

echo(
echo Done!
pause >nul

:txtmiss
echo C:\Documents and Settings\PKST\Escritorio\%orderno%.txt Not Found!
pause >nul