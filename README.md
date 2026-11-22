# Mario-head

[![License: MIT](https://img.shields.io/github/license/htmlfan123/Mario-head)](LICENSE)
[![Windows](https://img.shields.io/badge/platform-Windows-blue)](#requirements)
[![PowerShell](https://img.shields.io/badge/language-PowerShell-5391FE)](mariohead.ps1)
[![Stars](https://img.shields.io/github/stars/htmlfan123/Mario-head)](https://github.com/htmlfan123/Mario-head/stargazers)

A Windows fullscreen video player that downloads a Mario head MP4, plays it in a borderless maximized window, and loops it until closed.

## Features

- Fullscreen, borderless playback
- Automatic looping
- Audio playback
- `Esc` key to close
- No console window in the packaged executable
- Temporary video download in the Windows temp folder

## Requirements

- Windows
- PowerShell
- An internet connection for the initial video download
- Windows Presentation Framework

## Download and Run

### Run the executable

Download `mariohead.exe` from the repository and run it.

The video opens in fullscreen. Press `Esc` to close it.

### Run the PowerShell script

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\mariohead.ps1
```

The script can install PS2EXE and create `VideoPlayer.exe` on your desktop.

## Customize the Video

Open `mariohead.ps1` and replace the URL:

```powershell
$url = "https://cdn.hackclub.com/01a137e7-fafb-7f4a-8b99-1636149c9fab/video.mp4"
```

Then run the script again.

Build an executable manually:

```powershell
Install-Module ps2exe -Scope CurrentUser -Force
Invoke-ps2exe -InputFile .\mariohead.ps1 -OutputFile .\mariohead.exe -NoConsole
```

## How It Works

1. Downloads the configured MP4 to `%TEMP%\video.mp4`.
2. Creates a maximized, borderless WPF window.
3. Loads the downloaded file into a `MediaElement`.
4. Restarts playback when the media reaches the end.
5. Closes the window when `Esc` is pressed.

## Troubleshooting

- **The window does not open:** Verify that Windows and .NET/WPF are available.
- **A download error appears:** Check the internet connection and confirm that the configured URL is reachable.
- **PowerShell blocks the script:** Run `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`, then try again.
- **Execution policy is restricted:** Use the executable or contact your administrator.

## Project Structure

```text
Mario-head/
├── mariohead.ps1
├── mariohead.exe
├── LICENSE
└── README.md
```

## License

This project is licensed under the [MIT License](LICENSE).
