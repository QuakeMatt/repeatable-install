Write-Output "Configuring explorer..."

reg import "$PSScriptRoot\add-user-folder.reg"
reg import "$PSScriptRoot\explorer-settings.reg"
reg import "$PSScriptRoot\sound-settings.reg"

Write-Output "Restarting explorer..."
Stop-Process -ProcessName explorer
