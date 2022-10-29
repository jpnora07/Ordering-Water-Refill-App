package com.example.Tedros;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.SearchView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

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

public class MainActivity extends AppCompatActivity {

    //this is the JSON Data URL
    //make sure you are using the correct ip else it will not work
    private static final String URL_PRODUCTS = "https://centigrade-foam.000webhostapp.com/mobileapp/waterjars.php";

    //a list to store all the products
    ArrayList<Model> models;

    //the recyclerview
    RecyclerView recyclerView;
    MyAdapter myAdapter;
    public static int CLEAR_CART=0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //getting the recyclerview from xml
        recyclerView = findViewById(R.id.recylcerView);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));

        //initializing the productlist
        models = new ArrayList<>();
        myAdapter = new MyAdapter(this,models);
        recyclerView.setAdapter(myAdapter);
        //this method will fetch and parse json
        //to display it in recyclerview
        loadProducts();
    }

    private void loadProducts() {


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
                                JSONObject product = array.getJSONObject(i);

                                //adding the product to product list

                                int id = product.getInt("jartypeid");
                                String type = product.getString("jartype");
                                String image = product.getString("image");
                                int gallon = product.getInt("gallon");
                                String price = product.getString("price");

                                Model m = new Model();
                                m.setJartype(type.substring(0, 1).toUpperCase() + type.substring(1));
                                m.setCost(price);
                                m.setjartypeid(id);
                                m.setQuant(0);
                                m.setImage(image);
                                m.setGallon(gallon);

                                models.add(m);


                            }

                            //creating adapter object and setting it to recyclerview
                            /*MyAdapter adapter = new MyAdapter(MainActivity.this, models);
                            recyclerView.setAdapter(adapter);*/
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        myAdapter.notifyDataSetChanged();
                        myAdapter.list=new ArrayList<>(models);
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
        getMenuInflater().inflate(R.menu.menutop,menu);
        MenuItem search = menu.findItem(R.id.search);

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
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {

        int id = item.getItemId();

        if(id==R.id.cart){

            Intent intent = new Intent(this,cart_activity.class) ;
            //intent.putExtra("cart",models);
            Bundle extra = new Bundle();
            extra.putSerializable("objects", myAdapter.cart);
            intent.putExtra("cart",extra);
            startActivityForResult(intent,0);

        }
        if(id==R.id.toreceive){
            Intent intent = new Intent(this,my_orders.class)    ;
            startActivity(intent);
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void onResume() {
        if(CLEAR_CART==1){

            myAdapter = new MyAdapter(this,models);
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