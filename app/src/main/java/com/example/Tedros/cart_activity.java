package com.example.Tedros;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

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
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import retrofit2.Call;
import retrofit2.Callback;

public class cart_activity extends AppCompatActivity {
    SharedPreferences sharedPreferences;
    public RequestQueue mQueue;
    public int Price = 0;
    HashMap<Integer,Integer> cartlist ;
    ArrayList<Model> list;
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        if (getSupportActionBar() != null) {
            getSupportActionBar().hide();
        }
        sharedPreferences = getSharedPreferences(Constants.PREFERENCE_NAME,MODE_PRIVATE);
        //SharedPreferences.Editor editor = sharedPreferences.edit();
        Bundle extra =  getIntent().getBundleExtra("cart");
        list = (ArrayList<Model>) extra.getSerializable("objects");
        if(list.isEmpty()){
            setContentView(R.layout.empty_cart);
            Button shop = findViewById(R.id.shopnow);
            shop.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    finish();
                }
            });
        }else {
            setContentView(R.layout.activity_cart);
            TextView totalPrice = findViewById(R.id.totalprice);
            ListView listcart = findViewById(R.id.cartlist);

            mQueue = VolleySingleton.getInstance(this).getmRequestqueue();
            CartListAdapter adapter = new CartListAdapter(this, R.layout.cart_list, list);
            listcart.setAdapter(adapter);
            cartlist = new HashMap<>();
            for (Model m : list) {

                int costint = Integer.parseInt(m.getCost());
                int quant = Integer.parseInt(String.valueOf(m.getQuant()));
                Price = Price + (costint * quant);
                cartlist.put(m.getjartypeid(), m.getQuant());
            }

            //Toast.makeText(this,Integer.toString(adapter.totalprice),Toast.LENGTH_LONG).show();
            totalPrice.setText("₱"+ Integer.toString(Price) + ".00");
            //totalPrice.setText(orders);

            String address = sharedPreferences.getString(Constants.KEY_ADDRESS, "");
            String Name = sharedPreferences.getString(Constants.KEY_NAME, "");
            String number = sharedPreferences.getString(Constants.KEY_CNUMBER, "");
            TextView cartName = findViewById(R.id.cartName);
            TextView add = findViewById(R.id.addresscart);
            TextView num = findViewById(R.id.number);
            cartName.setText(Name);
            add.setText(address);
            num.setText(number);
            Button order = findViewById(R.id.order);
            order.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Order();

                }
            });
            /*Button edit = findViewById(R.id.edit);
            edit.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Intent i = new Intent(getApplicationContext(),edit_profile.class);
                    startActivity(i);
                }
            });*/
        }

    }


    private void Order() {

        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Loading...");
        progressDialog.show();

        String url = "https://centigrade-foam.000webhostapp.com/mobileapp/addOrder.php";

        StringRequest sr = new StringRequest(Request.Method.POST,url, new com.android.volley.Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jsonobject = new JSONObject(response);

                    String success = jsonobject.getString("success");

                    if(success.equals("1")) {
                        //Toast.makeText(getApplicationContext(), "success", Toast.LENGTH_LONG).show();
                        list.clear();
                        cartlist.clear();
                        MainActivity.CLEAR_CART=1;
                        setContentView(R.layout.order_placed);
                        //Toast.makeText(Login.this,sharedPreferences.getString("un",""),Toast.LENGTH_LONG).show();
                    }
                    else{
                        Toast.makeText(getApplicationContext(), "Order Failed ", Toast.LENGTH_LONG).show();

                    }
                    progressDialog.dismiss();

                } catch (JSONException e) {
                    Toast.makeText(getApplicationContext(), "Order Failed ", Toast.LENGTH_LONG).show();
                    e.printStackTrace();
                    progressDialog.dismiss();
                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                error.printStackTrace();
                Toast.makeText(getApplicationContext(), "Error Logging in check Internet Connection", Toast.LENGTH_LONG).show();
                progressDialog.dismiss();
            }
        }){
            @Override
            protected Map<String,String> getParams(){

                HashMap<String,String> param = new HashMap<String,String>();
                param.put("name",sharedPreferences.getString(Constants.KEY_NAME,""));
                param.put("address",sharedPreferences.getString(Constants.KEY_ADDRESS,""));
                param.put("amount", String.valueOf(Price));
                Gson gson = new Gson();
                String jsonhashmap = gson.toJson(cartlist);
                param.put("data",jsonhashmap);

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

    @Override
    public boolean onSupportNavigateUp() {
        finish();
        return true;
    }

    @Override
    public void onBackPressed() {
        finish();
    }

    public void Checkout(View view) {

    }

    public void myordersIntent(View view) {
        Intent i = new Intent(this,my_orders.class);
        startActivity(i);
    }
}