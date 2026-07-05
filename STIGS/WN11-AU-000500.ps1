<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Michael Henderson
    LinkedIn        : linkedin.com/in/michael-henderson-863b28a5/
    GitHub          : github.com/heymichael85
    Date Created    : 2026-07-05
    Last Modified   : 2026-07-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000500/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-AU-000500).ps1 
#>

# Registry path
$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application'

# Create the key if it doesn't exist
if (-not (Test-Path -Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the MaxSize value to 0x8000 (32768 decimal)
New-ItemProperty -Path $RegistryPath `
    -Name 'MaxSize' `
    -PropertyType DWord `
    -Value 0x8000 `
    -Force | Out-Null
