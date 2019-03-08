Write-Output "Installing git..."

# Install git
scoop install git sudo

# Configure git
git config --global user.name "Matthew Lawrence-Stubley"
git config --global user.email "quakematt@outlook.com"
git config --global core.autocrlf input
git config --global core.editor notepad

# Configure OpenSSH
sudo Set-Service ssh-agent -StartupType Automatic
$ssh = (Get-Command 'ssh.exe').Path
git config --global core.sshCommand "'$ssh'"

# Add aliases
git config --global alias.lol "log --pretty=oneline --abbrev-commit --graph --decorate"

# Install posh-git
scoop install posh-git
Add-PoshGitToProfile
