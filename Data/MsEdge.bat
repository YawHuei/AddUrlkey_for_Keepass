@start "" /d "%ProgramFiles(x86)%\Microsoft\Edge\Application\" msedge.exe --disk-cache-dir=%temp% --no-first-run ^
 --disable-translate --noerrdialogs --no-default-browser-check -inprivate "www.google.com" "%*"


