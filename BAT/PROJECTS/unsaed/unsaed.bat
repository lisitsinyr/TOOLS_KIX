@echo off
rem -------------------------------------------------------------------

set SAEDLogDir=.
set SAEDWorkDir=.

rem -------------------------------------------------------------------
if "%KXLDIR%" == "" goto Begin
goto Stop
:Begin
echo �������� ���������� ����� KXLDIR �� �����������
if "%COMPUTERNAME%" == "%USERDOMAIN%" goto Local
:Network
set KXLDIR=\\S73FS01\APPInfo\tools
goto Stop
:Local
set KXLDIR=c:\tools
goto Stop
:Stop
echo �������� ���������� ����� KXLDIR=%KXLDIR%
rem -------------------------------------------------------------------

kix32.exe %KXLDIR%\unsaed.kix "$L=%1" "$PWD=%2" "$PWDPIA=%3" "$KxlDir=%KXLDIR%"
