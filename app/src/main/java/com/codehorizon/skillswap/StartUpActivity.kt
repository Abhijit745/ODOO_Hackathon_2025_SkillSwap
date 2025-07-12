package com.codehorizon.skillswap

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class StartUpActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_start_up)

        // Find the "Join Now" button
        val joinNowButton = findViewById<Button>(R.id.joinNowButton)

        // Set click listener for the button
        joinNowButton.setOnClickListener {
            // Navigate to HomeActivity
            startActivity(Intent(this, DashboardActivity::class.java))
            finish() // Close this activity
        }
    }
}