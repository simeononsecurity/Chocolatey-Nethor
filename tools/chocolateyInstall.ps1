$ErrorActionPreference = 'Stop'

$targetPath = Join-Path -Path $Env:chocolateyPackageFolder -ChildPath tools
$validExitCodes = @(0, 3010, 1641)
$url = "https://softpedia-secure-download.com/dl/845a81ed96b6b23e3434b68c18756477/628be850/100262905/software/network/nethor-2022.0.0-setup.exe"
$arguments = @{
    packageName    = 'nethor'
    #softwareName  = 'nethor*'
    url            = $url
    url64bit       = $url
    checksum       = '52428631ef6ce75c729c76378ec6a835b0f7341cbbdcd6b70beda90e9b51c343'
    checksumType   = 'sha256'
    checksum64     = '52428631ef6ce75c729c76378ec6a835b0f7341cbbdcd6b70beda90e9b51c343'
    checksumType64 = 'sha256'
    filetype       = 'EXE'
    silentArgs     = "/SP /VERYSILENT /SUPPRESSMSGBOXES/ NOCANCEL /NORESTART" 
}

$ignoreFilePath = Join-Path -Path $targetPath -ChildPath "${Env:PROCESSOR_ARCHITECTURE}\nethor-setup.exe.ignore"
if (Test-Path -Path $ignoreFilePath) {
    Remove-Item -Path $ignoreFilePath
}
else {
    Write-Warning "Unsupported processor architecture: $Env:PROCESSOR_ARCHITECTURE"
}

Install-ChocolateyPackage @arguments -validExitCodes $validExitCodes

Write-Output 'The Nethor documentation is available at https://nethor.com/'