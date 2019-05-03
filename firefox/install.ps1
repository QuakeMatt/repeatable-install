Write-Output "Installing Firefox..."

$app = 'x-firefox'

# Install Firefox
scoop install $app

# Create the default profile
if (-not (Test-Path "$env:APPDATA\Mozilla\Firefox\Profiles\*.default")) {
    firefox -CreateProfile default
    Start-Sleep -Seconds 5
}

# Create prefs.js
$prefs = (Resolve-Path "$env:APPDATA\Mozilla\Firefox\Profiles\*.default").Path + '\prefs.js'
if (-not (Test-Path $prefs)) {
    Copy-Item -Path "$PSScriptRoot\prefs-new.js" -Destination $prefs
}

# Update prefs.js
Add-Content $prefs (Get-Content "$PSScriptRoot\prefs-update.js")
