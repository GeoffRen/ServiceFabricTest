function Uninstall() {
    Write-Host "Uninstalling App as installation failed... Please try installation again."
    Invoke-Expression "& $PSScriptRoot\uninstall.ps1"
    Exit
}

$AppPath = "$PSScriptRoot\ServiceFabricTest"
Copy-ServiceFabricApplicationPackage -ApplicationPackagePath $AppPath -ApplicationPackagePathInImageStore ServiceFabricTest -ShowProgress
if (!$?) {
    Uninstall
}

Register-ServiceFabricApplicationType ServiceFabricTest
if (!$?) {
    Uninstall
}

New-ServiceFabricApplication fabric:/ServiceFabricTest ServiceFabricTestType 1.0.0
if (!$?) {
    Uninstall
}