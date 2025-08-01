package com.app.emilockerapp

import android.app.*
import android.content.Context
import android.content.Intent
import android.os.IBinder
import androidx.compose.ui.platform.ComposeView
import androidx.compose.material3.Text
import androidx.compose.ui.graphics.Color
import kotlinx.coroutines.*

class LockService : Service() {
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        startForeground(1, NotificationCompat.Builder(this, "lock")
            .setSmallIcon(R.drawable.ic_launcher_foreground)
            .setPriority(NotificationCompat.PRIORITY_MIN).build())

        val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
        if (dpm.isDeviceOwnerApp(packageName)) startLockTask()
        CoroutineScope(Dispatchers.IO).launch {
            while (true) {
                delay(180_000) // 3 min demo
            }
        }
        return START_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? = null
}