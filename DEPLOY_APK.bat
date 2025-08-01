@echo off
echo ========================================
echo    EMI LOCKER APK DEPLOYMENT SCRIPT
echo ========================================
echo.

echo Checking system requirements...
echo.

REM Check for Java
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Java is not installed or not in PATH
    echo.
    echo Please install Java JDK 8 or higher:
    echo Download from: https://adoptium.net/
    echo.
    echo After installation, restart this script.
    pause
    exit /b 1
) else (
    echo ✅ Java found
    java -version
)

echo.

REM Check for Android SDK
if "%ANDROID_HOME%" == "" (
    echo ❌ ANDROID_HOME environment variable is not set
    echo.
    echo Please install Android Studio or set ANDROID_HOME:
    echo 1. Download Android Studio: https://developer.android.com/studio
    echo 2. Install Android Studio
    echo 3. Set ANDROID_HOME environment variable
    echo.
    echo Alternative: Use the manual build instructions below
    goto :manual_build
) else (
    echo ✅ Android SDK found at: %ANDROID_HOME%
)

echo.
echo Attempting to build APK...
echo.

REM Try to build using Gradle wrapper
if exist "gradlew.bat" (
    echo Using Gradle wrapper...
    call gradlew.bat assembleRelease
    if %errorlevel% equ 0 (
        echo.
        echo ✅ BUILD SUCCESSFUL!
        echo.
        echo APK Location: app\build\outputs\apk\release\app-release.apk
        echo.
        goto :success
    ) else (
        echo ❌ Build failed with exit code: %errorlevel%
        goto :manual_build
    )
) else (
    echo Gradle wrapper not found.
    goto :manual_build
)

:manual_build
echo.
echo ========================================
echo    MANUAL BUILD INSTRUCTIONS
echo ========================================
echo.
echo Since automatic build failed, please follow these steps:
echo.
echo 1. INSTALL ANDROID STUDIO:
echo    Download from: https://developer.android.com/studio
echo.
echo 2. OPEN PROJECT IN ANDROID STUDIO:
echo    - Launch Android Studio
echo    - Select "Open an existing Android Studio project"
echo    - Navigate to this folder: %CD%
echo    - Click "OK"
echo.
echo 3. WAIT FOR SYNC:
echo    - Let Android Studio sync the project
echo    - Wait for Gradle sync to complete
echo.
echo 4. BUILD APK:
echo    - Go to Build menu
echo    - Select "Build Bundle(s) / APK(s)"
echo    - Select "Build APK(s)"
echo    - Wait for build to complete
echo.
echo 5. FIND YOUR APK:
echo    - Click "locate" in the notification
echo    - Or navigate to: app\build\outputs\apk\debug\app-debug.apk
echo.
echo 6. INSTALL ON DEVICE:
echo    - Enable "Unknown Sources" in Android Settings
echo    - Transfer APK to your device
echo    - Open APK file to install
echo    - Grant all requested permissions
echo.
goto :end

:success
echo ========================================
echo    INSTALLATION INSTRUCTIONS
echo ========================================
echo.
echo To install the APK on your Android device:
echo.
echo 1. Enable "Unknown Sources":
echo    - Go to Settings → Security
echo    - Enable "Unknown Sources"
echo.
echo 2. Transfer APK to device:
echo    - Copy the APK file to your Android device
echo    - Use USB, email, or cloud storage
echo.
echo 3. Install APK:
echo    - Open the APK file on your device
echo    - Follow installation prompts
echo    - Grant all requested permissions
echo.
echo 4. Enable Device Admin:
echo    - Open the EMI Locker app
echo    - Follow prompts to enable device admin
echo    - Grant overlay permissions when prompted
echo.
echo ========================================
echo    APP FEATURES
echo ========================================
echo.
echo ✅ Modern Material3 UI with Jetpack Compose
echo ✅ Persistent foreground service with heartbeat
echo ✅ Unbreakable system overlay lock screen
echo ✅ Device admin integration for security
echo ✅ Auto-restart functionality on boot
echo ✅ Comprehensive permission handling
echo.
echo ========================================
echo    SECURITY NOTES
echo ========================================
echo.
echo ⚠️  This app requires extensive permissions:
echo    - SYSTEM_ALERT_WINDOW (overlay)
echo    - FOREGROUND_SERVICE (persistent)
echo    - Device admin access
echo    - Boot completion receiver
echo.
echo Users will be prompted to grant these permissions.
echo.

:end
echo.
echo Press any key to exit...
pause >nul 