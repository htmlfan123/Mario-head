# Mario-head
# Fullscreen Video Player

just a simple windows app that plays a mario head clip mp4.

## Features
- fullscreen video
- audio included
- loops the video
- press `Esc` to close

## How to use
- download the exe from Releases and run it
- or run the `.ps1` script directly in PowerShell

## Make ur own
1. open the `.ps1` script in notepad
2. copy the contents into PowerShell or edit the script to use ur own video URL
3. run it and see if it works
4. wanna make it an exe? use PS2EXE:

```powershell
Install-Module ps2exe -Scope CurrentUser
Invoke-ps2exe .\VideoPlayer.ps1 .\VideoPlayer.exe -noConsole
```

needs an internet connection to download the video.

made with PowerShell, WPF and PS2EXE. pretty simple stuff.
