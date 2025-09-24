^h::  ; Ctrl + H hotkey
{
    FormatTime, now, , yyyy-MM-dd HH:mm:ss
    FileAppend, Ctrl+H pressed at %now%`n, %A_ScriptDir%\history_lock_log.txt

    ; Create a black fullscreen GUI
    Gui, +AlwaysOnTop +ToolWindow -Caption +Border
    Gui, Color, Black
    Gui, Font, s14 cWhite, Verdana
    Gui, Add, Text, Center vMsgText, Enter password to cancel shutdown wall of shame :) smile a picture will be taken.
    Gui, Add, Edit, vUserInput Password y+20 w200 Center
    Gui, Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, Locked

    ; Set up shutdown timer for 20 seconds
    SetTimer, GoShutdown, -20000

    ; Focus on input box
    GuiControl, Focus, UserInput
    return
}

GuiClose:
    ; Prevent closing with Alt+F4 or clicking X
    return

; Enter key pressed inside the Edit field
#IfWinActive, Locked
Enter::
    GuiControlGet, InputText,, UserInput
    if (InputText = "girik8040")  ; Replace with your password
    {
        SetTimer, GoShutdown, Off
        Gui, Destroy
        MsgBox, 64, Access Granted, Welcome back.
    }
    else
    {
        MsgBox, 48, Wrong Password!, Shutdown will begin shortly!
    }
    return
#IfWinActive

GoShutdown()
{
    Gui, Destroy
    Shutdown, 1  ; Shutdown the computer
}

