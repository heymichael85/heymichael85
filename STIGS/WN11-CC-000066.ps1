<#
.SYNOPSIS
    Command line data must be included in process creation events.

.NOTES
    Author          : Michael Henderson
    LinkedIn        : linkedin.com/in/michael-henderson-863b28a5
    GitHub          : github.com/heymichael85
    Date Created    : 2026-07-09
    Last Modified   : 2026-07-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000100
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000100/

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
$RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit'

# Create the registry key if it doesn't exist
if (-not (Test-Path -Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Create or update the ProcessCreationIncludeCmdLine_Enabled DWORD value
New-ItemProperty -Path $RegistryPath `
    -Name 'ProcessCreationIncludeCmdLine_Enabled' `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

Write-Host "ProcessCreationIncludeCmdLine_Enabled has been set to 1."

# Verify the setting
Get-ItemProperty -Path $RegistryPath -Name 'ProcessCreationIncludeCmdLine_Enabled'
