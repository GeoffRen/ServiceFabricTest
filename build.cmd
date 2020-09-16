dotnet restore %~dp0\..\ServiceFabricTest\src\ServiceFabricTest\UnattendedService\UnattendedService.csproj -s https://api.nuget.org/v3/index.json
dotnet build %~dp0\..\ServiceFabricTest\src\ServiceFabricTest\UnattendedService\UnattendedService.csproj -v normal

for %%F in ("%~dp0\..\ServiceFabricTest\src\ServiceFabricTest\UnattendedService\UnattendedService.csproj") do cd %%~dpF
dotnet publish -o %~dp0\..\ServiceFabricTest\ServiceFabricTest\UnattendedServicePkg\Code
cd %~dp0\..
