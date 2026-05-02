# WAVFX VST3 Installer Script
# Copies the built VST3 plugin to the system VST3 folder

$ErrorActionPreference = "Stop"

# Source: Built VST3 in the project
$sourcePath = "C:\Users\koryi\Desktop\APPS\WAVFX\build\WAVFX_artefacts\Release\VST3\WAVFX.vst3"

# Destination: System VST3 folder (standard Windows location)
$destPath = "$env:COMMONPROGRAMFILES\VST3\WAVFX.vst3"

Write-Host "WAVFX VST3 Installer" -ForegroundColor Cyan
Write-Host "===================" -ForegroundColor Cyan
Write-Host ""

# Check if source exists
if (-Not (Test-Path $sourcePath)) {
    Write-Host "ERROR: Built VST3 not found at:" -ForegroundColor Red
    Write-Host $sourcePath -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Please build the plugin first using:" -ForegroundColor Yellow
    Write-Host "  cmake --build Build --config Release" -ForegroundColor White
    exit 1
}

Write-Host "Source:      $sourcePath" -ForegroundColor Green
Write-Host "Destination: $destPath" -ForegroundColor Green
Write-Host ""

# Remove old version if it exists
if (Test-Path $destPath) {
    Write-Host "Removing old version..." -ForegroundColor Yellow
    Remove-Item -Path $destPath -Recurse -Force
}

# Copy the VST3 bundle (it's a folder structure)
Write-Host "Copying VST3..." -ForegroundColor Yellow
Copy-Item -Path $sourcePath -Destination $destPath -Recurse -Force

Write-Host ""
Write-Host "SUCCESS! WAVFX.vst3 installed to:" -ForegroundColor Green
Write-Host $destPath -ForegroundColor White
Write-Host ""
Write-Host "You can now use WAVFX in your DAW." -ForegroundColor Cyan
Write-Host "Restart your DAW if it's currently running to detect the plugin." -ForegroundColor Cyan
