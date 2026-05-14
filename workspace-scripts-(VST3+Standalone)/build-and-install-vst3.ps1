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

    Write-Host "Choose VST3 build to build and install:" -ForegroundColor Cyan
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

function Invoke-Step {
    param(
        [string]$Action,
        [string]$Configuration,
        [scriptblock]$Command
    )

    Write-Host "[START] $Action WAVFX VST3 ($Configuration)..." -ForegroundColor Cyan
    & $Command

    if ($LASTEXITCODE -ne 0) {
        throw "$Action failed for configuration: $Configuration"
    }

    Write-Host "[SUCCESS] $Action completed for $Configuration." -ForegroundColor Green
}

$Configuration = Resolve-Configuration -SelectedConfiguration $Configuration
$repoRoot = Split-Path -Parent $PSScriptRoot
$buildDirectory = Join-Path $repoRoot 'build'
$installScript = Join-Path $PSScriptRoot 'install-vst3.ps1'

try {
    Invoke-Step -Action 'Build' -Configuration $Configuration -Command {
        Push-Location $repoRoot
        & cmake --build build --config $Configuration
        Pop-Location
    }

    Invoke-Step -Action 'Install' -Configuration $Configuration -Command {
        & $installScript -Configuration $Configuration
    }

    Write-Host "[SUCCESS] Build + install completed for $Configuration." -ForegroundColor Green
    exit 0
}
catch {
    Write-Host "[FAILED] $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
