 # WAVFX VST3 Installer Script
# Copies the selected built VST3 plugin to the system VST3 folder

param(
    [ValidateSet('Release', 'Debug')]
    [string]$Configuration
)

$ErrorActionPreference = "Stop"

function Resolve-Configuration {
    param([string]$SelectedConfiguration)

    if ($SelectedConfiguration) {
        return $SelectedConfiguration
    }

    Write-Host "Choose VST3 build to install:" -ForegroundColor Cyan
    Write-Host "  [R] Release" -ForegroundColor Green
    Write-Host "  [D] Debug" -ForegroundColor Yellow

    while ($true) {
        $choice = Read-Host "Enter R or D"

        switch (([string]$choice).Trim().ToUpperInvariant()) {
            'R' { return 'Release' }
            'RELEASE' { return 'Release' }
            'D' { return 'Debug' }
            'DEBUG' { return 'Debug' }
            default {
                Write-Host "Please enter R for Release or D for Debug." -ForegroundColor Yellow
            }
        }
    }
}

$Configuration = Resolve-Configuration -SelectedConfiguration $Configuration

$currentIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal($currentIdentity)
$isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-Not $isAdmin) {
    Write-Host "[STATUS] Requesting administrator privileges to install into Common Files..." -ForegroundColor Yellow

    try {
        Start-Process -FilePath "powershell.exe" -Verb RunAs -ArgumentList @(
            "-ExecutionPolicy", "Bypass",
            "-File", ('"{0}"' -f $PSCommandPath),
            "-Configuration", $Configuration
        ) | Out-Null
        Write-Host "[STATUS] Elevated installer launched." -ForegroundColor Yellow
        exit 0
    }
    catch {
        Write-Host "[FAILED] Administrator privileges are required to install to $env:COMMONPROGRAMFILES\VST3." -ForegroundColor Red
        Write-Host "Run this script from an elevated PowerShell window, or accept the UAC prompt when asked." -ForegroundColor Yellow
        exit 1
    }
}

# Resolve paths relative to this script so the repo can live anywhere.
$repoRoot = Split-Path -Parent $PSScriptRoot
$sourcePath = Join-Path $repoRoot "build\WAVFX_artefacts\$Configuration\VST3\WAVFX.vst3"

# Destination: System VST3 folder (standard Windows location)
$destRoot = Join-Path $env:COMMONPROGRAMFILES "VST3"
$destPath = Join-Path $destRoot "WAVFX.vst3"

Write-Host "WAVFX VST3 Installer ($Configuration)" -ForegroundColor Cyan
Write-Host "===============================" -ForegroundColor Cyan
Write-Host ""

try {
    if (-Not (Test-Path $sourcePath)) {
        throw "Built $Configuration VST3 not found at: $sourcePath"
    }

    Write-Host "Source:        $sourcePath" -ForegroundColor Green
    Write-Host "Destination:   $destPath" -ForegroundColor Green
    Write-Host "Configuration: $Configuration" -ForegroundColor Green
    Write-Host ""

    if (-Not (Test-Path $destRoot)) {
        New-Item -Path $destRoot -ItemType Directory -Force | Out-Null
    }

    if (Test-Path $destPath) {
        Write-Host "[STATUS] Removing old version..." -ForegroundColor Yellow
        Remove-Item -Path $destPath -Recurse -Force
    }

    Write-Host "[STATUS] Copying $Configuration VST3..." -ForegroundColor Yellow
    Copy-Item -Path $sourcePath -Destination $destPath -Recurse -Force

    Write-Host ""
    Write-Host "[SUCCESS] WAVFX.vst3 installed to:" -ForegroundColor Green
    Write-Host $destPath -ForegroundColor White
    Write-Host ""
    Write-Host "You can now load the $Configuration build of WAVFX in your DAW." -ForegroundColor Cyan
    Write-Host "Restart your DAW if it's currently running to detect the plugin." -ForegroundColor Cyan
    exit 0
}
catch {
    Write-Host "[FAILED] $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Please build the plugin first using:" -ForegroundColor Yellow
    Write-Host "  cmake --build Build --config $Configuration" -ForegroundColor White
    exit 1
}
