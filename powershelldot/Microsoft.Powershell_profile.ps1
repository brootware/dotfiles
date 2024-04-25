function getpubip {(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content}
Set-Alias pubip getpubip

function CD32 {set-location c:\windows\system32}
Set-Alias go cd32

function edithost {code c:\windows\system32\drivers\etc\hosts}
Set-Alias host edithost