
# /etc/host edit equivalent of bash
function EditHosts { code $env:windir\System32\Drivers\etc\hosts }
Set-Alias -Name hosts -Value EditHosts

function getpubip {(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content}
Set-Alias -Name pubip -Value getpubip

function getrouterip {(Get-NetRoute | Where-Object { $_.DestinationPrefix -eq '0.0.0.0/0' }).NextHop}
Set-Alias -Name routerip -Value getrouterip