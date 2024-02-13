@echo off
rem -------------------------------------------------------------------
if "%KXLDIR%" == "" goto Begin
goto Stop
:Begin
echo Значение переменной среды KXLDIR не установлено
if "%COMPUTERNAME%" == "%USERDOMAIN%" goto Local
:Network
set KXLDIR=L:\UI\PRGGU\PO\IAS\TOOLS\ORIGINALS
set KXLDIR=\\S73FS01\APPInfo\tools
goto Stop
:Local
set KXLDIR=c:\tools
goto Stop
:Stop
echo Значение переменной среды KXLDIR=%KXLDIR%
rem -------------------------------------------------------------------

K:\TOOLS\KiX\KIX_4_53\kix32.exe -f %KXLDIR%\CreateLinks.kix %1 "$KxlDir=%KXLDIR%" "$Debug=0"
