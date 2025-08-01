# EMI Locker APK Build Script
# PowerShell version

Write-Host "🔒 EMI Locker APK Builder" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green

# Check if Java is installed
Write-Host "Checking Java installation..." -ForegroundColor Yellow
try {
    $javaVersion = java -version 2>&1 | Select-String "version"
    if ($javaVersion) {
        Write-Host "✅ Java found: $javaVersion" -ForegroundColor Green
    } else {
        Write-Host "❌ Java not found. Please install Java JDK 8 or higher." -ForegroundColor Red
        Write-Host "Download from: https://adoptium.net/" -ForegroundColor Cyan
        Read-Host "Press Enter to continue"
        exit 1
    }
} catch {
    Write-Host "❌ Java not found. Please install Java JDK 8 or higher." -ForegroundColor Red
    Read-Host "Press Enter to continue"
    exit 1
}

# Check if Android SDK is available
Write-Host "Checking Android SDK..." -ForegroundColor Yellow
$androidHome = $env:ANDROID_HOME
if (-not $androidHome) {
    Write-Host "❌ ANDROID_HOME not set." -ForegroundColor Red
    Write-Host "Please set ANDROID_HOME environment variable to your Android SDK location." -ForegroundColor Yellow
    Write-Host "Example: `$env:ANDROID_HOME = 'C:\Users\YourName\AppData\Local\Android\Sdk'" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Alternative: Use Android Studio to build the APK:" -ForegroundColor Yellow
    Write-Host "1. Open Android Studio" -ForegroundColor White
    Write-Host "2. Open this project folder" -ForegroundColor White
    Write-Host "3. Go to Build → Build Bundle(s) / APK(s) → Build APK(s)" -ForegroundColor White
    Write-Host "4. The APK will be in: app\build\outputs\apk\debug\" -ForegroundColor White
    Read-Host "Press Enter to continue"
    exit 1
} else {
    Write-Host "✅ Android SDK found at: $androidHome" -ForegroundColor Green
}

# Try to build using available tools
Write-Host "Attempting to build APK..." -ForegroundColor Yellow

# Check if Gradle wrapper exists
if (Test-Path "gradlew.bat") {
    Write-Host "Using Gradle wrapper..." -ForegroundColor Green
    try {
        & .\gradlew.bat assembleRelease
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ Build successful!" -ForegroundColor Green
            Write-Host "APK location: app\build\outputs\apk\release\app-release.apk" -ForegroundColor Cyan
        } else {
            Write-Host "❌ Build failed with exit code: $LASTEXITCODE" -ForegroundColor Red
        }
    } catch {
        Write-Host "❌ Gradle wrapper failed: $_" -ForegroundColor Red
    }
} else {
    Write-Host "Gradle wrapper not found. Checking for system Gradle..." -ForegroundColor Yellow
    try {
        gradle assembleRelease
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ Build successful!" -ForegroundColor Green
            Write-Host "APK location: app\build\outputs\apk\release\app-release.apk" -ForegroundColor Cyan
        } else {
            Write-Host "❌ Build failed with exit code: $LASTEXITCODE" -ForegroundColor Red
        }
    } catch {
        Write-Host "❌ System Gradle not found or failed." -ForegroundColor Red
        Write-Host ""
        Write-Host "📋 Manual Build Instructions:" -ForegroundColor Yellow
        Write-Host "1. Install Android Studio from: https://developer.android.com/studio" -ForegroundColor White
        Write-Host "2. Open this project in Android Studio" -ForegroundColor White
        Write-Host "3. Wait for project sync to complete" -ForegroundColor White
        Write-Host "4. Go to Build → Build Bundle(s) / APK(s) → Build APK(s)" -ForegroundColor White
        Write-Host "5. Find your APK in: app\build\outputs\apk\debug\app-debug.apk" -ForegroundColor White
    }
}

Write-Host ""
Write-Host "📱 APK Installation Instructions:" -ForegroundColor Yellow
Write-Host "1. Enable 'Unknown Sources' in Android Settings → Security" -ForegroundColor White
Write-Host "2. Transfer the APK to your Android device" -ForegroundColor White
Write-Host "3. Open the APK file to install" -ForegroundColor White
Write-Host "4. Grant all requested permissions when prompted" -ForegroundColor White

Write-Host ""
Write-Host "🔒 App Features:" -ForegroundColor Yellow
Write-Host "• Modern Material3 UI with Jetpack Compose" -ForegroundColor White
Write-Host "• Persistent foreground service" -ForegroundColor White
Write-Host "• System overlay lock screen" -ForegroundColor White
Write-Host "• Device admin integration" -ForegroundColor White
Write-Host "• Auto-restart on boot" -ForegroundColor White

Read-Host "Press Enter to exit" 