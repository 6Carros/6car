package com.sixcar.model;

public class Car {

    private int id;
    private int brandId;
    private String model;
    private int year;
    private String color;
    private double pricePerDay;
    private boolean available;
    private String imageUrl;

    public Car() {}

    public Car(int id, int brandId, String model, int year, String color,
               double pricePerDay, boolean available, String imageUrl) {
        this.id = id;
        this.brandId = brandId;
        this.model = model;
        this.year = year;
        this.color = color;
        this.pricePerDay = pricePerDay;
        this.available = available;
        this.imageUrl = imageUrl;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getBrandId() { return brandId; }
    public void setBrandId(int brandId) { this.brandId = brandId; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }

    public double getPricePerDay() { return pricePerDay; }
    public void setPricePerDay(double pricePerDay) { this.pricePerDay = pricePerDay; }

    public boolean isAvailable() { return available; }
    public void setAvailable(boolean available) { this.available = available; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}