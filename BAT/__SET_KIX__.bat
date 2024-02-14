@echo off
rem -------------------------------------------------------------------
rem __SET_KIX__.bat
rem -------------------------------------------------------------------
chcp 1251

:begin
if "%__SET_KIX__%"=="1" (
    goto :eof
) else (
    set __SET_KIX__=1
)
echo __SET_KIX__: %__SET_KIX__%

if "%SCRIPT_FILENAME%"=="" (
    set SCRIPT_FILENAME=__SET_KIX__
)
echo SCRIPT_FILENAME: %SCRIPT_FILENAME%

rem -------------------------------------------------------------------
rem Каталог BAT_DIR: каталог
if "%BAT_DIR%"=="" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
    set BAT_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT\BAT
)
echo BAT_DIR: %BAT_DIR%
rem -------------------------------------------------------------------
rem APP_KIX_DIR - каталог APP_KIX
set APP_KIX_DIR=
rem -------------------------------------------------------------------
rem APP_KIX - Скрипт APP_KIX имя+расширение
set APP_KIX=[lyrxxx_]PATTERN_KIX.kix
rem -------------------------------------------------------------------

rem echo -------------------------------------------------------
rem echo Каталог библиотеки KIX: каталог
rem echo    %LIB_KIX%"
rem echo -------------------------------------------------------
rem LIB_KIX - Каталог библиотеки KIX [каталог]
if "%LIB_KIX%"=="" (
    rem echo INFO: Dir LIB_KIX not set
    if "%COMPUTERNAME%"=="%USERDOMAIN%" (
        set LIB_KIX=D:\TOOLS\TOOLS_KIX\LIB
        set LIB_KIX=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX\LIB
    ) else (
        set LIB_KIX=\\S73FS01\APPInfo\tools\LIB
    )
)
rem echo LIB_KIX: %LIB_KIX%
if exist %LIB_KIX% (
    rem echo Dir %LIB_KIX% exist
) else (
    echo INFO: Dir %LIB_KIX% not exist
    rem exit /b 1
)

rem echo -------------------------------------------------------
rem echo APP_KIX
rem echo    %APP_KIX%
rem echo    %APP_KIX_DIR%
rem echo -------------------------------------------------------
if "%APP_KIX%"=="" (
    echo File APP_KIX not set
) else (
    if exist %APP_KIX% (
        rem echo Файл %APP_KIX% существует
        set APP_KIX_DIR=.
    ) else (
        rem echo Файл %APP_KIX% не существует
        if exist KIX\%APP_KIX% (
            rem echo Файл KIX\%APP_KIX% существует
            set APP_KIX_DIR=KIX
        ) else (
            rem echo Файл KIX\%APP_KIX% не существует
            if exist %BAT_DIR%\KIX\%APP_KIX% (
                rem echo Файл %BAT_DIR%\KIX\%APP_KIX% существует
                set APP_KIX_DIR=%BAT_DIR%\KIX
            ) else (
                echo INFO: File %BAT_DIR%\KIX\%APP_KIX% not exist
                rem exit /b 1
            )
        )
    )

)
echo APP_KIX_DIR: %APP_KIX_DIR%
rem ===================================================================

:Exit
