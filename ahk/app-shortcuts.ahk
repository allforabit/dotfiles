#Persistent   
SetTitleMatchMode, 2 ; match part of the title
Return

#b:: ;Browser (chrome)
if WinExist("Google Chrome")
{
    if WinActive("Google Chrome")
    {
        SendInput !{Esc}
    }
    else
        WinActivate
    return
}
else
    Run Chrome.exe
return


#c:: ;Chromium
if WinExist("Chromium")
{
    if WinActive("Chromium")
    {
        SendInput !{Esc}
    }
    else
        WinActivate
    return
}
else
    Run C:\Users\Admin\AppData\Local\Chromium\Application\Chrome.exe
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
    Run C:\Program Files\emacs\bin\runemacs.exe
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

; Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
