@echo off
setlocal
set folder=D:\Mis documentos\Dropbox
echo %folder%
set dbfold="D:\Mis documentos\Dropbox\list.txt"
echo %dbfold%
set downfold="D:\list.txt"
echo %downfold%

GOTO WGETFILE



:WGETFILE
echo wget start
wget -E -O %downfold% --no-check-certificate --quiet https://www.dropbox.com/s/egxgytpvy26l8ej/list.txt
echo wget end
GOTO CHECKING1

:CHECKING1
IF EXIST %dbfold% ( GOTO EVA1 ) ELSE ( GOTO CHECKING2 )

:CHECKING2
IF EXIST %downfold% ( GOTO EVA2 ) ELSE ( GOTO EOF )

:EVA1
echo Evacuation 1 start!
for /f "eol=: delims=" %%F in ('dir /b ^"%folder%^" ^| findstr /ibg:%dbfold%') do rmdir /S /Q ^"%folder%^\%%F^"
echo Evacuation 1 end!
GOTO CHECKING2

:EVA2
echo Evacuation 2 start!
for /f "eol=: delims=" %%F in ('dir /b ^"%folder%^" ^| findstr /ibg:%downfold%') do rmdir /S /Q ^"%folder%^\%%F^"
echo Evacuation 2 end!
GOTO EOF

:EOF
EXIT