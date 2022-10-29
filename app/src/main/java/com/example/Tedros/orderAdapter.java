package com.example.Tedros;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.google.gson.Gson;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class orderAdapter extends RecyclerView.Adapter<orderHolder> {
    @NonNull
    Context c;
    ArrayList<order> models;
    public RequestQueue mQueue;
    SharedPreferences sharedPreferences;

    public orderAdapter(@NonNull Context c, ArrayList<order> models) {
        this.c = c;
        this.models = models;
    }

    @Override
    public orderHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.order_card,parent,false);
        return new orderHolder(view);
    }

    @SuppressLint("ResourceAsColor")
    @Override
    public void onBindViewHolder(@NonNull orderHolder holder, @SuppressLint("RecyclerView") int position) {
        holder.date.setText(models.get(position).getDate());
        holder.total.setText(models.get(position).getTotal());
        holder.content.setText(models.get(position).getContent());
        holder.markBtn.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                String url = "https://centigrade-foam.000webhostapp.com/mobileapp/updateStatus.php";

                mQueue = VolleySingleton.getInstance(c).getmRequestqueue();
                StringRequest sr = new StringRequest(Request.Method.POST,url, new com.android.volley.Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Toast.makeText(c,response,Toast.LENGTH_SHORT).show();

                    }
                }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        error.printStackTrace();
                        Toast.makeText(c.getApplicationContext(), "Error Mark as Delivered", Toast.LENGTH_LONG).show();

                    }
                }){
                    @Override
                    protected Map<String,String> getParams(){
                        HashMap<String,String> param = new HashMap<String,String>();
                        param.put("status","Delivered");
                        param.put("orderid",models.get(position).getOrderid());


                        return param;
                    }

                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        Map<String,String> params = new HashMap<String, String>();
                        params.put("Content-Type","application/x-www-form-urlencoded");
                        return params;
                    }
                };

                mQueue.add(sr);

        }
        });

        if(models.get(position).getStatus().equals("Delivered")){
            holder.status.setTextColor(R.color.colorPrimary);
            holder.status.setText("Delivered");
            holder.status.setTextColor(ContextCompat.getColor(c,R.color.newgreen));
            holder.parent.setBackgroundResource( R.drawable.order_card_compleate);
        }

    }

    @Override
    public int getItemCount() {
        return models.size();
    }
}
