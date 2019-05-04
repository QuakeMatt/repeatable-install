Write-Output "Installing Notepad2..."

$app = 'x-notepad2-mod'

# Install config
if (-not (Test-Path "$env:USERPROFILE\scoop\persist\$app\Notepad2.ini")) {
    New-Item -Path "$env:USERPROFILE\scoop\persist\$app" -Type Directory -Force
    Copy-Item "$PSScriptRoot\Notepad2.ini" "$env:USERPROFILE\scoop\persist\$app\Notepad2.ini"
}

# Install Notepad2
scoop install $app

# Replace build-in Notepad
$path = "$env:USERPROFILE\scoop\apps\$app\current\Notepad2.exe"
Set-Content -Path "$env:TEMP\replace-notepad.reg" -Value `
    (Get-Content "$PSScriptRoot\replace-notepad.reg" -Raw).Replace("%NOTEPAD2%", $path.Replace("\", "\\"))
sudo reg import "$env:TEMP\replace-notepad.reg"
