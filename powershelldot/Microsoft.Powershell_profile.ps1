function getpubip {(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content}
Set-Alias pubip getpubip

function CD32 {set-location c:\windows\system32}
Set-Alias go32 cd32

function edithost {code c:\windows\system32\drivers\etc\hosts}
Set-Alias host edithost

function getrouterip {(Get-NetRoute | Where-Object { $_.DestinationPrefix -eq '0.0.0.0/0' }).NextHop}
Set-Alias routerip getrouterip