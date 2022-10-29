package com.example.Tedros;

import android.annotation.SuppressLint;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.ArrayList;


public class CartListAdapter extends ArrayAdapter<Model> {
    Context c;
    int resource;

    public CartListAdapter(@NonNull Context context, int resource, @NonNull ArrayList<Model> objects) {
        super(context, resource, objects);
        this.c=context;
        this.resource=resource;
    }

    @SuppressLint("SetTextI18n")
    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        String Name = getItem(position).getJartype();
        String Qty = Integer.toString(getItem(position).getQuant());
        String cost = getItem(position).getCost();
        int costint = Integer.parseInt(cost);
        String Total = Integer.toString(costint*getItem(position).getQuant());


        LayoutInflater inflater = LayoutInflater.from(c);
        convertView = inflater.inflate(resource,parent,false);

        TextView PName = (TextView) convertView.findViewById(R.id.date);
        TextView Pqty = (TextView) convertView.findViewById(R.id.Pqty);
        TextView Pprice = (TextView) convertView.findViewById(R.id.status);
        TextView Ptotal = (TextView) convertView.findViewById(R.id.total);



        PName.setText(Name);
        Pqty.setText(Qty);
        Pprice.setText("₱"+ cost + ".00");
        Ptotal.setText("₱"+ Total + ".00");


        return convertView;
    }
}
