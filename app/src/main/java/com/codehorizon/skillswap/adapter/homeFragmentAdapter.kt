package com.codehorizon.skillswap.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.codehorizon.skillswap.R
import com.codehorizon.skillswap.model.userProfiles

class homeFragmentAdapter(private val context : Context, details : List<userProfiles>) :
 RecyclerView.Adapter<RecyclerView.ViewHolder>()
{
    private var profiles : List<userProfiles>

     init {
         this.profiles = details
     }
    private class ItemViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        var userName: TextView = itemView.findViewById<TextView>(R.id.textUserName)
        var userOfferSkill: TextView = itemView.findViewById<TextView>(R.id.textOfferSkills)
        var userWantedSkill: TextView = itemView.findViewById<TextView>(R.id.textWantSkills)
        var userRating: TextView = itemView.findViewById<TextView>(R.id.textRating)
        var userImage: ImageView = itemView.findViewById<ImageView>(R.id.userImage)
        var btnReq: Button = itemView.findViewById<Button>(R.id.btnRequest)
        init {
//            itemView.setOnClickListener {
//                if (listener != null) {
//                    val position = adapterPosition
//                    if (position != RecyclerView.NO_POSITION) {
//                        listener!!.onItemClick(itemView, position)
//                    }
//                }
//            }
        }
    }
//    fun setOnItemClickListener(listener: OnItemClickListener?) {
//        Companion.listener = listener
//    }
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        val inflater = LayoutInflater.from(context)
        val profileView : View = inflater.inflate(R.layout.home_fragment_recyclerview, parent, false)
        return ItemViewHolder(profileView)
    }

    override fun getItemCount(): Int {
        return profiles.size
    }

    override fun onBindViewHolder(viewHolder: RecyclerView.ViewHolder, position: Int) {
        val itemViewHolder = viewHolder as ItemViewHolder
        val order: userProfiles = profiles[position]
        // Bind item data
        val pos = position + 1
        //itemViewHolder.userImage.setImageResource(order.image)
        //itemViewHolder.userImage.isSelected = true
        itemViewHolder.userName.text = order.fullName
        itemViewHolder.userName.isSelected = true
        itemViewHolder.userOfferSkill.text = order.offeredSkills
        itemViewHolder.userOfferSkill.isSelected = true
        itemViewHolder.userWantedSkill.text = order.wantedSkills
        itemViewHolder.userWantedSkill.isSelected = true
        itemViewHolder.userRating.text = order.rating
        itemViewHolder.userRating.isSelected= true

        itemViewHolder.btnReq.setOnClickListener {

        }
    }
//    companion object {
//        var listener: OnItemClickListener? = null
//    }
}