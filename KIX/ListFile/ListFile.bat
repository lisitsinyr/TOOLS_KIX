@echo off
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

kix32.exe -f %KXLDIR%\ListFile.kix "$Dir=%1" "$KxlDir=%KXLDIR%"
