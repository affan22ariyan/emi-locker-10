# EMI Locker Android App

A comprehensive Android application that provides device locking and protection capabilities using modern Android development practices.

## Features

- **MainActivity.kt**: Entry point with Jetpack Compose UI
- **LockService.kt**: Foreground service with heartbeat mechanism
- **LockScreen.kt**: Unbreakable overlay screen
- **AdminReceiver.kt**: Device admin policies implementation
- **BootReceiver.kt**: Auto-restart functionality

## Project Structure

```
app/
├── src/main/java/com/app/emilockerapp/
│   ├── MainActivity.kt            ← Entry point
│   ├── LockService.kt             ← Foreground + heartbeat
│   ├── LockScreen.kt              ← Unbreakable overlay
│   ├── AdminReceiver.kt           ← Policies
│   └── BootReceiver.kt            ← Auto-restart
│
├── src/main/res/
│   ├── drawable/
│   │   └── ic_launcher_foreground.xml  (24×24 icon)
│   ├── values/
│   │   ├── strings.xml
│   │   └── themes.xml
│   └── xml/
│       └── device_admin.xml
│
├── src/main/AndroidManifest.xml     ← Permissions + receivers
└── build.gradle.kts                 ← Compose dependencies
```

## Key Components

### MainActivity.kt
- Jetpack Compose UI implementation
- Service start/stop controls
- Modern Material3 design

### LockService.kt
- Foreground service with persistent notification
- Heartbeat mechanism to keep service alive
- START_STICKY behavior for auto-restart

### LockScreen.kt
- System overlay implementation
- Unbreakable lock screen using WindowManager
- Jetpack Compose UI for lock screen

### AdminReceiver.kt
- Device admin policy management
- Password and security event handling
- Admin state monitoring

### BootReceiver.kt
- Automatic service restart on boot
- Package replacement handling
- Background service management

## Permissions

The app requires the following permissions:
- `SYSTEM_ALERT_WINDOW`: For overlay functionality
- `FOREGROUND_SERVICE`: For persistent service
- `RECEIVE_BOOT_COMPLETED`: For auto-restart
- `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`: For service persistence
- `WAKE_LOCK`: For keeping device awake
- `DISABLE_KEYGUARD`: For lock screen control
- `QUERY_ALL_PACKAGES`: For app monitoring

## Build Configuration

- **Target SDK**: 34 (Android 14)
- **Minimum SDK**: 24 (Android 7.0)
- **Kotlin**: 1.9.0
- **Jetpack Compose**: 2023.08.00
- **Material3**: Latest version

## Development

1. Open the project in Android Studio
2. Sync Gradle files
3. Build and run on a device with Android 7.0+
4. Grant necessary permissions when prompted

## Security Features

- Device admin integration
- Persistent foreground service
- System overlay protection
- Auto-restart capabilities
- Battery optimization bypass

## License

This project is for educational and development purposes.
