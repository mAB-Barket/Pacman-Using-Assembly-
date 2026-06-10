REM  make32.bat -  Batch file for assembling/linking 32-bit Assembly programs
REM  Revised for Visual Studio 2022 and custom Irvine path

@echo off
cls

REM Initialize Visual Studio environment if not already set up
call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" -arch=x86

REM Set paths for the Irvine libraries
SET INCLUDE=D:\Downloads\Downloads\Irvine\irvine
SET LIB=D:\Downloads\Downloads\Irvine\irvine

echo Assembling %1.asm...
ml.exe -nologo -c -Zi -coff -I"%INCLUDE%" %1.asm
if errorlevel 1 goto terminate

echo Linking %1.obj...
link.exe /NOLOGO %1.obj /LIBPATH:"%LIB%" Irvine32.lib kernel32.lib user32.lib /SUBSYSTEM:CONSOLE /DEBUG
if errorLevel 1 goto terminate

dir %1.*

:terminate
pause