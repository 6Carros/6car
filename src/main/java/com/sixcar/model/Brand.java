package com.sixcar.model;

public class Brand {

    private int id;
    private String name;
    private String country;
    private int foundedYear;
    private String logoUrl;
    private String description;

    public Brand() {
    }

    public Brand(int id, String name, String country, int foundedYear, String logoUrl, String description) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.foundedYear = foundedYear;
        this.logoUrl = logoUrl;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getFoundedYear() {
        return foundedYear;
    }

    public void setFoundedYear(int foundedYear) {
        this.foundedYear = foundedYear;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}