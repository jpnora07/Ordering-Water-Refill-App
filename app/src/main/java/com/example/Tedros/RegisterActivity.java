package com.example.Tedros;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class RegisterActivity extends AppCompatActivity {

    EditText inputName, inputPassword, inputemail,inputAge,inputAddress,inputPosition,inputUsername,inputContact;
    Button buttonRegister;
    TextView linklogin;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        if (getSupportActionBar() != null) {
            getSupportActionBar().hide();
        }

        inputName = findViewById(R.id.txtName);
        inputemail = findViewById(R.id.txtEmail);
        inputPassword = findViewById(R.id.txtPwd);
        inputAge = findViewById(R.id.txtAge);
        inputAddress = findViewById(R.id.txtAddress);
        inputPosition = findViewById(R.id.txtPosition);
        inputPosition.setText("Customer");
        inputUsername = findViewById(R.id.txtUsername);
        inputContact = findViewById(R.id.txtContact);

        linklogin = findViewById(R.id.lnkLogin);
        linklogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(RegisterActivity.this, LoginActivity.class);
                startActivity(intent);
                finish();
            }
        });
        buttonRegister = findViewById(R.id.btnregister);
        buttonRegister.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {

                if (inputName.getText().toString().equals("")) {
                    Toast.makeText(RegisterActivity.this, "Enter your name", Toast.LENGTH_SHORT).show();
                } else if (inputemail.getText().toString().equals("")) {
                    Toast.makeText(RegisterActivity.this, "Enter email", Toast.LENGTH_SHORT).show();
                } else if (inputPassword.getText().toString().equals("")) {
                    Toast.makeText(RegisterActivity.this, "Enter password", Toast.LENGTH_SHORT).show();
                } /*else if (!emailValidator(inputemail.getText().toString())) {
                    Toast.makeText(RegisterActivity.this, "Enter valid email", Toast.LENGTH_SHORT).show();
                }*/ else if (inputAge.getText().toString().equals("")) {
                    Toast.makeText(RegisterActivity.this, "Enter your age", Toast.LENGTH_SHORT).show();
                } else if (inputUsername.getText().toString().equals("")) {
                    Toast.makeText(RegisterActivity.this, "Enter your username", Toast.LENGTH_SHORT).show();
                } else if (inputAddress.getText().toString().equals("")) {
                    Toast.makeText(RegisterActivity.this, "Enter your address", Toast.LENGTH_SHORT).show();
                } else if (inputContact.getText().toString().equals("")) {
                    Toast.makeText(RegisterActivity.this, "Enter your contact number", Toast.LENGTH_SHORT).show();
                } else {

                    HashMap<String, String> params = new HashMap<>();
                    params.put("name", inputName.getText().toString());
                    params.put("email", inputemail.getText().toString());
                    params.put("password", inputPassword.getText().toString());
                    params.put("age", inputAge.getText().toString());
                    params.put("username", inputUsername.getText().toString());
                    params.put("address", inputAddress.getText().toString());
                    params.put("contact", inputContact.getText().toString());
                    params.put("position", inputPosition.getText().toString());
                    register(params);
                }

            }

        });

    }

    public boolean emailValidator(String email) {
        Pattern pattern;
        Matcher matcher;
        final String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        pattern = Pattern.compile(EMAIL_PATTERN);
        matcher = pattern.matcher(email);
        return matcher.matches();
    }

    private void register(HashMap<String, String> params) {

        final ProgressDialog progressDialog = new ProgressDialog(RegisterActivity.this);
        progressDialog.setTitle("Please wait");
        progressDialog.setMessage("Registering...");
        progressDialog.setCancelable(false);
        progressDialog.show();

        NetworkService networkService = NetworkClient.getClient().create(NetworkService.class);
        Call<RegistrationResponseModel> registerCall = networkService.register(params);
        registerCall.enqueue(new Callback<RegistrationResponseModel>() {
            @Override
            public void onResponse(@NonNull Call<RegistrationResponseModel> call, @NonNull Response<RegistrationResponseModel> response) {
                RegistrationResponseModel responseBody = response.body();
                if (responseBody != null) {
                    if (responseBody.getSuccess().equals("1")) {
                        Toast.makeText(RegisterActivity.this, responseBody.getMessage(), Toast.LENGTH_SHORT).show();
                        Intent intent = new Intent(RegisterActivity.this, LoginActivity.class);
                        startActivity(intent);
                        finish();
                    } else {
                        Toast.makeText(RegisterActivity.this, responseBody.getMessage(), Toast.LENGTH_SHORT).show();
                    }
                }
                progressDialog.dismiss();
            }

            @Override
            public void onFailure(@NonNull Call<RegistrationResponseModel> call, @NonNull Throwable t) {
                progressDialog.dismiss();
            }
        });
    }
}