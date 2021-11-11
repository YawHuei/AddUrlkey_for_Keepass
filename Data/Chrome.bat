@echo off
set "ar="
if "%processor_architecture%" == "AMD64" set "ar=64" 
set "chromep=F:\PortableApps\ChromePortable"
start "" /d "%chromep%\App\Chrome%ar%\" Chrome.exe --no-first-run --no-default-browser-check ^
--enable-npapi --no-events --disk-cache-dir="%tmp%" --user-data-dir="%chromep%\Data\Chrome" "%*"