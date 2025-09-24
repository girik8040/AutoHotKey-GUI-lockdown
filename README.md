## Features (quick)
- **Launch apps** from numpad keys (Chrome, Spotify, Steam).  
- **Window / tab controls** (Alt+F4, Ctrl+Tab, Ctrl+Shift+Tab).  
- **Volume control** (step up/down).  
- **Double-press** detection (example: double-press NumpadUp runs `steamkill.bat`).  
- **Lockdown script** (`Ctrl+H`), starts shutdown timer; cancel with correct password.  
- Configurable via a `config` file (recommended).

## Installation (easy)
1. Install **AutoHotkey v2** from https://www.autohotkey.com/  
2. Clone repo:
```bash
git clone https://github.com/<your-username>/numpad-ahk.git
cd numpad-ahk
```
3. Copy `config/config.example.ini` to `config/config.ini` and update paths & settings.  
4. Double-click `src/numpad.ahk` to run, or run via terminal:
```bash
autohotkey64.exe src\numpad.ahk
```

## Example `config.example.ini`
```ini
; copy this to config.ini and update paths
[Apps]
chrome_path = chrome.exe
spotify_path = C:\Users\Giri Krishna\AppData\Roaming\Spotify\Spotify.exe
steam_path = X:\games\steam shi\steam.exe
steamkill = %A_ScriptDir%\steamkill.bat

[Settings]
volume_step = 2        ; percent
double_press_ms = 300  ; ms for double press
shutdown_timeout = 30  ; seconds to shutdown after Ctrl+H
```

## Usage (hotkey summary)
- **NumpadSub** → Launch Chrome  
- **NumpadMult** → Launch Spotify  
- **NumpadHome** → Launch Steam  
- **NumpadDel** → Alt+F4 (close window)  
- **NumpadRight/Left** → Win+Ctrl+Right/Left (switch virtual desktops)  
- **NumpadAdd** → Volume **+** (`volume_step`)  
- **NumpadEnter** → Volume **-** (`volume_step`)  
- **NumpadDown** → Ctrl+Tab (next tab)  
- **NumpadEnd** → Ctrl+Shift+Tab (previous tab)  
- **NumpadPgDn** → Ctrl+W (close tab)  
- **NumpadUp (double-press)** → Run `steamkill.bat` (hidden)  
- **Ctrl+H** (lockdown.ahk) → Start shutdown timer; cancel with correct password

## Lockdown script notes (Ctrl+H)
**How it works (recommended flow):**
1. `Ctrl+H` runs `shutdown /s /t <shutdown_timeout>` (grace period).  
2. Script shows a **masked password GUI**. If the password is correct, it runs `shutdown /a` (abort).  
3. If the password is incorrect or there is no input, shutdown proceeds.

## Good-to-have improvements
- Add `--portable` mode (paths relative to `%A_ScriptDir%`).  
- Add runtime checks (if EXE path is missing, show a friendly TrayTip).  
- Add an **emergency exit** hotkey for the script (e.g., `^+Esc::ExitApp`).  
- Provide a small tray menu (toggle hotkeys on/off).  
- Log errors to `logs/` for debugging (local only).

## .gitignore 
```
# Windows
Thumbs.db
ehthumbs.db

# AutoHotkey compiled/executables
*.exe
*.ahk.exe

# local config / secrets
config/config.ini
*.log
```
