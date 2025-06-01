/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Dell
 */
public class Revenue {

    private String revenueId;
    private String roomId;
    private String bookingId;
    private String amount;
    private String revenueDate;

    public Revenue() {
    }

    public Revenue(String revenueId, String roomId, String bookingId, String amount, String revenueDate) {
        this.revenueId = revenueId;
        this.roomId = roomId;
        this.bookingId = bookingId;
        this.amount = amount;
        this.revenueDate = revenueDate;
    }

    public String getRevenueId() {
        return revenueId;
    }

    public void setRevenueId(String revenueId) {
        this.revenueId = revenueId;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getRevenueDate() {
        return revenueDate;
    }

    public void setRevenueDate(String revenueDate) {
        this.revenueDate = revenueDate;
    }

    


    
}
