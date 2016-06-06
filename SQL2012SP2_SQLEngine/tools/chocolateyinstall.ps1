#https://msdn.microsoft.com/en-us/library/ms144259(v=sql.110).aspx
$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'SQL2012SP2_SQLEngine' # arbitrary name for the package, used in messages
$toolsDir   = 'c:\temp\SQL2012SP2'
$url        = 'http://dsc01/NuGet/Packages/SQL2012SP2.zip'
$installDir = 'c:\temp\SQL2012SP2'
$fileLocation = Join-Path $toolsDir 'setup.exe'

Install-ChocolateyZipPackage $packageName $url $installDir

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  file          = $fileLocation
  silentArgs    = '/Q /ACTION=Install /IACCEPTSQLSERVERLICENSETERMS /ENU /UpdateEnabled=false /IndicateProgress /FEATURES=SQLEngine /INSTANCENAME=MSSQLSERVER /SQLSYSADMINACCOUNTS="GOTHAM\Administrator" /AGTSVCACCOUNT="NT AUTHORITY\Network Service" /AGTSVCSTARTUPTYPE=Manual /SQLSVCACCOUNT="NT AUTHORITY\Network Service" $env:chocolateyInstallArguments'
  validExitCodes= @(0, 3010, 1641) 
  softwareName  = 'SQL 2012 SP2 Engine*'   
}

Install-ChocolateyInstallPackage @packageArgs
