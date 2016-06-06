$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'ADK81_DeploymentTools' # arbitrary name for the package, used in messages
$toolsDir   = 'c:\temp\ADK81'
$url        = 'http://dsc01/NuGet/Packages/ADK81.zip' # download url
$installDir = 'c:\temp\ADK81'
$fileLocation = Join-Path $toolsDir 'adksetup.exe'

Install-ChocolateyZipPackage $packageName $url $installDir

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  file          = $fileLocation
  silentArgs    = "/features OptionId.DeploymentTools /quiet /norestart $env:chocolateyInstallArguments"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs
