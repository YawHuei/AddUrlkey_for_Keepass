@echo off

net file 1>nul 2>nul && goto :run || powershell.exe -ex unrestricted -Command "Start-Process -Verb RunAs -FilePath '%comspec%' -ArgumentList '/c ""%~fnx0""""'"
goto :eof
:run

set "ar="
if "%processor_architecture%" == "AMD64" set "ar=64" 

cd /d %~dp0

rem https://sourceforge.net/projects/keepass/files/KeePass 2.x/
rem See .\Keepass\Util\AppLocator.cs
rem if defined ar echo. defined %ar% || echo. not defined %ar%

if not exist "%~dp0Data\IExplore.bat" goto :next0
rem == IExplore = Begin
reg.exe add "HKLM\SOFTWARE\Clients\StartMenuInternet\IEXPLORE.EXE\shell\open\command" /ve /t REG_SZ /d "\"%~dp0Data\IExplore.bat\" -- \"%%1\"" /f >nul 2>&1
if defined  ProgramFiles(x86) reg.exe add "HKLM\SOFTWARE\Wow6432Node\Clients\StartMenuInternet\IEXPLORE.EXE\shell\open\command" /ve /t REG_SZ /d "\"%~dp0Data\IExplore.bat\" -- \"%%1\"" /f >nul 2>&1
rem == IExplore = End

:next0
if not exist "%~dp0Data\Chrome.bat" goto :next1
rem == Chrome = Begin
reg.exe add "HKCR\ChromeHTML\shell\open\command" /f >nul 2>&1
reg.exe add "HKCR\ChromeHTML\shell\open\command" /ve /t REG_SZ /d "\"%~dp0Data\Chrome.bat\" -- \"%%1\"" /f >nul 2>&1
rem == Chrome = End

:next1
if not exist "%~dp0Data\Chromium.bat" goto :next2
rem == Chromium = Begin
reg.exe add "HKCR\Applications\chrome.exe\shell\open\command" /ve /t REG_SZ /d "\"%~dp0Data\Chromium.bat\" -- \"%%1\"" /f >nul 2>&1
rem == Chromium = End

:next2
if not exist "%~dp0Data\Opera.bat" goto :next3
rem == Opera = Begin
reg.exe add "HKCU\Software\Clients\StartMenuInternet\OperaStable\shell\open\command" /f >nul 2>&1
reg.exe add "HKCU\Software\Clients\StartMenuInternet\OperaStable\shell\open\command" /ve /t REG_SZ /d "\"%~dp0Data\Opera.bat\" -- \"%%1\"" /f >nul 2>&1
rem == Opera = End

:next3
if not exist "%~dp0Data\Firefox.bat" goto :next4
rem == Firefox = Begin
reg.exe add "HKLM\SOFTWARE\Mozilla\Mozilla Firefox" /f >nul 2>&1
reg.exe add "HKLM\SOFTWARE\Mozilla\Mozilla Firefox" /v "CurrentVersion" /t REG_SZ /d "ESR" /f >nul 2>&1
reg.exe add "HKLM\SOFTWARE\Mozilla\Mozilla Firefox\ESR\Main" /f >nul 2>&1
reg.exe add "HKLM\SOFTWARE\Mozilla\Mozilla Firefox\ESR\Main" /v "PathToExe" /t REG_SZ /d "%~dp0Data\Firefox.bat" /f >nul 2>&1
rem == Firefox = End

:next4
if not exist "%~dp0Data\urlrun.bat" goto :next5
rem == Safari = Begin
reg.exe add "HKLM\SOFTWARE\Apple Computer, Inc.\Safari" /f >nul 2>&1
reg.exe add "HKLM\SOFTWARE\Apple Computer, Inc.\Safari" /v "BrowserExe" /t REG_SZ /d "\"%~dp0Data\urlrun.bat\" -- \"%%1\"" /f >nul 2>&1
rem == Safari = End

:next5
exit /b 0