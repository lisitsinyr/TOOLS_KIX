@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]������_BAT.bat
rem -------------------------------------------------------------------
chcp 1251

rem echo -------------------------------------------------------
rem echo 
rem echo -------------------------------------------------------
rem CURRENT_DIR - ������� �������
set CURRENT_DIR=%CD%
rem echo ������� ������� %CURRENT_DIR%
rem ���� �������: �������+���+����������
set SCRIPT_FULLFILENAME=%~f0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem ���� �������: ���+����������
set SCRIPT_BASEFILENAME=%~n0%~x0
rem echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
rem ���� �������: ���
set SCRIPT_FILENAME=%~n0
rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%
rem ������� BAT_DIR: �������
if "%BAT_DIR%" == "" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
)
rem echo BAT_DIR: %BAT_DIR%

call __SET__.bat

:begin
echo ------------------------------------------------------- > %LOG_FULLFILENAME%
echo ������ %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo ------------------------------------------------------- >> %LOG_FULLFILENAME%
echo ������� ������� %CURRENT_DIR% >> %LOG_FULLFILENAME%

if exist %KIX_DIR%\%APP_KIX% (
    echo ������ ������� %KIX_DIR%\%APP_KIX% ... >> %LOG_FULLFILENAME%
    kix32.exe %KIX_DIR%\%APP_KIX% "$P1=%1" "$P2=%2" "$P3=%3" "$P4=%4" "$P5=%5" "$P6=%6" "$P7=%7" "$P8=%8" "$P9=%9"
) else (
    echo ���� ������� %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
)

cd /D %CURRENT_DIR%
echo ������� ������� %CURRENT_DIR% >> %LOG_FULLFILENAME%

far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
