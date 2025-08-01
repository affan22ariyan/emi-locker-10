package com.app.emilockerapp

import android.app.admin.DeviceAdminReceiver
import android.content.Context
import android.content.Intent
import android.os.UserManager
import android.app.admin.DevicePolicyManager

class AdminReceiver : DeviceAdminReceiver() {
    override fun onEnabled(context: Context, intent: Intent) {
        val dpm = context.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
        val admin = getWho(context)
        listOf(
            UserManager.DISALLOW_USB_FILE_TRANSFER,
            UserManager.DISALLOW_FACTORY_RESET,
            UserManager.DISALLOW_SAFE_BOOT
        ).forEach { dpm.addUserRestriction(admin, it) }
    }
}