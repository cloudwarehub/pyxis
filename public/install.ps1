$url = $args[0]

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

function Check-Command($cmdname)
{
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

if (Check-Command -cmdname 'node')
{
    (new-object System.Net.WebClient).DownloadFile($url + "/corona.zip", "C:/corona.zip");
    Unzip c:\corona.zip c:\corona
    node c:\corona\corona\index.js
}
else
{
    "Cannot find nodejs environment! Please install nodejs first."
}

