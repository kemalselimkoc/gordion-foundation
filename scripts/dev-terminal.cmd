@echo off
rem Gordion - Created by @kemalselimkoc
setlocal
if not defined GORDION_TOOLS_ROOT set "GORDION_TOOLS_ROOT=%USERPROFILE%\Documents\Codex\tools"
set "GORDION_NODE_DIR=%GORDION_TOOLS_ROOT%\nodejs\node-v24.21.0-win-x64"
if not exist "%GORDION_NODE_DIR%\node.exe" (
  echo Node.js kurulumu bulunamadi: %GORDION_NODE_DIR%
  echo GORDION_TOOLS_ROOT degiskenini arac klasorune ayarlayin.
  pause
  exit /b 1
)
set "PATH=%GORDION_NODE_DIR%;%GORDION_TOOLS_ROOT%\dotnet;%GORDION_TOOLS_ROOT%\mingit\cmd;%GORDION_TOOLS_ROOT%\github-cli\bin;%PATH%"
set "GIT_EXEC_PATH=%GORDION_TOOLS_ROOT%\mingit\ucrt64\libexec\git-core"
set "GH_CONFIG_DIR=%GORDION_TOOLS_ROOT%\github-cli-config"
set "NPM_CONFIG_CACHE=%GORDION_TOOLS_ROOT%\npm-cache"
set "DOTNET_ROOT=%GORDION_TOOLS_ROOT%\dotnet"
set "DOTNET_ROOT_X64=%DOTNET_ROOT%"
set "DOTNET_CLI_HOME=%GORDION_TOOLS_ROOT%\dotnet-home"
set "NUGET_PACKAGES=%GORDION_TOOLS_ROOT%\nuget-packages"
set "DOTNET_CLI_TELEMETRY_OPTOUT=1"
set "DOTNET_NOLOGO=1"
set "DOTNET_ADD_GLOBAL_TOOLS_TO_PATH=false"
cd /d "%~dp0.."
echo Gordion development terminal
node --version
if errorlevel 1 exit /b 1
call npm.cmd --version
if errorlevel 1 exit /b 1
git --version
if errorlevel 1 exit /b 1
"%DOTNET_ROOT%\dotnet.exe" --version
if errorlevel 1 exit /b 1
gh --version
if errorlevel 1 exit /b 1
echo.
echo node, npm, npx, dotnet, git ve gh bu terminalde hazir.
if /i "%~1"=="--check" exit /b 0
cmd.exe /k
endlocal
