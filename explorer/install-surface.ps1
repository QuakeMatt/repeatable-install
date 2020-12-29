$registryPath = "HKLM:\SYSTEM\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000"
$propertyName = "FeatureTestControl"
$expectedValue = 37440

if (Test-Path $registryPath) {

    $currentValue = Get-ItemProperty $registryPath |`
        Select-Object -ExpandProperty $propertyName -ErrorAction Ignore;

    if ($currentValue -eq $expectedValue) {
        Write-Output "Setting Surface auto-contrast flag..."
        sudo reg import "$PSScriptRoot\fix-surface-auto-contrast.reg"
    }
}
