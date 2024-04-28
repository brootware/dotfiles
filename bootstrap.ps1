$profilePath = Split-Path -Path $PROFILE
$downloadUrl = "https://raw.githubusercontent.com/brootware/dotfiles/main/powershelldot/Microsoft.Powershell_profile.ps1"
$outputFile = Join-Path -Path $profilePath -ChildPath "Microsoft.PowerShell_profile.ps1"

Invoke-WebRequest -Uri $downloadUrl -OutFile $outputFile
