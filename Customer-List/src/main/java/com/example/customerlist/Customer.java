package com.example.customerlist;

import java.util.Date;

public class Customer {
    private int id;
    private String name;
    private String address;
    private String dob;

    public Customer(int id, String name, String address, String dob) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.dob = dob;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
}
