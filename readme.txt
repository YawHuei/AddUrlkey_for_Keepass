KeePass is a free open source password manager, which helps you to manage your passwords in a secure way.
detail see https://keepass.info/

The batch file to create windows registry keys for portable Chrome, Firefox, Opera, 
 and other batch file.

open with Safari for urlrun.bat.
urlrun.bat
::--begin----------------
@echo off
powershell.exe -command "Get-Clipboard" > %temp%\urlfile.txt
for /f "tokens=*" %%I in ('findstr.exe /irv "^;" %temp%\urlfile.txt') do (
    start "" microsoft-edge:"%%~I"
)
exit /b 0
::---end--------------- 

keepass 
URL field -> :{CLIPBOARD-SET:/{NOTES}/} , [remind] the first char must be ":"

NOTE field
;--begin----------
http://www.google.com/
http://portableapps.com/
https://sourceforge.net/directory/os:windows/
;http://.../
https://github.com/microsoft
https://keepass.info/
;--end------------


Please refer to ".\Keepass\Util\AppLocator.cs"
https://sourceforge.net/projects/keepass/files/KeePass 2.x/2.49/KeePass-2.49-Source.zip/download
