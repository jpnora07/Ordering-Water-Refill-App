package com.example.Tedros;

import com.google.gson.annotations.SerializedName;

public class UserModel {

    @SerializedName("name")
    private String name;

    @SerializedName("username")
    private String username;

    @SerializedName("email")
    private String email;

    @SerializedName("cnumber")
    private String cnumber;

    @SerializedName("address")
    private String address;

    @SerializedName("userid")
    private String userid;

    public String getUsername() {
        return username;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getNumber() {
        return cnumber;
    }

    public String getEmail() {
        return email;
    }

    public String getUserid() {
        return userid;
    }
}
