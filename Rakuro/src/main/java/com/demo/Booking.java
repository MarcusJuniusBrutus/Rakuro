package com.demo;

import java.sql.Date;
import java.sql.Time;
import PACKAGE_NAME.com.demo.Status;


/**
 * Booking class to save booking info
 */
public class Booking {
    private String SSN;
    private String hotel_chain_name;
    private Integer hotel_number;
    private String room_number;
    private boolean is_paid_for;
    private String booking_number;
    private Time start_time;
    private Date start_date;
    private Time end_time;
    private Date end_date;
    private String status;


    /**
     * Constructor to create Booking object with SSN, hotel_chain_name, hotel_number, room_number, is_paid_for, booking_number, start_time, start_date, end_time, end_date, status
     *
     * @param SSN SSN of customer
     * @param hotel_chain_name name of the hotel chain that booking is for
     * @param hotel_number number of the hotel of the hotel chain that booking is for
     * @param room_number number of the room of the hotel that booking is for
     * @param is_paid_for boolean that indicates if customer paid for the booking
     * @param booking_number number of the booking
     * @param start_time the starting time of the booking
     * @param start_date the starting date indicated in the booking
     * @param end_time the ending time of the booking
     * @param end_date the ending date of the booking
     * @param status the status of the booking
     *
     */
    public Booking(String SSN, String hotel_chain_name, Integer hotel_number, String room_number, boolean is_paid_for, String booking_number, Time start_time, Date start_date, Time end_time, Date end_date, String status) {
        this.SSN = SSN;
        this.hotel_chain_name = hotel_chain_name;
        this.hotel_number = hotel_number;
        this.room_number = room_number;
        this.is_paid_for = is_paid_for;
        this.booking_number = booking_number;
        this.start_time = start_time;
        this.start_date = start_date;
        this.end_time = end_time;
        this.end_date = end_date;
        this.status = status;
    }

    /* Getters */
    public String getSSN() { return this.SSN; }
    public String getHotelChainName() { return this.hotel_chain_name; }
    public Integer getHotelNumber() { return this.hotel_number; }
    public String getRoomNumber() { return this.room_number; }
    public boolean getIsPaidFor() { return this.is_paid_for; }
    public String getBookingNumber() { return this.booking_number; }
    public Time getStartTime() { return this.start_time; }
    public Date getStartDate() { return this.start_date; }
    public Time getEndTime() { return this.end_time; }
    public Date getEndDate() { return this.end_date; }
    public String getStatus() { return this.status; }

    /* Setters */
    public void setSSN(String SSN) { this.SSN = SSN; }
    public void setHotelChainName(String hotel_chain_name) { this.hotel_chain_name = hotel_chain_name; }
    public void setHotelNumber(Integer hotel_number) { this.hotel_number = hotel_number; }
    public void setRoomNumber(String room_number) { this.room_number = room_number; }
    public void setIsPaidFor(boolean is_paid_for) { this.is_paid_for = is_paid_for; }
    public void setBookingNumber(String booking_number) { this.booking_number = booking_number; }
    public void setStartTime(Time start_time) { this.start_time = start_time; }
    public void setStartDate(Date start_date) { this.start_date = start_date; }
    public void setEndTime(Time end_time) { this.end_time = end_time; }
    public void setEndDate(Date end_date) { this.end_date = end_date; }
    public void setStatus(String status) { this.status = status; }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>SSN= " + SSN + "</li>"
                + "<li>hotel_chain_name= " + hotel_chain_name + "</li>"
                + "<li>hotel_number= " + hotel_number + "</li>"
                + "<li>room_number= " + room_number + "</li>"
                + "<li>is_paid_for= " + is_paid_for + "</li>"
                + "<li>booking_number= " + booking_number + "</li>"
                + "<li>start_time= " + start_time + "</li>"
                + "<li>start_date= " + start_date + "</li>"
                + "<li>end_time= " + end_time + "</li>"
                + "<li>end_date= " + end_date + "</li>"
                + "<li>status= " + status + "</li>";
    }
}
