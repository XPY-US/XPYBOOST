# XPYBOOST Debloater - Removes UWP Bloatware
Write-Host "Starting XPYBOOST Deep Debloat..." -ForegroundColor Cyan

$Bloatware = @(
    "*Microsoft.BingWeather*"
    "*Microsoft.GetHelp*"
    "*Microsoft.Getstarted*"
    "*Microsoft.Messaging*"
    "*Microsoft.MicrosoftSolitaireCollection*"
    "*Microsoft.People*"
    "*Microsoft.SkypeApp*"
    "*Microsoft.YourPhone*"
    "*Microsoft.ZuneVideo*"
    "*Microsoft.ZuneMusic*"
    "*Microsoft.WindowsFeedbackHub*"
    "*Microsoft.XboxApp*"
)

foreach ($App in $Bloatware) {
    Write-Host "Removing $App..." -ForegroundColor Yellow
    Get-AppxPackage -Name $App -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
}

Write-Host "Optimizing Windows Store Updates..." -ForegroundColor Cyan
Reg Add "HKLM\Software\Policies\Microsoft\WindowsStore" /v AutoDownload /t REG_DWORD /d 2 /f

Write-Host "Debloat Complete!" -ForegroundColor Green
