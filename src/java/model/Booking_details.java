/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dell
 */
public class Booking_details {
    private String detail_id;
    private String booking_id;
    private String full_name;
    private String email;
    private String phone_number;
    private String special_requests;

    public Booking_details() {
    }

    public Booking_details(String detail_id, String booking_id, String full_name, String email, String phone_number, String special_requests) {
        this.detail_id = detail_id;
        this.booking_id = booking_id;
        this.full_name = full_name;
        this.email = email;
        this.phone_number = phone_number;
        this.special_requests = special_requests;
    }

    public String getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(String detail_id) {
        this.detail_id = detail_id;
    }

    public String getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(String booking_id) {
        this.booking_id = booking_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getSpecial_requests() {
        return special_requests;
    }

    public void setSpecial_requests(String special_requests) {
        this.special_requests = special_requests;
    }
    
    
}
