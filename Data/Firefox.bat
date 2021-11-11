@echo off
set "ar="
if "%processor_architecture%" == "AMD64" set "ar=64"
set "firefoxp=F:\PortableApps\FirefoxPortable"
start "" /d "%firefoxp%\App\firefox%ar%" firefox.exe -profile "%firefoxp%\Data\profile" -silent -foreground -url %*