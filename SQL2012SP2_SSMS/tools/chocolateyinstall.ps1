#https://msdn.microsoft.com/en-us/library/ms144259(v=sql.110).aspx
$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'SQL2012SP2_SSMS' # arbitrary name for the package, used in messages
$toolsDir   = 'c:\temp\SQL2012SP2'
$url        = 'http://dsc01/NuGet/Packages/SQL2012SP2.zip'
$installDir = 'c:\temp\SQL2012SP2'
$fileLocation = Join-Path $toolsDir 'setup.exe'

Install-ChocolateyZipPackage $packageName $url $installDir

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  file          = $fileLocation
  silentArgs    = '/Action=Install /IACCEPTSQLSERVERLICENSETERMS /UpdateEnabled=0 /ERRORREPORTING=0 /Features=SSMS /Q /SQMREPORTING=0 /ADDCURRENTUSERASSQLADMIN $env:chocolateyInstallArguments'
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'SQL2012SP2_SSMS*'
}

Install-ChocolateyInstallPackage @packageArgs
