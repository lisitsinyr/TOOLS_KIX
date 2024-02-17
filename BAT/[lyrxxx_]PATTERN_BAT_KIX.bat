@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_BAT.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion
rem setlocal enableextensions disabledelayedexpansion
rem echo ERRORLEVEL: %ERRORLEVEL%

rem PROJECTS - проект
set PROJECTS=PROJECTS_BAT
rem echo PROJECTS: %PROJECTS%
set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
rem echo PROJECTS_LYR_DIR: %PROJECTS_LYR_DIR%
set PROJECTS_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%
rem echo PROJECTS_DIR: %PROJECTS_DIR%

rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
set SCRIPT_FULLFILENAME=%0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem SCRIPTS_DIR - Каталог скриптов BAT
if "%SCRIPTS_DIR%" == "" (
    set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
)
rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
if "%SCRIPTS_DIR_KIX%" == "" (
    set SCRIPTS_DIR_KIX=D:\TOOLS\TOOLS_KIX
    set SCRIPTS_DIR_KIX=G:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
    set SCRIPTS_DIR_KIX=G:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_KIX
)
rem echo SCRIPTS_DIR_KIX: %SCRIPTS_DIR_KIX%

echo ==================================================================
echo SET %SCRIPT_FULLFILENAME% ...
echo ==================================================================
call :__SET_VAR_SCRIPT %SCRIPT_FULLFILENAME% || exit /b 1
call :__SET_VAR_DEFAULT || exit /b 1
call :__SET_VAR_PROJECTS || exit /b 1
call :__SET_CHECK_REPO || exit /b 1
call :__SET_LOG || exit /b 1
call :__SET_KIX || exit /b 1

:begin
call :StartLogFile || exit /b 1

echo ================================================================= >> %LOG_FULLFILENAME%
echo START %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo ================================================================== >> %LOG_FULLFILENAME%
set DIR_SAVE=%CURRENT_DIR%

call :MAIN || exit /b 1

echo ================================================================= >> %LOG_FULLFILENAME%
echo STOP %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo ================================================================== >> %LOG_FULLFILENAME%

cd /D %DIR_SAVE%
rem far -v %LOG_FULLFILENAME%

call :StopLogFile || exit /b 1

rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
:__SET_VAR_SCRIPT
%SCRIPTS_DIR%\LIB\__SET_LIB.bat %*
:__SET_VAR_DEFAULT
%SCRIPTS_DIR%\LIB\__SET_LIB.bat %*
exit /b 0
:__SET_VAR_PROJECTS
%SCRIPTS_DIR%\LIB\__SET_LIB.bat %*
exit /b 0
:__SET_CHECK_REPO
%SCRIPTS_DIR%\LIB\__SET_LIB.bat %*
exit /b 0
:__SET_LOG
%SCRIPTS_DIR%\LIB\__SET_LIB.bat %*
:__SET_KIX
%SCRIPTS_DIR%\LIB\__SET_LIB.bat %*
exit /b 0
:StartLogFile
%SCRIPTS_DIR%\LIB\LYRLog.bat %*
exit /b 0
:StopLogFile
%SCRIPTS_DIR%\LIB\LYRLog.bat %*
exit /b 0
:Check_P
%SCRIPTS_DIR%\LIB\LYRSupport.bat %*
exit /b 0

rem =================================================
rem ФУНКЦИЯ :MAIN
rem =================================================
:MAIN
rem beginfunction
    if exist %APP_KIX_DIR%\%APP_KIX% (
        echo START script %APP_KIX_DIR%\%APP_KIX% ... >> %LOG_FULLFILENAME%
        kix32.exe %APP_KIX_DIR%\%APP_KIX% "$P1=%1" "$P2=%2" "$P3=%3" "$P4=%4" "$P5=%5" "$P6=%6" "$P7=%7" "$P8=%8" "$P9=%9"
    )
    exit /b 0
rem endfunction
