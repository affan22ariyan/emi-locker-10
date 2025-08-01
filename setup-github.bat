@echo off
echo ========================================
echo    EMI LOCKER GITHUB SETUP SCRIPT
echo ========================================
echo.

echo Checking Git installation...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git is not installed.
    echo.
    echo Please install Git from: https://git-scm.com/
    echo After installation, restart this script.
    pause
    exit /b 1
) else (
    echo ✅ Git found
    git --version
)

echo.
echo ========================================
echo    GITHUB REPOSITORY SETUP
echo ========================================
echo.

echo Before running this script, please:
echo 1. Create a GitHub account at https://github.com/
echo 2. Create a new repository named 'emi-locker-app'
echo 3. Make it PUBLIC (required for free GitHub Actions)
echo 4. Don't initialize with README
echo.

set /p github_username="Enter your GitHub username: "
set /p repo_name="Enter repository name (default: emi-locker-app): "

if "%repo_name%"=="" set repo_name=emi-locker-app

echo.
echo ========================================
echo    INITIALIZING GIT REPOSITORY
echo ========================================
echo.

echo Initializing Git repository...
git init

echo Adding all files to Git...
git add .

echo Creating initial commit...
git commit -m "Initial commit: EMI Locker Android App"

echo Adding GitHub remote origin...
git remote add origin https://github.com/%github_username%/%repo_name%.git

echo Setting main branch...
git branch -M main

echo.
echo ========================================
echo    READY TO PUSH TO GITHUB
echo ========================================
echo.

echo Repository setup complete!
echo.
echo Next steps:
echo 1. Verify your GitHub repository exists: https://github.com/%github_username%/%repo_name%
echo 2. Run: git push -u origin main
echo 3. Check GitHub Actions tab for build progress
echo 4. Download APK from Actions artifacts
echo.

set /p push_now="Do you want to push to GitHub now? (y/n): "

if /i "%push_now%"=="y" (
    echo.
    echo Pushing to GitHub...
    git push -u origin main
    
    if %errorlevel% equ 0 (
        echo.
        echo ✅ Successfully pushed to GitHub!
        echo.
        echo 🎉 Your repository is now live at:
        echo https://github.com/%github_username%/%repo_name%
        echo.
        echo 📱 GitHub Actions will automatically build your APK.
        echo Check the Actions tab to monitor the build progress.
        echo.
        echo 📥 Once build completes, download APK from:
        echo Actions → Workflow run → Artifacts
    ) else (
        echo.
        echo ❌ Push failed. Please check:
        echo - GitHub repository exists
        echo - Repository is public
        echo - GitHub credentials are correct
    )
) else (
    echo.
    echo To push later, run: git push -u origin main
)

echo.
echo ========================================
echo    GITHUB ACTIONS WORKFLOW
echo ========================================
echo.

echo Your project includes a GitHub Actions workflow that will:
echo ✅ Automatically build APK on every push
echo ✅ Set up Java 11 and Android SDK
echo ✅ Generate both debug and release APKs
echo ✅ Upload APKs as downloadable artifacts
echo.

echo ========================================
echo    APK DOWNLOAD INSTRUCTIONS
echo ========================================
echo.

echo Once GitHub Actions completes:
echo 1. Go to your repository on GitHub
echo 2. Click "Actions" tab
echo 3. Click on the latest workflow run
echo 4. Scroll down to "Artifacts"
echo 5. Download "emi-locker-apk" (release) or "emi-locker-debug-apk" (debug)
echo.

echo ========================================
echo    INSTALLATION GUIDE
echo ========================================
echo.

echo After downloading the APK:
echo 1. Enable "Unknown Sources" in Android Settings
echo 2. Transfer APK to your Android device
echo 3. Install APK and grant all permissions
echo 4. Enable Device Admin when prompted
echo.

pause 