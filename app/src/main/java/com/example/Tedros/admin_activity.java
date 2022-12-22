package com.example.Tedros;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.SearchView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class admin_activity extends AppCompatActivity {

    //this is the JSON Data URL
    //make sure you are using the correct ip else it will not work
    private static final String URL_PRODUCTS = "https://centigrade-foam.000webhostapp.com/mobileapp/ordersToday.php";

    //a list to store all the products
    ArrayList<adminModel> models;

    //the recyclerview
    RecyclerView recyclerView;
    adminMyAdapter myAdapter;
    public static int CLEAR_CART=0;


    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_admin);

        //getting the recyclerview from xml
        recyclerView = findViewById(R.id.recyclerView);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));


        //initializing the productlist
        models = new ArrayList<>();
        myAdapter = new adminMyAdapter(this,models);
        recyclerView.setAdapter(myAdapter);
        //this method will fetch and parse json
        //to display it in recyclerview
        loadOrders();
    }

    private void loadOrders() {


        /* * Creating a String Request
         * The request type is GET defined by first parameter
         * The URL is defined in the second parameter
         * Then we have a Response Listener and a Error Listener
         * In response listener we will get the JSON response as a String
         */
        StringRequest stringRequest = new StringRequest(Request.Method.GET, URL_PRODUCTS,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        try {
                            //converting the string to json array object
                            JSONArray array = new JSONArray(response);

                            //traversing through all the object
                            for (int i = 0; i < array.length(); i++) {

                                //getting product object from json array
                                JSONObject orders = array.getJSONObject(i);

                                //adding the product to product list

                                int id = orders.getInt("orderid");
                                String transactionnum = orders.getString("transactionnum");
                                String jartype = orders.getString("jartype");
                                int quant = orders.getInt("quantity");
                                String watertype = orders.getString("watertype");
                                String delivery = orders.getString("delivery");
                                String status = orders.getString("status");
                                String clientid = orders.getString("clientid");
                                String address = orders.getString("address");
                                int price = orders.getInt("price");

                                adminModel m = new adminModel();
                                m.setClientid(clientid.substring(0, 1).toUpperCase() + clientid.substring(1));
                                m.setPrice(price);
                                m.setOrderid(id);
                                m.setQuant(quant);
                                m.setTransactionnum(transactionnum);
                                m.setWatertype(watertype.substring(0, 1).toUpperCase() + watertype.substring(1));
                                m.setDelivery(delivery.substring(0, 1).toUpperCase() + delivery.substring(1));
                                m.setStatus(status.substring(0, 1).toUpperCase() + status.substring(1));
                                m.setAddress(address.substring(0, 1).toUpperCase() + address.substring(1));
                                m.setJartype(jartype.substring(0, 1).toUpperCase() + jartype.substring(1));

                                models.add(m);


                            }

                            //creating adapter object and setting it to recyclerview
                            /*MyAdapter adapter = new MyAdapter(MainActivity.this, models);
                            recyclerView.setAdapter(adapter);*/
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        myAdapter.notifyDataSetChanged();
                        if(models.isEmpty()){
                            setContentView(R.layout.empty_orders);
                        }else{
                            adminMyAdapter adapter = new adminMyAdapter(admin_activity.this, models);
                            //Toast.makeText(admin_activity.this,"with data", Toast.LENGTH_LONG).show();
                            recyclerView.setAdapter(adapter);
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {

                    }
                });

        //adding our stringrequest to queue
        Volley.newRequestQueue(this).add(stringRequest);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.admin_menutop,menu);
        MenuItem search = menu.findItem(R.id.search);
        MenuItem refresh = menu.findItem(R.id.refresh);

        refresh.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(@NonNull MenuItem item) {
                switch(item.getItemId()){
                    case R.id.refresh:
                        Intent launchNewIntent = new Intent(admin_activity.this,admin_activity.class);
                        launchNewIntent.setFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION);
                        startActivityForResult(launchNewIntent, 0);
                        return true;
                }
                return false;
            }
        });

        //MenuItem profile = menu.findItem(R.id.profile);
        SearchView searchView = (SearchView) search.getActionView();
        //myAdapter.list=new ArrayList<>(models);
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {

                myAdapter.getFilter().filter(newText);
                return false;
            }
        });

        return super.onCreateOptionsMenu(menu);
    }
    @Override
    protected void onResume() {
        if(CLEAR_CART==1){

            myAdapter = new adminMyAdapter(this,models);
            recyclerView.setAdapter(myAdapter);

        }
        super.onResume();
    }
    int backButtonCount=0;
    @Override
    public void onBackPressed()
    {

        if(backButtonCount >= 1)
        {
            Intent intent = new Intent(Intent.ACTION_MAIN);
            intent.addCategory(Intent.CATEGORY_HOME);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
        }
        else
        {
            Toast.makeText(this, "Press the back button once again to close the application.", Toast.LENGTH_SHORT).show();
            backButtonCount++;
        }
    }

}