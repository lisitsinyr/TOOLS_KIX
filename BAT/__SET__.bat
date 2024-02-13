@echo off
rem -------------------------------------------------------------------
rem __SET__.bat
rem -------------------------------------------------------------------

rem ===================================================================
rem -------------------------------------------------------------------
rem ������� �������: �������
rem     LOG_DIR=
rem ���� �������: ���+����������
rem     LOG_BASEFILENAME=
rem ���� �������: ���
rem     LOG_FILENAME=
rem ������ ����� ����� �������: FILENAME,DT,...
rem     LOG_FILENAME_FORMAT=
rem ��������� �������
rem     LOG_OPT=11
rem ������� APP_KIX: ������� � ������� .KIX
rem     KIX_DIR=
rem ������ APP_KIX: ���+����������
rem     APP_KIX=lyrxxx_������.kix
rem -------------------------------------------------------------------
rem echo -------------------------------------------------------
rem echo 1.���������� �� ���������
rem echo    %LOG_DIR%
rem echo    %LOG_FILENAME%
rem echo    %DATETIME_STAMP%
rem echo    %LOG_FILENAME_FORMAT%
rem echo    %LOG_OPT%
rem echo -------------------------------------------------------
rem LOG_DIR - ������� �������: �������
set LOG_DIR=D:\PROJECTS_LYR\LOGS
rem echo LOG_DIR: %LOG_DIR%
rem -------------------------------------------------------------------
rem LOG_FILENAME - ���� �������: ���
set LOG_FILENAME=%REPO_NAME%_xxxxxxxxxxxxxxxxxx
set LOG_FILENAME=
rem echo LOG_FILENAME: %LOG_FILENAME%
rem -------------------------------------------------------------------
rem DATETIME_STAMP - ������ ����� ����� �������
set DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
rem echo DATETIME_STAMP: %DATETIME_STAMP%
rem -------------------------------------------------------------------
rem ������ ����� ����� �������: FILENAME,DT,...
if "%LOG_FILENAME_FORMAT%" == "" (
    set LOG_FILENAME_FORMAT=FILENAME
    rem set LOG_FILENAME_FORMAT=DATETIME
)
rem echo LOG_FILENAME_FORMAT: %LOG_FILENAME_FORMAT%
rem -------------------------------------------------------------------
rem ��������� �������
if "%LOG_OPT%" == "" (
    set LOG_OPT=11
)
rem echo LOG_OPT: %LOG_OPT%
rem -------------------------------------------------------------------
rem ������� APP_KIX: �������
set KIX_DIR=
rem -------------------------------------------------------------------
rem ������ APP_KIX: ���+����������
set APP_KIX=[lyrxxx_]������_KIX.kix
rem -------------------------------------------------------------------

rem echo -------------------------------------------------------
rem echo 2.������ [PROJECTS]
rem echo    %PROJECTS%
rem echo    %UNAME%
rem echo    %USERNAME%
rem echo    %PROJECTS_LYR_DIR%
rem echo    %PROJECTS_DIR%
rem echo -------------------------------------------------------
set PROJECTS=PROJECTS_BAT
rem echo PROJECTS: %PROJECTS%
rem -------------------------------------------------------------------
set CURRENT_SYSTEM=%OS%
rem echo CURRENT_SYSTEM: %CURRENT_SYSTEM%
rem -------------------------------------------------------------------
set UNAME=%COMPUTERNAME%
rem echo UNAME: %UNAME%
rem -------------------------------------------------------------------
set USERNAME=%USERNAME%
rem echo USERNAME: %USERNAME%
rem -------------------------------------------------------------------
set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
rem echo PROJECTS_LYR_DIR: %PROJECTS_LYR_DIR%
rem -------------------------------------------------------------------
set PROJECTS_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%
rem echo PROJECTS_DIR: %PROJECTS_DIR%

rem echo -------------------------------------------------------
rem echo 3.������� �����������
rem echo    %REPO_NAME%
rem echo -------------------------------------------------------
rem REPO_NAME - ��� �����������
set REPO_NAME=
rem -------------------------------------------------------------------
rem REPO - ���� � ����������� �����������
set REPO_INI=REPO.ini
rem -------------------------------------------------------------------
rem �������� ������������� ����� REPO.ini
if not exist %REPO_INI% (
    rem echo ���� %REPO_INI% � ����������� �����������
    rem exit /b 1
) else (
    for /f "eol=# delims== tokens=1,2" %%i in (%REPO%) do (
       rem � ���������� i - ����
       rem � ���������� j - ��������
       set %%i=%%j
       rem echo %%i: %%%j%
    )
)
rem echo REPO_NAME: %REPO_NAME%

rem echo -------------------------------------------------------
rem echo 4.��������� �������� �������� � ����� ������� 
rem echo    %LOG_DIR%
rem echo    %LOG_FILENAME%
rem echo    %LOG_OPT1%
rem echo    %LOG_OPT2%
rem echo -------------------------------------------------------
rem ������� �������: �������
if "%LOG_DIR%" == "" (
    set LOG_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%\LOGS
)
rem echo LOG_DIR: %LOG_DIR%
if not exist %LOG_DIR% (
    echo ERROR: ������� %LOG_DIR% �� ����������
    exit /b 1
)
rem ���� �������: ���
if "%LOG_FILENAME%" == "" (
    if "%LOG_FILENAME_FORMAT%" == "FILENAME" (
        set LOG_FILENAME=%SCRIPT_FILENAME%
    ) else (
        if "%LOG_FILENAME_FORMAT%" == "DATETIME" (
            set LOG_FILENAME=%DATETIME_STAMP%
        ) else (
            echo ERROR: ���� ������� �� �����
            exit /b 1
        )
    )
)
rem echo LOG_FILENAME: %LOG_FILENAME%
rem -------------------------------------------------------------------
rem ���� �������: �������+���+����������
if "%REPO_NAME%" == "" (
    set LOG_FULLFILENAME=%LOG_DIR%\%LOG_FILENAME%.log
) else (
    set LOG_FULLFILENAME=%LOG_DIR%\%REPO_NAME%_%LOG_FILENAME%.log
)
rem echo LOG_FULLFILENAME: %LOG_FULLFILENAME%
rem -------------------------------------------------------------------
rem ��������� ������� LOG_OPT1
set LOG_OPT1=%LOG_OPT:~0,1%
if "%LOG_OPT1%" == "" (
    set LOG_OPT1=1
)
rem echo LOG_OPT1: %LOG_OPT1%
rem -------------------------------------------------------------------
rem ��������� ������� LOG_OPT2
set LOG_OPT2=%LOG_OPT:~1,1%
if "%LOG_OPT2%" == "" (
    set LOG_OPT2=1
)
rem echo LOG_OPT2: %LOG_OPT2%
rem ===================================================================

rem ===================================================================
rem echo -------------------------------------------------------
rem echo 5.������� ���������� KIX: �������
rem echo    %LIB_KIX%"
rem echo -------------------------------------------------------
rem ������� ���������� KIX: �������
if "%LIB_KIX%" == "" (
    rem echo ������� LIB_KIX �� ����������
    if "%COMPUTERNAME%" == "%USERDOMAIN%" (
        set LIB_KIX=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\01_KIX\%PROJECTS%\TOOLS_KIX\LIB
        set LIB_KIX=D:\TOOLS\TOOLS_BAT\TOOLS_KIX\LIB
    ) else (
        set LIB_KIX=\\S73FS01\APPInfo\tools\LIB
    )
)
rem echo LIB_KIX: %LIB_KIX%
if exist %LIB_KIX% (
    rem echo ������� %LIB_KIX% ����������
) else (
    echo INFO: ������� %LIB_KIX% �� ����������
    rem exit /b 1
)
rem echo -------------------------------------------------------
rem echo 6.APP_KIX
rem echo    %APP_KIX%
rem echo    %KIX_DIR%
rem echo -------------------------------------------------------
if exist %APP_KIX% (
    rem echo ���� %APP_KIX% ����������
    set KIX_DIR=.
) else (
    rem echo ���� %APP_KIX% �� ����������
    if exist KIX\%APP_KIX% (
        rem echo ���� KIX\%APP_KIX% ����������
        set KIX_DIR=KIX
    ) else (
        rem echo ���� KIX\%APP_KIX% �� ����������
        if exist %BAT_DIR%\KIX\%APP_KIX% (
            rem echo ���� %BAT_DIR%\KIX\%APP_KIX% ����������
            set KIX_DIR=%BAT_DIR%\KIX
        ) else (
            echo INFO: ���� %BAT_DIR%\KIX\%APP_KIX% �� ����������
            rem exit /b 1
        )
    )
)
rem echo KIX_DIR: %KIX_DIR%
rem ===================================================================
