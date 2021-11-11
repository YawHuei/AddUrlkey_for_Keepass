@echo off

rem run the current batch file as administrator
net file 1>nul 2>nul && goto :next || powershell -ex unrestricted -Command "Start-Process -Verb RunAs -FilePath '%comspec%' -ArgumentList '/c ""%~fnx0""""'"
goto :eof
:next

set "ar="
if "%processor_architecture%" == "AMD64" set "ar=64" 

cd /d %~dp0

rem == Chrome = Begin
reg.exe add "HKCR\ChromeHTML\shell\open\command" /f >nul 2>&1
reg.exe add "HKCR\ChromeHTML\shell\open\command" /ve /t REG_SZ /d "\"%~dp0Data\Chrome.bat\" -- \"%%1\"" /f >nul 2>&1
rem == Chrome = End

rem == Opera = Begin
reg.exe add "HKCU\Software\Clients\StartMenuInternet\OperaStable\shell\open\command" /f >nul 2>&1
reg.exe add "HKCU\Software\Clients\StartMenuInternet\OperaStable\shell\open\command" /ve /t REG_SZ /d "\"%~dp0Data\Opera.bat\" -- \"%%1\"" /f >nul 2>&1
rem == Opera = End

rem == Firefox = Begin
reg.exe add "HKLM\SOFTWARE\Mozilla\Mozilla Firefox" /f >nul 2>&1
reg.exe add "HKLM\SOFTWARE\Mozilla\Mozilla Firefox" /v "CurrentVersion" /t REG_SZ /d "ESR" /f >nul 2>&1
reg.exe add "HKLM\SOFTWARE\Mozilla\Mozilla Firefox\ESR\Main" /f >nul 2>&1
reg.exe add "HKLM\SOFTWARE\Mozilla\Mozilla Firefox\ESR\Main" /v "PathToExe" /t REG_SZ /d "%~dp0Data\Firefox.bat" /f >nul 2>&1
rem == Firefox = End

rem == Safari: instead of inprivate MsEdge = Begin
reg.exe add "HKLM\SOFTWARE\Apple Computer, Inc.\Safari" /f >nul 2>&1
reg.exe add "HKLM\SOFTWARE\Apple Computer, Inc.\Safari" /v "BrowserExe" /t REG_SZ /d "\"%~dp0Data\urlrun.bat\" -- \"%%1\"" /f >nul 2>&1
rem == Safari = End

exit /b 0