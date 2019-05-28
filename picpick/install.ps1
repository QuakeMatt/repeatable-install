Write-Output "Installing PicPick..."

$app = 'picpick';

# Install config
if (-not (Test-Path "$env:USERPROFILE\scoop\persist\$app\picpick.ini")) {
    New-Item -Path "$env:USERPROFILE\scoop\persist\$app" -Type Directory -Force
    Set-Content -Path "$env:USERPROFILE\scoop\persist\$app\picpick.ini" -Value `
        (Get-Content "$PSScriptRoot\picpick.ini" -Raw).Replace("%USERPROFILE%", $env:USERPROFILE)
}

# Install PicPick
scoop install $app

# Start PicPick on boot
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /f /v "PicPick Start" /t REG_SZ /d "\`"$env:USERPROFILE\scoop\apps\$app\current\picpick.exe\`" /startup"

# Start PicPick now
& "$env:USERPROFILE\scoop\apps\$app\current\picpick.exe" /startup
