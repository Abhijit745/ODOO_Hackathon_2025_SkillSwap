package com.codehorizon.skillswap.fragments

import android.app.Dialog
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.Window
import android.view.WindowManager
import android.widget.EditText
import android.widget.ImageButton
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.codehorizon.skillswap.R
import com.codehorizon.skillswap.adapter.homeFragmentAdapter
import com.codehorizon.skillswap.model.userProfiles

class HomeFragment : Fragment(R.layout.frament_home) {
    private val userList : MutableList<userProfiles> = mutableListOf()
    private lateinit var userAdapter : homeFragmentAdapter
    private lateinit var searchDialog: Dialog

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val rvUsers: RecyclerView = view.findViewById(R.id.rvUsers)

        initializeData()

        userAdapter = homeFragmentAdapter(requireContext(), userList)
        rvUsers.adapter = userAdapter
        rvUsers.layoutManager = LinearLayoutManager(requireContext())
    }

    private fun initializeData() {
        // Add items to the list
        userList.addAll(
            listOf(
               userProfiles("Abhijit Kundu", "abhijit@gmail.com", "Goa", "", "Cooking, Coding","SkyDiving, Hockey", "","","4.2/5"),
               userProfiles("Saurav Yadav", "saurav@gmail.com", "Goa", "", "Cooking, Coding","SkyDiving, Hockey", "","","4.2/5"),
               userProfiles("Satabdi", "saurav@gmail.com", "Goa", "", "Cooking, Coding","SkyDiving, Hockey", "","","4.2/5"),
               userProfiles("Rohit", "saurav@gmail.com", "Goa", "", "Cooking, Coding","SkyDiving, Hockey", "","","4.2/5"),
            )
        )
    }
//    private fun showSearchField() {
//        val context = requireContext()
//        searchDialog = Dialog(context, android.R.style.Theme_Light_NoTitleBar_Fullscreen).apply {
//            requestWindowFeature(Window.FEATURE_NO_TITLE)
//            setCancelable(false)
//            setContentView(R.layout.custom_search_bar)
//
//            // Set dialog to full-screen
//            window?.apply {
//                setLayout(
//                    WindowManager.LayoutParams.MATCH_PARENT,
//                    WindowManager.LayoutParams.MATCH_PARENT
//                )
//                addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS)
//                addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
//            }
//
//            // Find dialog views
//            val dialogBack = findViewById<ImageButton>(R.id.backIconToolBar)
//            val dialogSearchBar = findViewById<EditText>(R.id.customSearchBar)
//            val recyclerSearchView = findViewById<androidx.recyclerview.widget.RecyclerView>(R.id.recyclerSearchView)
//
//            // Set up RecyclerView
//            recyclerSearchView.layoutManager = LinearLayoutManager(requireContext())
//            recyclerSearchView.adapter = searchableadapter
//
//            // Handle back button
//            dialogBack.setOnClickListener {
//                dismiss()
//            }
//
//            // Filter items as the user types
//            dialogSearchBar.addTextChangedListener(object : TextWatcher {
//                override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
//
//                override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
//                    searchableadapter.filter(s.toString())
//                }
//
//                override fun afterTextChanged(s: Editable?) {}
//            })
//        }
//
//        searchDialog.show()
//    }
}