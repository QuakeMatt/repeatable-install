Write-Output "Configuring explorer..."

reg import "$PSScriptRoot\add-user-folder.reg"
reg import "$PSScriptRoot\apply-explorer-settings.reg"
reg import "$PSScriptRoot\apply-sound-settings.reg"
reg import "$PSScriptRoot\remove-3d-objects.reg"
reg import "$PSScriptRoot\remove-duplicate-drives.reg"

Write-Output "Restarting explorer..."
Stop-Process -ProcessName explorer
