 Dim objFSO
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set colDrives = objFSO.Drives
For Each objDrive in colDrives
path= objDrive.DriveLetter &":\autorun.inf"
Set filesys = CreateObject("Scripting.FileSystemObject") 
if filesys.FileExists(path) Then
 filesys.DeleteFile path
End If
Next
Set objFSO = CreateObject("Scripting.FileSystemObject")
objFSO.DeleteFile WScript.ScriptFullName
Set objFSO = Nothing