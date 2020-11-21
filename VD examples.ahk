#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, force
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

Gui,Font, s12, Segoe UI
gui, add, text,, Press ^d to come back to this window`nPress ^f to see which desktop this window is in`nPress f1 to see your current virtual desktop`nPress Numpad8 to move this to Desktop2`nPress Numpad2 to go to Desktop2`nPress Numpad6 to move this to Desktop3 and go to Desktop 3 (follow the window)
gui, show,, VD_examplesWinTile

vd_init()
return

^d::
    VD_goToDesktopOfWindow("VD_examplesWinTile")
    ; VD_goToDesktopOfWindow("ahk_exe code.exe")
return
^f::
    msgbox % VD_getDesktopOfWindow("VD_examplesWinTile")
    ; p(VD_getDesktopOfWindow("ahk_exe GitHubDesktop.exe"))
return
f1::
    msgbox % VD_getCurrentVirtualDesktop()
return
f2::
    msgbox % VD_getCount()
return
numpad1::
numpad2::
numpad3::
    VD_goToDesktop(SubStr(A_ThisHotkey, 0)) ;get last character from numpad{N}
return
numpad4::
numpad5::
numpad6::
    wintitleOfActiveWindow:="ahk_id " WinActive("A")
    whichDesktop:=SubStr(A_ThisHotkey, 0) - 3
    VD_sendToDesktop(wintitleOfActiveWindow,whichDesktop,true) ;get last character from numpad{N} and minus 6
return
numpad7::
numpad8::
numpad9::
    wintitleOfActiveWindow:="ahk_id " WinActive("A")
    whichDesktop:=SubStr(A_ThisHotkey, 0) - 6 ;get last character from numpad{N} and minus 3
    VD_sendToDesktop(wintitleOfActiveWindow,whichDesktop) 
return

f3::Exitapp