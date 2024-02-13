'=======================================================================================
' CreateLinks.vbs
'=======================================================================================

'Option Explicit


'Err.Raise vbObjectError + 1050, "Это моя ошибка", "Это моя ошибка2"

'=======================================================================================
' Константы
'=======================================================================================
   const sconVBLDir = "I:\prggu\PO\IR\TOOLS\ORIGINALS"

'=======================================================================================
' Uses
'=======================================================================================
   Dim p

   Dim sstrVBLDir

   Dim objWshSysEnv_USER

   Dim sobjWshShell
   Set sobjWshShell = WScript.CreateObject ("WScript.Shell")

   Set objWshSysEnv_USER = sobjWshShell.Environment("USER")
   if objWshSysEnv_USER("VBSDIR") <> "" then
      sstrVBLDir = objWshSysEnv_USER("VBSDIR")
   else
      sstrVBLDir = sconVBLDir
   end if
   'WScript.Echo sstrVBLDir
   LoadLib1 (sstrVBLDir & "\VBL\LUConst.vbs")
   LoadLib1 (sstrVBLDir & "\APPLinks.vbs")

'=======================================================================================
'begin
   SetEcho (True)   

   CreateLinks

   'p = Chr(34) & "\\fsgu\usr\" & Chr(34) & " & " & "sstrUserID"
   'p = Chr(34) & "\\fsgu\usr\" & Chr(34) & " & " & "Kix_UserID"
   'exe(p)

'End

function exe (argPath)
   Dim strPath, s
'begin
   WScript.Echo argPath
   s = "strPath = " &  argPath 
   WScript.Echo s
   Execute s
   WScript.Echo "strPath=" & strPath 
end function

'=======================================================================================
' Подключение внешних библиотек
' strFullPatchLib - подключаемая библиотека (с полным путем)
' strCode - данные для подключения 
' после выхода из функции необходимо выполнить:
' Execute strCode
'=======================================================================================
Function LoadLib1 (argFullPatchLib)
   Dim objFSO, objTextStream
'begin
   Set objFSO = CreateObject("Scripting.FileSystemObject")
   LoadLib1 = ""
   On Error Resume Next
   Set objTextStream = objFSO.OpenTextFile(argFullPatchLib, 1)
   if Err.Number <> 0 then
      WScript.Echo "LoadLib: " & Err.Number & " " & Err.Description & " " & argFullPatchLib 
      Err.Clear
   else
      LoadLib1 = objTextStream.ReadAll
      objTextStream.Close
      ExecuteGlobal LoadLib1
   end if
   On Error GoTo 0 
End Function

