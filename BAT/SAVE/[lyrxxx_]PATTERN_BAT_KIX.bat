@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_BAT.bat
rem -------------------------------------------------------------------
chcp 1251

rem echo -------------------------------------------------------
rem Файл скрипта: каталог+имя+расширение
set SCRIPT_FULLFILENAME=%~f0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem Файл скрипта: имя+расширение
set SCRIPT_BASEFILENAME=%~n0%~x0
rem echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
rem Файл скрипта: имя
set SCRIPT_FILENAME=%~n0
rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%
rem Каталог BAT_DIR: каталог
if "%BAT_DIR%"=="" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
    set BAT_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT\BAT
)
rem echo BAT_DIR: %BAT_DIR%
rem -------------------------------------------------------------------
rem APP_KIX_DIR - каталог APP_KIX
set APP_KIX_DIR=
rem -------------------------------------------------------------------
rem APP_KIX - Скрипт APP_KIX имя+расширение
set APP_KIX=[lyrxxx_]PATTERN_KIX.kix
rem -------------------------------------------------------------------

call %BAT_DIR%\__SET__.bat
call %BAT_DIR%\__SET_KIX__.bat

:begin
echo ------------------------------------------------------- >> %LOG_FULLFILENAME%
echo Start %SCRIPT_BASEFILENAME% ...       >> %LOG_FULLFILENAME%
echo ------------------------------------------------------- >> %LOG_FULLFILENAME%
echo CURRENT_DIR: %CURRENT_DIR%            >> %LOG_FULLFILENAME%
set DIR_SAVE=%CURRENT_DIR%

call :Check_P1 || exit /b 1

if exist %APP_KIX_DIR%\%APP_KIX% (
    echo START script %APP_KIX_DIR%\%APP_KIX% ... >> %LOG_FULLFILENAME%
    kix32.exe %APP_KIX_DIR%\%APP_KIX% "$P1=%1" "$P2=%2" "$P3=%3" "$P4=%4" "$P5=%5" "$P6=%6" "$P7=%7" "$P8=%8" "$P9=%9"
)

rem far -v %LOG_FULLFILENAME%

cd /D %DIR_SAVE%

rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================
:Check_P1
echo ---------------------------------------------------------------
echo Check_P1 [P1]
echo ---------------------------------------------------------------
if "%1"=="" (
    rem set /p P1=P1:
    set P1=""
) else (
    set P1=%1
)
if "%P1%"=="" (
    set P1=""
)
echo P1: %P1%
exit /b 0
