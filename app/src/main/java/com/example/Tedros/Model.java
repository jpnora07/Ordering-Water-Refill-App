package com.example.Tedros;

import java.io.Serializable;

public class Model implements Serializable {

    private int jartypeid;
    private String jartype;
    private String image;
    private int quant;
    private int gallon;
    private String Price;

    /*public Model(int jartypeid, String jartype, String image, String price) {
        this.jartypeid = jartypeid;
        this.jartype = jartype;
        this.image = image;
        this.Price = price;
    }*/

    public int getjartypeid() {
        return jartypeid;
    }
    public void setjartypeid(int jartypeid) {
        this.jartypeid = jartypeid;
    }

    public String getJartype() {
        return jartype;
    }

    public void setJartype(String jartype) {
        this.jartype = jartype;
    }

    public int getGallon() {
        return gallon;
    }

    public void setGallon(int gallon) {
        this.gallon = gallon;
    }

    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }

    public String getCost() {
        return Price;
    }

    public void setCost(String price) {
        Price = price;
    }

    public int getQuant() {
        return quant;
    }

    public void setQuant(int quant) {
        this.quant = quant;
    }


}
