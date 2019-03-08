# Install/update scoop
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
} else {
    scoop update
}

# Install/update main dependencies
scoop install 7zip git
scoop bucket add extras
scoop bucket add repeatable-install 'https://github.com/QuakeMatt/repeatable-install'
scoop update *

# Run software installation
& "$PSScriptRoot/7tt/install.ps1"
& "$PSScriptRoot/console/install.ps1"
& "$PSScriptRoot/git/install.ps1"
& "$PSScriptRoot/hotkeys/install.ps1"
& "$PSScriptRoot/node/install.ps1"
& "$PSScriptRoot/picpick/install.ps1"

# Run system configuration
& "$PSScriptRoot/explorer/install.ps1"
