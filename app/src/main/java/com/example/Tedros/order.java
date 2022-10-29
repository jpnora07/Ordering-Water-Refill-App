package com.example.Tedros;

public class order {
    private String date;
    private String total;
    private String content;
    private String status;
    private String orderid;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getOrderid(){return orderid;}

    public void setOrderid(int orderid) {this.orderid = String.valueOf(orderid);
    }
}
