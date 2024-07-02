$profilePath = Split-Path -Path $PROFILE
$pwshProfileUrl = "https://raw.githubusercontent.com/brootware/dotfiles/main/powershelldot/Microsoft.Powershell_profile.ps1"
$pwshFile = Join-Path -Path $profilePath -ChildPath "Microsoft.PowerShell_profile.ps1"

Invoke-WebRequest -Uri $pwshProfileUrl -OutFile $pwshFile

$gitconfigUrl = "https://raw.githubusercontent.com/brootware/dotfiles/main/home/.gitconfig"
$gitconfigFile = Join-Path -Path $HOME -ChildPath ".gitconfig"

Invoke-WebRequest -Uri $gitconfigUrl -OutFile $gitconfigFile

git config --global user.email "$env:USERNAME@$env:COMPUTERNAME.com"
git config --global user.name $env:USERNAME