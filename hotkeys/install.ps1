Write-Output "Installing hotkeys..."

# Install AutoHotkey
scoop install autohotkey

# Associate with .ahk files
Set-Content -Path "$env:TEMP\associate-autohotkey.reg" -Value `
    (Get-Content "$PSScriptRoot\associate-autohotkey.reg" -Raw).Replace("%USERPROFILE%", $env:USERPROFILE.Replace("\", "\\"))
reg import "$env:TEMP\associate-autohotkey.reg"

# Clone hotkeys repository...
if (-not (Test-Path "$env:USERPROFILE\Platform\hotkeys")) {
    New-Item -Path "$env:USERPROFILE\Platform" -Type Directory -Force
    git clone "https://github.com/QuakeMatt/hotkeys.git" "$env:USERPROFILE\Platform\hotkeys"
}

# ...or pull the latest version
else {
    Push-Location "$env:USERPROFILE\Platform\hotkeys"
    git pull
    Pop-Location
}

# Start hotkeys on boot
& "$env:USERPROFILE\Platform\hotkeys\install.ps1"

# Start hotkeys now
& "$env:USERPROFILE\Platform\hotkeys\Hotkeys.ahk"
