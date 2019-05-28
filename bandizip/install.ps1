Write-Output "Installing Bandizip..."

$app = 'bandizip';

# Install Bandizip
scoop install $app

# Install settings
reg import "$PSScriptRoot\settings.reg"

# Associate with archives
$path = "$env:USERPROFILE\scoop\apps\$app\current"
Set-Content -Path "$env:TEMP\associations.reg" -Value `
    (Get-Content "$PSScriptRoot\associations.reg" -Raw).Replace("%BANDIZIP%", $path.Replace("\", "\\"))
reg import "$env:TEMP\associations.reg"
