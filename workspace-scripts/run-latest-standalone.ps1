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

    Write-Host "Choose standalone build to launch:" -ForegroundColor Cyan
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
$repoRoot = Split-Path -Parent $PSScriptRoot

$candidatePatterns = @(
    "build\WAVFX_artefacts\$Configuration\Standalone\WAVFX.exe",
    "Build\WAVFX_artefacts\$Configuration\Standalone\WAVFX.exe"
)

$candidates = foreach ($relativePath in $candidatePatterns) {
    $fullPath = Join-Path $repoRoot $relativePath
    if (Test-Path $fullPath) {
        Get-Item $fullPath
    }
}

if (-not $candidates) {
    $candidates = Get-ChildItem -Path $repoRoot -Recurse -File -Filter "WAVFX.exe" |
        Where-Object {
            $_.FullName -match "[\\/](build|Build)[\\/].*[\\/]$Configuration[\\/].*[\\/]Standalone[\\/]WAVFX\.exe$"
        }
}

$latestExe = $candidates |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1

if (-not $latestExe) {
    Write-Error "Could not find a $Configuration standalone WAVFX.exe under the repo. Build $Configuration first with: cmake --build Build --config $Configuration"
}

Write-Host "Launching $Configuration standalone: $($latestExe.FullName)" -ForegroundColor Cyan
Start-Process $latestExe.FullName
