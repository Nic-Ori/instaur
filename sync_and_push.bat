@echo off
setlocal

:: Settings
set PROJECT_NAME=project
set SRC=D:\04_Site\instaur\project
set DEST=D:\04_Site\instaur\output
set GIT_FOLDER=D:\04_Site\instaur

if not exist "%SRC%" (
    echo [ERROR] Source folder not found: %SRC%
    pause
    exit /b
)

echo Cleaning %DEST%...
rmdir /S /Q "%DEST%" >nul 2>&1
mkdir "%DEST%" >nul 2>&1

echo Copying files...
xcopy "%SRC%\*" "%DEST%\" /E /I /Y >nul

cd /d "%GIT_FOLDER%"
echo Committing and pushing to GitHub...

git add .
git commit -m "Auto-publish from WYSIWYG Web Builder"
git push origin main

echo Done.
pause
