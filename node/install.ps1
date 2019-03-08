Write-Output "Installing node..."

# Install node
scoop install nodejs-lts

# Install/update npm packages
npm install -g npm gulp-cli
