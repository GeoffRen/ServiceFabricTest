dotnet restore %~dp0\..\ServiceFabricTest\src\ServiceFabricTest\UnattendedService\UnattendedService.csproj -s https://api.nuget.org/v3/index.json
dotnet build %~dp0\..\ServiceFabricTest\src\ServiceFabricTest\UnattendedService\UnattendedService.csproj -v normal

for %%F in ("%~dp0\..\ServiceFabricTest\src\ServiceFabricTest\UnattendedService\UnattendedService.csproj") do cd %%~dpF
dotnet publish -o %~dp0\..\ServiceFabricTest\ServiceFabricTest\UnattendedServicePkg\Code
cd %~dp0\..

          
dotnet restore %~dp0\..\ServiceFabricTest\src\ServiceFabricTest\Cache\Cache.csproj -s https://api.nuget.org/v3/index.json           
dotnet build %~dp0\..\ServiceFabricTest\src\ServiceFabricTest\Cache\Cache.csproj -v normal          
for %%F in ("ServiceFabricTest\src\ServiceFabricTest\Cache\Cache.csproj") do cd %%~dpF          
dotnet publish -o %~dp0\..\ServiceFabricTest\ServiceFabricTest\CachePkg\Code