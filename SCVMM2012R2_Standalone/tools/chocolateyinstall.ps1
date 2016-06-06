
$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'SCVMM2012R2_Standalone' # arbitrary name for the package, used in messages
$toolsDir   = 'c:\temp\SCVMM2012R2'
$url        = 'http://dsc01/NuGet/Packages/SQL2012SP2.zip'
$installDir = 'c:\temp\SCVMM2012R2'
$fileLocation = Join-Path $toolsDir 'setup.exe'

Install-ChocolateyZipPackage $packageName $url $installDir

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  file          = $fileLocation
  silentArgs    = '/Q /ACTION=Install /IACCEPTSQLSERVERLICENSETERMS /ENU /UpdateEnabled=false /IndicateProgress /FEATURES=SQLEngine /INSTANCENAME=MSSQLSERVER /SQLSYSADMINACCOUNTS="GOTHAM\Administrator" /AGTSVCACCOUNT="NT AUTHORITY\Network Service" /AGTSVCSTARTUPTYPE=Manual /SQLSVCACCOUNT="NT AUTHORITY\Network Service" $env:chocolateyInstallArguments'
  validExitCodes= @(0, 3010, 1641) 
  softwareName  = 'SCVMM 2012 R2*'
}

Install-ChocolateyPackage @packageArgs
