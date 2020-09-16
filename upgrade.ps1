Param(
  [Parameter(Mandatory=$true)]
  [string]$version
)

$AppPath = "$PSScriptRoot\ServiceFabricTest"
Copy-ServiceFabricApplicationPackage -ApplicationPackagePath $AppPath -ApplicationPackagePathInImageStore "ServiceFabricTest\$version" -ShowProgress
Register-ServiceFabricApplicationType -ApplicationPathInImageStore "ServiceFabricTest\$version"
Start-ServiceFabricApplicationUpgrade -ApplicationName fabric:/ServiceFabricTest -ApplicationTypeVersion $version -FailureAction Rollback -Monitored