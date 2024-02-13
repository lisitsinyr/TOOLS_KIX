@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]ШАБЛОН_BAT.bat
rem -------------------------------------------------------------------
chcp 1251

rem echo -------------------------------------------------------
rem echo 
rem echo -------------------------------------------------------
rem CURRENT_DIR - Текущий каталог
set CURRENT_DIR=%CD%
rem echo Текущий каталог %CURRENT_DIR%
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
if "%BAT_DIR%" == "" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
)
rem echo BAT_DIR: %BAT_DIR%

call __SET__.bat

:begin
echo ------------------------------------------------------- > %LOG_FULLFILENAME%
echo Запуск %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo ------------------------------------------------------- >> %LOG_FULLFILENAME%
echo Текущий каталог %CURRENT_DIR% >> %LOG_FULLFILENAME%

if exist %KIX_DIR%\%APP_KIX% (
    echo ЗАПУСК СКРИПТА %KIX_DIR%\%APP_KIX% ... >> %LOG_FULLFILENAME%
    kix32.exe %KIX_DIR%\%APP_KIX% "$P1=%1" "$P2=%2" "$P3=%3" "$P4=%4" "$P5=%5" "$P6=%6" "$P7=%7" "$P8=%8" "$P9=%9"
) else (
    echo ТЕЛО СКРИПТА %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
)

cd /D %CURRENT_DIR%
echo Текущий каталог %CURRENT_DIR% >> %LOG_FULLFILENAME%

far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
