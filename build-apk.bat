@echo off
echo Building EMI Locker APK...

REM Check if ANDROID_HOME is set
if "%ANDROID_HOME%" == "" (
    echo ERROR: ANDROID_HOME environment variable is not set.
    echo Please set ANDROID_HOME to your Android SDK location.
    echo Example: set ANDROID_HOME=C:\Users\YourName\AppData\Local\Android\Sdk
    pause
    exit /b 1
)

REM Check if Java is available
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Java is not installed or not in PATH.
    echo Please install Java JDK 8 or higher.
    pause
    exit /b 1
)

echo Using Android SDK at: %ANDROID_HOME%
echo Building APK...

REM Try to build using Gradle wrapper if available
if exist "gradlew.bat" (
    echo Using Gradle wrapper...
    call gradlew.bat assembleRelease
) else (
    echo Gradle wrapper not found. Please install Gradle or Android Studio.
    echo You can also build the APK using Android Studio:
    echo 1. Open the project in Android Studio
    echo 2. Go to Build -^> Build Bundle(s) / APK(s) -^> Build APK(s)
    echo 3. The APK will be generated in app/build/outputs/apk/release/
)

echo.
echo Build process completed.
echo If successful, the APK should be in: app\build\outputs\apk\release\
pause 