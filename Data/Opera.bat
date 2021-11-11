@echo off
set "operap=F:\PortableApps\OperaPortable"
start "" /d "%operap%\App\" launcher.exe --user-data-dir="%operap%\Data\Profile" --disk-cache-dir="%tmp%\Opera-Cache" --remote "%*"