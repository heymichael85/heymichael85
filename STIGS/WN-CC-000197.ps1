<#
.SYNOPSIS
    This PowerShell script ensures that the Microsoft consumer experiences must be turned off.

.NOTES
    Author          : Michael Henderson
    LinkedIn        : linkedin.com/in/michael-henderson-863b28a5
    GitHub          : github.com/heymichael85
    Date Created    : 2026-07-05
    Last Modified   : 2026-07-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000197
    Documentation   : https://www.stigaview.com/products/win11/v2r3/WN11-CC-000197/

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
$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent'

# Create the registry key if it doesn't exist
if (-not (Test-Path -Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Create or update the DisableWindowsConsumerFeatures DWORD value
New-ItemProperty -Path $RegistryPath `
    -Name 'DisableWindowsConsumerFeatures' `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

Write-Host "DisableWindowsC7onsumerFeatures has been set to 1."
