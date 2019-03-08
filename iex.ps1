Write-Output "Installing scoop..."
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

Write-Output "Installing git..."
scoop install 7zip git

Write-Output "Creating platform directory..."
New-Item -Path "$env:USERPROFILE\Platform" -Type Directory -Force

Write-Output "Cloning repeatable-install..."
git clone "https://github.com/QuakeMatt/repeatable-install.git" "$env:USERPROFILE\Platform\repeatable-install"

Write-Output "Running main script..."
& "$env:USERPROFILE\Platform\repeatable-install\install.ps1"
