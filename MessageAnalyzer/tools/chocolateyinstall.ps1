$ErrorActionPreference = 'Stop';

$packageName= 'MessageAnalyzer'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dsc01/NuGet/Packages/messageAnalyzer64.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  
  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`" $env:chocolateyInstallArguments" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'MessageAnalyzer*'
}

Install-ChocolateyPackage @packageArgs
