package com.codehorizon.skillswap

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class StartUpActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_start_up)

        // Find the "Join Now" button
        val joinNowButton = findViewById<Button>(R.id.joinNowButton)

        // Set click listener for the button
        joinNowButton.setOnClickListener {
            // Navigate to HomeActivity
            startActivity(Intent(this, UserloginActivity::class.java))
            finish() // Close this activity
        }
    }
}