Write-Output "Configuring console..."

# Clear all existing settings
scoop install concfg
concfg clean

# Add to explorer context menu
reg import "$PSScriptRoot\add-to-explorer.reg"

# Install settings
reg import "$PSScriptRoot\console-settings.reg"
