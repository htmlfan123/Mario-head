# Mario-head

A lightweight Windows fullscreen video player that downloads a Mario head MP4, plays it in a borderless maximized window, and loops it until closed.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform: Windows](https://img.shields.io/badge/platform-Windows-lightgrey.svg)](#requirements)

## Features

- Fullscreen, borderless playback
- Automatic looping
- Audio playback
- `Esc` key to close
- No console window in the packaged executable
- Temporary video download, stored in the Windows temp folder

## Requirements

- Windows
- PowerShell
- An internet connection for the initial video download
- Windows Presentation Framework (included with supported Windows desktop installations)

## Download and Run

### Option 1: Run the executable

Download `mariohead.exe` from the [releases](../../releases) page and run it.

The video opens in fullscreen. Press `Esc` to close it.

> **Security note:** Downloaded executables may trigger SmartScreen warnings. Only run files from sources you trust.

### Option 2: Run the PowerShell script

```powershell
# Allow this one script to run for the current PowerShell process
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

.\mariohead.ps1
```

On first run, the script may install `PS2EXE`. It then creates `VideoPlayer.exe` on your desktop.

## Customize the Video

Open `mariohead.ps1` and change this line:

```powershell
$url = "https://cdn.hackclub.com/01a137e7-fafb-7f4a-8b99-1636149c9fab/video.mp4"
```

Replace the URL with a direct link to your own MP4, then run the script again.

You can also build an executable from the script manually:

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

- **The window does not open:** Verify that you are using Windows and that .NET/WPF is available.
- **A download error appears:** Check your internet connection and confirm that the configured URL is reachable.
- **PowerShell blocks the script:** Run `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass` in the PowerShell window, then try again.
- **Execution policy is restricted by an organization:** Use the prebuilt executable if available, or ask your administrator.

## Project Structure

```text
Mario-head/
├── mariohead.ps1  # PowerShell launcher and executable builder
├── mariohead.exe  # Prebuilt Windows executable
├── LICENSE        # MIT license
└── README.md
```

## License

This project is licensed under the [MIT License](LICENSE).
