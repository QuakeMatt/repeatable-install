# Install/update scoop
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
} else {
    scoop update
}

# Install/update main dependencies
scoop install 7zip git
scoop bucket add extras
scoop bucket add arch 'https://github.com/QuakeMatt/repeatable-install'
scoop update *

# Update the repeatable-install repository
if (Test-Path "$env:USERPROFILE\Platform\repeatable-install") {
    Push-Location "$env:USERPROFILE\Platform\repeatable-install"
    git fetch
    git checkout master
    git reset --hard origin/master
    Pop-Location
}

# Run software installation
& "$PSScriptRoot/7tt/install.ps1"
& "$PSScriptRoot/bandizip/install.ps1"
& "$PSScriptRoot/console/install.ps1"
& "$PSScriptRoot/firefox/install.ps1"
& "$PSScriptRoot/git/install.ps1"
& "$PSScriptRoot/hotkeys/install.ps1"
& "$PSScriptRoot/node/install.ps1"
& "$PSScriptRoot/notepad/install.ps1"
& "$PSScriptRoot/picpick/install.ps1"
& "$PSScriptRoot/vscode/install.ps1"

# Clean up
scoop cleanup *

# Run system configuration
& "$PSScriptRoot/explorer/install.ps1"
