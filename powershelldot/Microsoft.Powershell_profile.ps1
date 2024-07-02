function prompt
{
    $origLastExitCode = $LASTEXITCODE;
    $folderName = (get-item $pwd).Name;
    # $emoji = [char]::ConvertFromUtf32(0x1F914);  

    if ($isNotWindows) {
        # A bug in PSReadline on .NET Core makes all colored write-host output in prompt 
        # function, including write-vcsstatus, echo twice.
        # https://github.com/PowerShell/PowerShell/issues/1897
        # https://github.com/lzybkr/PSReadLine/issues/468
        "$folderName -> ";
    }
    else {
        Write-Host "$env:computername " -ForegroundColor Green -NoNewLine
        Write-Host $(get-date) -ForegroundColor Green
        Write-Host  "PS" $PWD ">" -nonewline -foregroundcolor White
        return " "
        Write-VcsStatus;
        " -> ";
    }

    # Yarn and msbuild have a habit of corrupting console colors when ctrl+c-ing them. Reset colors on each prompt.
    [Console]::ResetColor();

    $LASTEXITCODE = $origLastExitCode;
}

function getMachineType() {
    if ($IsLinux) {
        return "Linux";
    };

    if ($IsOSX) {
        return "macOS";
    }

    return "Windows";
}

$machineType = getMachineType;
# IsLinux, IsOSX and IsWindows are provided by PS on .NET Core, but not on vanilla Windows. 
$isNotWindows = $IsLinux -or $IsOSX;

# http://mohundro.com/blog/2009/03/31/quickly-extract-files-with-powershell/
function unarchive([string]$file, [string]$outputDir = '') {
    if (-not (Test-Path $file)) {
        $file = Resolve-Path $file
    }

    if ($outputDir -eq '') {
        $outputDir = [System.IO.Path]::GetFileNameWithoutExtension($file)
    }

    7z e "-o$outputDir" $file
}

# http://stackoverflow.com/questions/39148304/fuser-equivalent-in-powershell/39148540#39148540
function fuser($relativeFile) {
    $file = Resolve-Path $relativeFile

    echo "Looking for processes using $file"

    if ($isNotWindows) {
        sudo bash -c "fuser $file.Path";

        return;
    }

    foreach ( $Process in (Get-Process)) {
        foreach ( $Module in $Process.Modules) {
            if ( $Module.FileName -like "$file*" ) {
                $Process | select id, path
            }
        }
    }
}

function findfile($name) {
    ls -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach {
        $place_path = $_.directory
        echo "${place_path}\${_}"
    }
}
function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}

function unzip ($file) {
    $dirname = (Get-Item $file).Basename
    echo("Extracting", $file, "to", $dirname)
    New-Item -Force -ItemType directory -Path $dirname
    expand-archive $file -OutputPath $dirname -ShowProgress
}

# /etc/host edit equivalent of bash
function EditHosts { code $env:windir\System32\Drivers\etc\hosts }
Set-Alias -Name hosts -Value EditHosts

function GetPubip {(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content}
Set-Alias -Name pubip -Value GetPubip

function GetRouterip {(Get-NetRoute | Where-Object { $_.DestinationPrefix -eq '0.0.0.0/0' }).NextHop}
Set-Alias -Name routerip -Value GetRouterip

Set-Alias -Name g -Value "git"

function GoHome { cd ~ }
Set-Alias -Name home -Value GoHome