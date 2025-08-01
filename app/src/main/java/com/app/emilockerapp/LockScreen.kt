package com.app.emilockerapp

import android.content.Context
import android.graphics.PixelFormat
import android.os.Build
import android.view.*
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.ComposeView
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import android.util.Log

class LockScreen(private val context: Context) {
    private var windowManager: WindowManager? = null
    private var overlayView: View? = null
    private var isShowing = false
    private val TAG = "LockScreen"

    fun show() {
        if (isShowing) {
            Log.d(TAG, "Lock screen is already showing")
            return
        }
        
        try {
            windowManager = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
            
            val composeView = ComposeView(context).apply {
                setContent {
                    LockScreenContent()
                }
            }
            
            val params = WindowManager.LayoutParams().apply {
                width = WindowManager.LayoutParams.MATCH_PARENT
                height = WindowManager.LayoutParams.MATCH_PARENT
                type = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                } else {
                    WindowManager.LayoutParams.TYPE_PHONE
                }
                flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                        WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
                        WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or
                        WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS or
                        WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED or
                        WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
                format = PixelFormat.TRANSLUCENT
                systemUiVisibility = View.SYSTEM_UI_FLAG_LAYOUT_STABLE or
                                   View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION or
                                   View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or
                                   View.SYSTEM_UI_FLAG_HIDE_NAVIGATION or
                                   View.SYSTEM_UI_FLAG_FULLSCREEN or
                                   View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
            }
            
            windowManager?.addView(composeView, params)
            overlayView = composeView
            isShowing = true
            Log.d(TAG, "Lock screen shown successfully")
            
        } catch (e: Exception) {
            Log.e(TAG, "Failed to show lock screen", e)
            isShowing = false
        }
    }

    fun hide() {
        if (!isShowing) {
            Log.d(TAG, "Lock screen is not showing")
            return
        }
        
        try {
            overlayView?.let { view ->
                windowManager?.removeView(view)
                Log.d(TAG, "Lock screen hidden successfully")
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to hide lock screen", e)
        } finally {
            overlayView = null
            isShowing = false
        }
    }

    fun isVisible(): Boolean = isShowing

    fun toggle() {
        if (isShowing) {
            hide()
        } else {
            show()
        }
    }
}

@Composable
fun LockScreenContent() {
    var showDetails by remember { mutableStateOf(false) }
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                Color.Black.copy(alpha = 0.95f)
            ),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            // Main lock icon and title
            Text(
                text = "🔒",
                fontSize = 72.sp,
                color = Color.White
            )
            
            Spacer(modifier = Modifier.height(24.dp))
            
            Text(
                text = "DEVICE LOCKED",
                color = Color.White,
                fontSize = 28.sp,
                fontWeight = FontWeight.Bold,
                style = MaterialTheme.typography.headlineMedium
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            Text(
                text = "EMI Locker is protecting your device",
                color = Color.White.copy(alpha = 0.8f),
                fontSize = 16.sp,
                textAlign = androidx.compose.ui.text.style.TextAlign.Center
            )
            
            Spacer(modifier = Modifier.height(32.dp))
            
            // Animated progress indicator
            CircularProgressIndicator(
                color = Color.White,
                modifier = Modifier.size(48.dp),
                strokeWidth = 4.dp
            )
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Details section
            if (showDetails) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 32.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = Color.White.copy(alpha = 0.1f)
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Security Status",
                            color = Color.White,
                            fontSize = 18.sp,
                            fontWeight = FontWeight.Bold
                        )
                        
                        Spacer(modifier = Modifier.height(8.dp))
                        
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text(
                                text = "Service Active:",
                                color = Color.White.copy(alpha = 0.8f)
                            )
                            Text(
                                text = "✅",
                                color = Color.Green
                            )
                        }
                        
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text(
                                text = "Device Admin:",
                                color = Color.White.copy(alpha = 0.8f)
                            )
                            Text(
                                text = "✅",
                                color = Color.Green
                            )
                        }
                        
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text(
                                text = "Overlay Active:",
                                color = Color.White.copy(alpha = 0.8f)
                            )
                            Text(
                                text = "✅",
                                color = Color.Green
                            )
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Toggle details button
            TextButton(
                onClick = { showDetails = !showDetails },
                colors = ButtonDefaults.textButtonColors(
                    contentColor = Color.White.copy(alpha = 0.7f)
                )
            ) {
                Text(
                    text = if (showDetails) "Hide Details" else "Show Details",
                    fontSize = 14.sp
                )
            }
        }
        
        // Bottom status text
        Box(
            modifier = Modifier
                .align(Alignment.BottomCenter)
                .padding(bottom = 32.dp)
        ) {
            Text(
                text = "Tap to toggle details",
                color = Color.White.copy(alpha = 0.5f),
                fontSize = 12.sp
            )
        }
    }
}

// Extension function for better error handling
fun LockScreen.safeShow() {
    try {
        show()
    } catch (e: Exception) {
        Log.e("LockScreen", "Safe show failed", e)
    }
}

fun LockScreen.safeHide() {
    try {
        hide()
    } catch (e: Exception) {
        Log.e("LockScreen", "Safe hide failed", e)
    }
}