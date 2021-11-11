@echo off
powershell.exe -command "Get-Clipboard" > %temp%\urlfile.txt
for /f "tokens=*" %%I in ('findstr.exe /irv "^;" %temp%\urlfile.txt') do (
    start "" microsoft-edge:"%%~I"
)
exit /b 0