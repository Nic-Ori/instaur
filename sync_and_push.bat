@echo off
setlocal

:: Define paths
set SRC=D:\04_Site\instaur\output_temp
set DEST=D:\04_Site\instaur
set GIT_FOLDER=D:\04_Site\instaur

:: Check if source exists
if not exist "%SRC%\index.html" (
    echo [ERROR] Source folder not found or is empty: %SRC%
    pause
    exit /b
)

:: Clean up old site files in root
echo Cleaning old site files in %DEST%...
del /Q "%DEST%\index.html" >nul 2>&1
del /Q "%DEST%\*.css" >nul 2>&1
del /Q "%DEST%\*.js" >nul 2>&1

:: Copy new files to the root
echo Copying new site files from %SRC% to %DEST%...
xcopy "%SRC%\*" "%DEST%\" /E /I /Y >nul

:: Commit and push to GitHub
cd /d "%GIT_FOLDER%"
echo Committing and pushing changes to GitHub...
git add .
git commit -m "📦 Auto-publish to GitHub Pages"
git push origin main

echo ✅ Website published successfully!
pause
