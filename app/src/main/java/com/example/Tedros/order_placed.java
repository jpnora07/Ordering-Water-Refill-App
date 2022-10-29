package com.example.Tedros;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class order_placed extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
        setContentView(R.layout.order_placed);
        if (getSupportActionBar() != null) {
            getSupportActionBar().hide();
        }
        Button shop = findViewById(R.id.button);
        shop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(order_placed.this,my_orders.class);
                startActivity(i);
            }
        });
}}
