Write-Output "Installing VSCode..."

$app = 'vscode'

# Install VSCode
scoop install $app
scoop hold $app

# Install settings-sync extension
code.cmd --install-extension 'Shan.code-settings-sync'

# Associate with files
$iconPath = (Resolve-Path "$PSScriptRoot\..\icons").Path
$codePath = "$env:USERPROFILE\scoop\apps\$app\current\Code.exe"
$regContent = (Get-Content "$PSScriptRoot\associations.reg" -Raw).
    Replace("%ICONPATH%", $iconPath.Replace("\", "\\")).
    Replace("%CODEPATH%", $codePath.Replace("\", "\\"))
Set-Content -Path "$env:TEMP\associations.reg" -Value $regContent
reg import "$env:TEMP\associations.reg"
