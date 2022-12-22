package com.example.Tedros;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

public class adminMyAdapter extends RecyclerView.Adapter<adminMyHolder> implements Filterable {

    Context c;
    ArrayList<adminModel> models;
    ArrayList<adminModel> list;
    ArrayList<adminModel> cart = new ArrayList();

    public adminMyAdapter(Context c, ArrayList<adminModel> models) {
        this.c = c;
        this.models = models;
        this.list = new ArrayList<>(models);

    }

    @NonNull
    @Override
    public adminMyHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.orderslist, null);
        return new adminMyHolder(view);
    }

    @SuppressLint({"SetTextI18n", "ResourceAsColor"})
    @Override
    public void onBindViewHolder(@NonNull final adminMyHolder holder, @SuppressLint("RecyclerView") final int position) {
        holder.clientid.setText(models.get(position).getClientid());
        holder.price.setText("Total: ₱" + models.get(position).getPrice() * models.get(position).getQuant() + ".00");
        holder.Qty.setText("Quantity: "+models.get(position).getQuant() +" "+ models.get(position).getJartype());
        holder.delivery.setText("For " +models.get(position).getDelivery());
        //holder.jartype.setText(models.get(position).getJartype());
        holder.watertype.setText(models.get(position).getWatertype() + " Water");
        holder.ordernum.setText("Order No. " + models.get(position).getTransactionnum());
        //holder.status.setText(models.get(position).getStatus());
        holder.address.setText(models.get(position).getAddress());

        if(models.get(position).getStatus().equals("Delivered")){
            holder.status.setTextColor(R.color.colorPrimary);
            holder.status.setText("Delivered");
            holder.status.setTextColor(ContextCompat.getColor(c,R.color.newgreen));
        }
    }

    @Override
    public int getItemCount() {
        return models.size();

    }

    @Override
    public Filter getFilter() {
        return filter;
    }

    Filter filter = new Filter() {
        @Override
        protected FilterResults performFiltering(CharSequence charSequence) {

            //list=new ArrayList<>(models);
            ArrayList<adminModel> filterlist = new ArrayList<>();
            if (charSequence.toString().isEmpty()) {
                filterlist.addAll(list);

            } else {
                for (adminModel orders : list) {
                    if (orders.getClientid().toLowerCase().startsWith(charSequence.toString().toLowerCase())) {
                        filterlist.add(orders);
                    }
                }
            }
            FilterResults results = new FilterResults();
            results.values = filterlist;

            return results;
        }

        @Override
        protected void publishResults(CharSequence constraint, FilterResults results) {
            models.clear();
            models = (ArrayList<adminModel>) results.values;
            notifyDataSetChanged();
        }
    };
}
