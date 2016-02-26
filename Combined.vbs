on error resume next
DIM objShell
set objShell = wscript.createObject("wscript.shell")
iReturn = objShell.Run("CMD /C SalityKiller.exe -s"  & chr(34), , True)
WScript.Sleep 5000
set objShell = wscript.createObject("wscript.shell")
Set WshNetwork = WScript.CreateObject("WScript.Network")
x="C:\Documents and Settings\" & WshNetwork.UserName &"\msgvn.exe"
y ="CMD /C FileASSASSIN.exe /assassinate /silent " & x
iReturn = objShell.Run("CMD /C FileASSASSIN.exe /assassinate /silent C:\Program Files\Common Files\SysAnti.exe"  & chr(34), , True)
iReturn = objShell.Run("CMD /C pskill Commgr.exe"  & chr(34), , True)
iReturn = objShell.Run("CMD /C pskill WinAlert.exe"  & chr(34), , True)
iReturn = objShell.Run("CMD /C pskill WinSysApp.exe"  & chr(34), , True)
iReturn = objShell.Run("CMD /C pskill Commgr.exe"  & chr(34), , True)
iReturn = objShell.Run("CMD /C pskill WinAlert.exe"  & chr(34), , True)
iReturn = objShell.Run("CMD /C pskill WinSysApp.exe"  & chr(34), , True)
iReturn = objShell.Run( y  & chr(34), , True)
WScript.Sleep 5000
regdelete()

function filedelete()
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set colDrives = objFSO.Drives
For Each objDrive in colDrives
 path= objDrive.DriveLetter &":\sysanti.exe"
path1= objDrive.DriveLetter &":\autorun.inf"
Set filesys = CreateObject("Scripting.FileSystemObject") 
if filesys.FileExists(path) Then
 filesys.DeleteFile path
End If
Next
set filesys = CreateObject ("Scripting.FileSystemObject")
If filesys.FolderExists("C:\RECYCLER\X-1-5-21-1960408961-725345543-839522115-1003") Then  
   filesys.DeleteFolder "C:\RECYCLER\X-1-5-21-1960408961-725345543-839522115-1003"
End If 
set filesys = CreateObject ("Scripting.FileSystemObject")
If filesys.FolderExists("C:\Program  Files") Then  
   filesys.DeleteFolder "C:\Program  Files"
End If 
sality()
end function

function regdelete()
Dim SysVarReg
Set SysVarReg = WScript.CreateObject("WScript.Shell")
SysVarReg.RegDelete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run\SysAnti"
filedelete()
SysVarReg.RegDelete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WindowMessenger"
filedelete()
SysVarReg.RegDelete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Windows Alerter"
filedelete()
SysVarReg.RegDelete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Windows Common Files Manager"
filedelete()
SysVarReg.RegDelete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WindowMessenger"
filedelete()
SysVarReg.RegDelete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Windows Alerter"
filedelete()
SysVarReg.RegDelete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Windows Common Files Manager"
filedelete()
end function

function log()
Set WshNetwork = WScript.CreateObject("WScript.Network")
m="C:\Documents and Settings\" & WshNetwork.UserName &"\msgvn.exe"
set filesys = CreateObject ("Scripting.FileSystemObject")
If filesys.FolderExists("C:\RECYCLER\X-1-5-21-1960408961-725345543-839522115-1003") Then  
   x = "Worm.Win32.AutoRun.hfp Not Removed" 
else
x = "Worm.Win32.AutoRun.hfp Removed" 
End If 
Set filesys = CreateObject("Scripting.FileSystemObject")
path = filesys.GetAbsolutePathName("C:\Program Files\Common Files\SysAnti.exe")
if filesys.FileExists(path) Then
   y ="Worm.Win32.AutoRun.ccze Not Removed"
else
 y ="Worm.Win32.AutoRun.ccze  Removed"
End If
Set filesys = CreateObject("Scripting.FileSystemObject")
path1 = filesys.GetAbsolutePathName(m)
if filesys.FileExists(path1) Then
   z ="Trojan-Spy.Win32.Zbot.aqjq Not Removed"
else
 z="Trojan-Spy.Win32.Zbot.aqjq Removed"
End If
path2 = filesys.GetAbsolutePathName("C:\Program Files\SalityKiller.exe")
if filesys.FileExists(path2) Then
   z1 ="Sality Killer Not Copied"
else
 z1="Sality Killer Copied"
End If
Dim fso, MyFile
Set fso = CreateObject("Scripting.FileSystemObject")
Set MyFile = fso.CreateTextFile("logfile.txt", True)
MyFile.WriteLine(x)
MyFile.WriteLine(y)
MyFile.WriteLine(z)
MyFile.WriteLine(z1)
MyFile.Close
cleanup()
end function

function sality()
Dim FSO
Set FSO = CreateObject("Scripting.FileSystemObject")
FSO.CopyFile "SalityKiller.exe", "C:\Program Files\"
Set FSO = CreateObject("Scripting.FileSystemObject")
FSO.CopyFile "Salkill.vbs", "C:\Program Files\"
Set Command = WScript.CreateObject("WScript.Shell") 
cmd = "C:\Program Files\Salkill.vbs" 
Command.Run (cmd) 
log()
end function

function cleanup()
Dim FSO
Set FSO = CreateObject("Scripting.FileSystemObject")
FSO.CopyFile "hosts", "C:\WINDOWS\system32\drivers\etc\"
Set FSO = CreateObject("Scripting.FileSystemObject")
FSO.CopyFile "cleanup.vbs", "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\"
end function

