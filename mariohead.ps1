
Install-Module ps2exe -Scope CurrentUser -Force

$url = "https://cdn.hackclub.com/01a137e7-fafb-7f4a-8b99-1636149c9fab/video.mp4"

$code = @'
$url = "https://cdn.hackclub.com/01a137e7-fafb-7f4a-8b99-1636149c9fab/video.mp4"
$video = "$env:TEMP\video.mp4"

Add-Type -AssemblyName PresentationFramework

$w = New-Object Windows.Window
$w.WindowStyle = "None"
$w.WindowState = "Maximized"
$w.Background = "Black"

$m = New-Object Windows.Controls.MediaElement
$m.LoadedBehavior = "Manual"
$m.UnloadedBehavior = "Close"
$m.Stretch = "Uniform"
$m.Volume = 1

$w.Content = $m

$w.Add_KeyDown({
    if ($_.Key -eq "Escape") { $w.Close() }
})

$w.Add_Loaded({
    try {
        Invoke-WebRequest $url -OutFile $video
        $m.Source = [uri]$video
        $m.Play()
    } catch {
        [System.Windows.MessageBox]::Show("Could not download the video.")
        $w.Close()
    }
})

$m.Add_MediaEnded({
    $m.Position = [timespan]::Zero
    $m.Play()
})

$w.ShowDialog() | Out-Null
'@

$source = "$env:TEMP\VideoPlayer.ps1"
$output = "$env:USERPROFILE\Desktop\VideoPlayer.exe"

Set-Content -Path $source -Value $code

Invoke-ps2exe -inputFile $source -outputFile $output -noConsole

Write-Host "Created: $output" -ForegroundColor Green
