@echo off
cls

net file 1>nul 2>nul && goto :run || powershell.exe -ex unrestricted -Command "Start-Process -Verb RunAs -FilePath '%comspec%' -ArgumentList '/c ""%~fnx0""""'"
goto :eof
:run

for %%I in (
"HKCR\ChromeHTML"
"HKCR\Applications\chrome.exe"
"HKCU\Software\Clients\StartMenuInternet\OperaStable"
"HKLM\SOFTWARE\Mozilla\Mozilla Firefox"
"HKLM\SOFTWARE\Apple Computer, Inc.\Safari"
) do (reg.exe delete "%%~I" /f)
timeout.exe /t 5 /nobreak
