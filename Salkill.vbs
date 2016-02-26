DIM objShell
set objShell = wscript.createObject("wscript.shell")
iReturn = objShell.Run("CMD /C SalityKiller.exe -s"  & chr(34), , True)