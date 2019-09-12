Write-Output "Installing taskbar tweaker..."

# Install config file
if (-not (Test-Path "$env:USERPROFILE\scoop\persist\7tt\7+ Taskbar Tweaker.ini")) {
    New-Item -Path "$env:USERPROFILE\scoop\persist\7tt" -Type Directory -Force
    Copy-Item -Path "$PSScriptRoot\7+ Taskbar Tweaker.ini" -Destination "$env:USERPROFILE\scoop\persist\7tt\"
}

# Install 7tt
scoop install 7tt

# Start 7tt on boot
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /f /v "7 Taskbar Tweaker" /t REG_SZ /d `
    "\`"$env:USERPROFILE\scoop\apps\7tt\current\7+ Taskbar Tweaker.exe\`" -hidewnd"

# Start 7tt now
if (-not (Get-Process | Where-Object { $_.Name -like '7+ Taskbar Tweaker*'} )) {
    & "$env:USERPROFILE\scoop\apps\7tt\current\7+ Taskbar Tweaker.exe" -hidewnd
}
