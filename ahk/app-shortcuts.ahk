#Persistent   
SetTitleMatchMode, 2 ; match part of the title
Return

#b:: ;Browser (chrome)
if WinExist("Google Chrome")
{
	WinActivate
}
else
    Run Chrome.exe
return


#c:: ;Chromium
if WinExist("Chromium")
{
	WinActivate
}
else
    Run C:\Program Files\Chromium\Chrome.exe
return

#e:: ;Emacs
if WinExist("ahk_class Emacs")
{
	WinActivate
}
else
    Run C:\Program Files\emacs\bin\runemacs.exe
return

; Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe