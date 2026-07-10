<#
.SYNOPSIS
    The use of a hardware security device with Windows Hello for Business must be enabled.

.NOTES
    Author          : Michael Henderson
    LinkedIn        : linkedin.com/in/michael-henderson-863b28a5
    GitHub          : github.com/heymichael85
    Date Created    : 2026-07-09
    Last Modified   : 2026-07-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000255
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000255/

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
$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork'

# Create the registry key if it doesn't exist
if (-not (Test-Path -Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Create or update the RequireSecurityDevice DWORD value
New-ItemProperty -Path $RegistryPath `
    -Name 'RequireSecurityDevice' `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

Write-Host "RequireSecurityDevice has been set to 1."

# Verify the setting
Get-ItemProperty -Path $RegistryPath -Name 'RequireSecurityDevice'
