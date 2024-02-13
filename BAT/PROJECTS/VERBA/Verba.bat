@echo off
rem -------------------------------------------------------------------
if "%KXLDIR%" == "" goto Begin
goto Stop
:Begin
echo Значение переменной среды KXLDIR не установлено
if "%COMPUTERNAME%" == "%USERDOMAIN%" goto Local
:Network
set KXLDIR=\\S73FS01\APPInfo\tools
goto Stop
:Local
set KXLDIR=c:\tools
goto Stop
:Stop
echo Значение переменной среды KXLDIR=%KXLDIR%
rem -------------------------------------------------------------------
rem %1 = <command>
rem      e - encrypt file,
rem      d - decrypt file,
rem      g - get list of abonents of encrypted file,
rem      s - make signature,
rem      v - verify signature,
rem      u - delete signature
rem      i - init key(load in to driver),
rem      r - reset key(unload...),
rem      l - get keys list.
rem %2 = <infile>
rem %3 = <outfile>
rem %4 = <a:\>
rem %5 = <k:\keys\verba>
rem -------------------------------------------------------------------
rem      e In_file Out_file Secret_key_path Pub_key_path From[series] To ...
rem      d In_file Out_file Secret_key_path Pub_key_path From 
rem      g In_file 
rem      s In_file Out_file Secret_key_path From
rem      v In_file Pub_key_path 
rem      u In_file [count_to_del]
rem      i [Key_ID] [Key_Dev]
rem      r Key_ID 
rem      l 
rem -------------------------------------------------------------------

kix32.exe %KXLDIR%\verba.kix "$Command=%1" "$P1=%2" "$P2=%3" "$P5=%4" "$P6=%5" "$KxlDir=%KXLDIR%"
