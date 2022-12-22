package com.example.Tedros;

import java.io.Serializable;

public class adminModel implements Serializable {

    private int orderid;
    private String transactionnum;
    private String jartype;
    private int quant;
    private String watertype;
    private int Price;
    private String delivery;
    private String status;
    private String clientid;
    private String address;


    public int getOrderid() {
        return orderid;
    }
    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getTransactionnum() {
        return transactionnum;
    }

    public void setTransactionnum(String transactionnum) {
        this.transactionnum = transactionnum;
    }

    public String getWatertype() {
        return watertype;
    }

    public void setWatertype(String watertype) {
        this.watertype = watertype;
    }

    public String getJartype() {
        return jartype;
    }
    public void setJartype(String jartype) {
        this.jartype = jartype;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int price) {
        Price = price;
    }

    public int getQuant() {
        return quant;
    }

    public void setQuant(int quant) {
        this.quant = quant;
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getClientid() {
        return clientid;
    }

    public void setClientid(String clientid) {
        this.clientid = clientid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }




}
