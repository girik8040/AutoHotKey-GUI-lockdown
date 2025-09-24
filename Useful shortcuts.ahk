#Requires AutoHotkey v2.0
NumpadSub::
{
    Run "chrome.exe"
    return
}

NumpadMult::
{
    Run "C:\Users\Giri Krishna\AppData\Roaming\Spotify\Spotify.exe"
    return
}

NumpadDel::
{
    send "!{F4}"
    return
}

NumpadRight::
{
    send "#^{Right}"
    return
}

NumpadLeft::
{
    send "#^{Left}"
    return
}

NumpadAdd::
{
    SoundSetVolume "+2"  ; Increase volume by 2%
    volume := SoundGetVolume()
}

NumpadEnter::
{
    SoundSetVolume "-2"  ; Decrease volume by 2%
}

NumpadEnd::
{
    send "^+{Tab}"
    return
}

NumpadDown::
{
    send "^{Tab}"
    return
}

NumpadPgDn::
{
    send "^{w}"
    return
}

NumpadHome::
{
    Run "X:\games\steam shi\steam.exe"
    return
}

NumpadUp::
{
    static lastPress := 0  ; persists between runs
    current := A_TickCount

    if (current - lastPress < 300)
    {
        Run '"C:\Users\Giri Krishna\Desktop\something related to chemistry\steamkill.bat"', , "Hide"
    }

    lastPress := current
    return
}