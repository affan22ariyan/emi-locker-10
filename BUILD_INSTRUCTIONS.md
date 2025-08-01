# EMI Locker APK Build Instructions

## Prerequisites

Before building the APK, ensure you have the following installed:

1. **Java JDK 8 or higher**
2. **Android SDK** (Android Studio includes this)
3. **Gradle** (Android Studio includes this)

## Method 1: Using Android Studio (Recommended)

### Step 1: Open Project in Android Studio
1. Launch Android Studio
2. Select "Open an existing Android Studio project"
3. Navigate to the `my-locker` folder and select it
4. Wait for the project to sync and index

### Step 2: Build APK
1. Go to **Build** → **Build Bundle(s) / APK(s)** → **Build APK(s)**
2. Wait for the build process to complete
3. Click "locate" in the notification to find your APK

### Step 3: Find the APK
The APK will be located at:
```
app/build/outputs/apk/debug/app-debug.apk
```

## Method 2: Using Command Line

### Step 1: Set Environment Variables
Set the following environment variables:
```bash
# Windows (PowerShell)
$env:ANDROID_HOME = "C:\Users\YourUsername\AppData\Local\Android\Sdk"
$env:JAVA_HOME = "C:\Program Files\Java\jdk-11"

# Windows (Command Prompt)
set ANDROID_HOME=C:\Users\YourUsername\AppData\Local\Android\Sdk
set JAVA_HOME=C:\Program Files\Java\jdk-11
```

### Step 2: Build APK
```bash
# Using Gradle wrapper (if available)
./gradlew assembleRelease

# Using system Gradle
gradle assembleRelease

# Using Android SDK build tools
$ANDROID_HOME/build-tools/34.0.0/aapt2 compile --dir app/src/main/res -o compiled_resources.zip
```

## Method 3: Using the Build Script

1. Run the provided build script:
```bash
build-apk.bat
```

2. Follow the prompts and instructions

## APK Location

After successful build, the APK will be located at:
- **Debug APK**: `app/build/outputs/apk/debug/app-debug.apk`
- **Release APK**: `app/build/outputs/apk/release/app-release.apk`

## Installing the APK

### On Android Device:
1. Enable "Unknown Sources" in Settings → Security
2. Transfer the APK to your device
3. Open the APK file to install

### Using ADB:
```bash
adb install app/build/outputs/apk/debug/app-debug.apk
```

## Troubleshooting

### Common Issues:

1. **Gradle sync failed**
   - Check internet connection
   - Update Android Studio
   - Clear Gradle cache: File → Invalidate Caches

2. **Build failed**
   - Check that all dependencies are resolved
   - Ensure Android SDK is properly installed
   - Verify Java version compatibility

3. **Permission denied**
   - Run Android Studio as administrator
   - Check file permissions

4. **APK not found**
   - Check the build output for errors
   - Verify the build completed successfully
   - Look in the correct output directory

## APK Features

The generated APK includes:
- ✅ Modern Material3 UI with Jetpack Compose
- ✅ Foreground service with persistent notification
- ✅ System overlay lock screen
- ✅ Device admin integration
- ✅ Auto-restart on boot
- ✅ All necessary permissions

## Security Notes

⚠️ **Important**: This app requires several sensitive permissions:
- `SYSTEM_ALERT_WINDOW` - For overlay functionality
- `FOREGROUND_SERVICE` - For persistent service
- `RECEIVE_BOOT_COMPLETED` - For auto-restart
- Device admin permissions

Users will be prompted to grant these permissions when installing/running the app.

## File Size

Expected APK size: ~5-10 MB (depending on build configuration)

## Version Information

- **App Name**: EMI Locker
- **Package**: com.app.emilockerapp
- **Version**: 1.0
- **Target SDK**: 34 (Android 14)
- **Min SDK**: 24 (Android 7.0) 