Write-Output "Installing Link Shell Extension..."

if (Test-Path "$env:ProgramFiles\LinkShellExtension") {
    exit
}

$download = 'http://schinagl.priv.at/nt/hardlinkshellext/HardLinkShellExt_X64.exe'
$installer = "$env:TEMP\HardLinkShellExt_X64.exe"

try {
    (New-Object System.Net.WebClient).DownloadFile($download, $installer)
    sudo $installer /S
}

catch {
    throw $_
}
