Write-Output "Installing KeePassXC..."

$app = 'keepassxc'

# Install config file
if (-not (Test-Path "$env:USERPROFILE\scoop\persist\$app\keepassxc.ini")) {
    New-Item "$env:USERPROFILE\scoop\persist\$app" -Type Directory -Force
    Copy-Item "$PSScriptRoot\keepassxc.ini" "$env:USERPROFILE\scoop\persist\$app\keepassxc.ini"
}

# Install KeePassXC
scoop install $app

# Start KeePassXC on boot
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /f /v "KeePassXC" /t REG_SZ /d "\`"$env:USERPROFILE\scoop\apps\$app\current\KeePassXC.exe\`""

# Start KeePassXC now
& "$env:USERPROFILE\scoop\apps\$app\current\KeePassXC.exe"
