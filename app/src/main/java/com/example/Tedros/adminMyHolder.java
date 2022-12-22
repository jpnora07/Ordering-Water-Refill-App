package com.example.Tedros;

import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

public class adminMyHolder extends RecyclerView.ViewHolder {

    TextView Qty,delivery,jartype,clientid,watertype,ordernum,status,price,address;

    public adminMyHolder(@NonNull View itemView) {
        super(itemView);

        this.clientid = itemView.findViewById(R.id.clientid);
        this.price = itemView.findViewById(R.id.price);
        this.Qty =itemView.findViewById(R.id.Quantity);
        this.delivery = itemView.findViewById(R.id.delivery);
        //this.jartype = itemView.findViewById(R.id.jartype);
        this.watertype = itemView.findViewById(R.id.watertype);
        this.ordernum =itemView.findViewById(R.id.ordernum);
        this.status = itemView.findViewById(R.id.status);
        this.address =itemView.findViewById(R.id.address);

    }
}
