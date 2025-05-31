/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dell
 */
public class Room_details {
    private String detail_id;
    private String room_id;
    private String description;
    private String bed_type;
    private String amenities;
    private String roomsize;

    public Room_details() {
    }

    public Room_details(String detail_id, String room_id, String description, String bed_type, String amenities, String roomsize) {
        this.detail_id = detail_id;
        this.room_id = room_id;
        this.description = description;
        this.bed_type = bed_type;
        this.amenities = amenities;
        this.roomsize = roomsize;
    }

    public String getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(String detail_id) {
        this.detail_id = detail_id;
    }

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBed_type() {
        return bed_type;
    }

    public void setBed_type(String bed_type) {
        this.bed_type = bed_type;
    }

    public String getAmenities() {
        return amenities;
    }

    public void setAmenities(String amenities) {
        this.amenities = amenities;
    }

    public String getRoomsize() {
        return roomsize;
    }

    public void setRoomsize(String roomsize) {
        this.roomsize = roomsize;
    }
    
    
    
}
