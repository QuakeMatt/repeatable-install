Write-Output "Configuring explorer..."

reg import "$PSScriptRoot\add-user-folder.reg"
reg import "$PSScriptRoot\apply-explorer-settings.reg"
reg import "$PSScriptRoot\apply-sound-settings.reg"

& "$PSScriptRoot\install-surface.ps1"

if (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}') {
    sudo "$PSScriptRoot\install-admin.ps1"
}

Write-Output "Restarting explorer..."
Stop-Process -ProcessName explorer
