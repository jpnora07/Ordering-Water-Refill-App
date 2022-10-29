    package com.example.Tedros;

    import android.app.ProgressDialog;
    import android.content.SharedPreferences;
    import android.os.Bundle;
    import android.view.View;

    import androidx.appcompat.app.AppCompatActivity;
    import androidx.recyclerview.widget.LinearLayoutManager;
    import androidx.recyclerview.widget.RecyclerView;
    import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

    import com.android.volley.AuthFailureError;
    import com.android.volley.Request;
    import com.android.volley.RequestQueue;
    import com.android.volley.Response;
    import com.android.volley.VolleyError;
    import com.android.volley.toolbox.StringRequest;

    import org.json.JSONArray;
    import org.json.JSONException;
    import org.json.JSONObject;

    import java.util.ArrayList;
    import java.util.HashMap;
    import java.util.Map;

    public class my_orders extends AppCompatActivity {
    RecyclerView mRecyclerView;
    orderAdapter mAdapter;
    ArrayList<order> models;
    public RequestQueue mQueue;
    SharedPreferences sharedPreferences;
    String name;
    SwipeRefreshLayout swipeLayout;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_orders);

        models = new ArrayList<>();
        sharedPreferences = getSharedPreferences(Constants.PREFERENCE_NAME,MODE_PRIVATE);
        name = sharedPreferences.getString(Constants.KEY_NAME,"");
        mRecyclerView = findViewById(R.id.orderREcycler);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(this));
        mAdapter = new orderAdapter(this,models);
        mRecyclerView.setAdapter(mAdapter);
        mQueue = VolleySingleton.getInstance(this).getmRequestqueue();
        getData();

    }

    private void getData() {
        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Loading...");
        progressDialog.show();

        String url = "https://centigrade-foam.000webhostapp.com/mobileapp/orderhistory.php";

        StringRequest sr = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    JSONArray result = new JSONArray(response);
                    for(int i = 0 ; i<result.length();i++) {
                        JSONObject jo = result.getJSONObject(i);
                        String status = jo.getString("status");
                        String date = jo.getString("date");
                        StringBuilder content = new StringBuilder();
                        int total = 0;
                        JSONArray items = jo.getJSONArray("items");
                        int orderid = 0;
                        for (int j = 0; j < items.length(); j++) {
                            SharedPreferences preferences = getSharedPreferences(Constants.PREFERENCE_NAME, MODE_PRIVATE);
                            SharedPreferences.Editor editor = preferences.edit();
                            JSONArray item = items.getJSONArray(j);
                            int quant = Integer.parseInt(item.getString(2));
                            int price = Integer.parseInt(item.getString(1));
                            //editor.putString(Constants.KEY_ORDERID, String.valueOf(Integer.parseInt(item.getString(3))));
                            //editor.apply();
                            orderid = Integer.parseInt(item.getString(3));
                            total = total + (price * quant);
                            //String unit=item.getString(1); //price
                            content.append(item.getString(2)); //quantity
                            ///content.append(unit); //price
                            content.append(" ");
                            content.append(item.getString(0));
                            content.append(" = ");
                            content.append("₱");
                            content.append(price * Integer.parseInt(item.getString(2)));
                            content.append("\n");

                        }

                        order o = new order();
                        o.setDate(date);
                        o.setOrderid(orderid);
                        o.setStatus(status);
                        o.setContent(content.toString());
                        o.setTotal("₱" + Integer.toString(total) + ".00");
                        models.add(o);
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                    progressDialog.dismiss();
                }
                mAdapter.notifyDataSetChanged();

                progressDialog.dismiss();

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                error.printStackTrace();
                progressDialog.dismiss();
            }
        }) {
            @Override
            protected Map<String, String> getParams() {
                HashMap<String, String> param = new HashMap<String, String>();
                param.put("name",name );
                return param;
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> params = new HashMap<String, String>();
                params.put("Content-Type", "application/x-www-form-urlencoded");
                return params;
            }
        };

        mQueue.add(sr);


    }
    }
