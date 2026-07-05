<#
.SYNOPSIS
    The Windows Installer Always install with elevated privileges must be disabled.

.NOTES
    Author          : Michael Henderson
    LinkedIn        : linkedin.com/in/michael-henderson-863b28a5
    GitHub          : github.com/heymichael85
    Date Created    : 2026-07-05
    Last Modified   : 2026-07-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000315
    Documentation   : https://www.stigaview.com/products/win10/v3r4/WN10-CC-000315/

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
$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer'

# Create the registry key if it doesn't exist
if (-not (Test-Path -Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Create or update the AlwaysInstallElevated DWORD value
New-ItemProperty -Path $RegistryPath `
    -Name 'AlwaysInstallElevated' `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

Write-Host "AlwaysInstallElevated has been set to 0."
