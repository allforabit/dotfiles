#Persistent   
SetTitleMatchMode, 2 ; match part of the title
Return

;; TODO get chrome and chrome canary working again

#b:: ;Browser (chrome)
if WinExist("ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
{
    if WinActive("ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
    {
        SendInput !{Esc}
    }
    else
        WinActivate
    return
}
else
    Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
return


#c:: ;Chromium
if WinExist("ahk_exe C:\Users\Admin\AppData\Local\Google\Chrome SxS\Application\chrome.exe")
{
    if WinActive("ahk_exe C:\Users\Admin\AppData\Local\Google\Chrome SxS\Application\chrome.exe")
    {
        SendInput !{Esc}
    }
    else
        WinActivate
    return
}
else
    Run, % """C:\Users\Admin\AppData\Local\Google\Chrome SxS\Application\chrome.exe"" --remote-debugging-port=9222"
return


#f:: ;Firefox
if WinExist("ahk_class MozillaWindowClass")
{
    if WinActive("ahk_class MozillaWindowClass")
    {
        SendInput !{Esc}
    }
    else
        WinActivate
    return
}
else
    Run "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
return

#e:: ;Emacs
if WinExist("ahk_class Emacs")
{
    if WinActive("ahk_class Emacs")
    {
        SendInput !{Esc}
    }
    else
        WinActivate
    return
}
else
    Run  C:\emacs\bin\runemacs.exe
return


#v:: ;Visual studio code
if WinExist("Visual Studio Code")
{
    if WinActive("Visual Studio Code")
    {
        SendInput !{Esc}
    }
    else
        WinActivate
    return
}
else
    Run C:\Program Files\Microsoft VS Code\Code.exe
return

#t:: ;Terminal (chrome)
if WinExist("ahk_exe ConEmu64.exe")
{
    if WinActive("ahk_exe ConEmu64.exe")
    {
        SendInput !{Esc}
    }
    else
        WinActivate
    return
}
else
    Run "C:\Program Files\ConEmu\ConEmu64.exe"
return
