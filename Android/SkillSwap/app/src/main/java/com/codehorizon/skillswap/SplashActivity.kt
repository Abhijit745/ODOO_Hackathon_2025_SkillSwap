package com.codehorizon.skillswap

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.widget.VideoView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class SplashActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash)

        val videoView = findViewById<VideoView>(R.id.videoView)

        // Set the video URI from raw folder
        val uri = Uri.parse("android.resource://" + packageName + "/" + R.raw.splash_video)
        videoView.setVideoURI(uri)

        // Start playing the video
        videoView.start()

        // Navigate to MainActivity when video completes
        videoView.setOnCompletionListener {
            startActivity(Intent(this, StartUpActivity::class.java))
            finish()
        }

        // Optional: Handle errors
        videoView.setOnErrorListener { _, what, extra ->
            // Log error or fallback
            true // Return true if handled
        }
    }

    override fun onBackPressed() {
        // Prevent back press during splash
    }
}