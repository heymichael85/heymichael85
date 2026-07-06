<#
.SYNOPSIS
    Remote Desktop Services must be configured with the client connection encryption set to the required level.

.NOTES
    Author          : Michael Henderson
    LinkedIn        : linkedin.com/in/michael-henderson-863b28a5
    GitHub          : github.com/heymichael85
    Date Created    : 2026-07-05
    Last Modified   : 2026-07-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000290
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-CC-000290/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# Registry path
$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'

# Create the registry key if it doesn't exist
if (-not (Test-Path -Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Create or update the MinEncryptionLevel DWORD value
New-ItemProperty -Path $RegistryPath `
    -Name 'MinEncryptionLevel' `
    -PropertyType DWord `
    -Value 3 `
    -Force | Out-Null

Write-Host "MinEncryptionLevel has been set to 3."

# Verify the setting
Get-ItemProperty -Path $RegistryPath -Name 'MinEncryptionLevel'
