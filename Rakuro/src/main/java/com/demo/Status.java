package PACKAGE_NAME.com.demo;

/**
 * An enumeration class to hold the three possible states of a Booking (PENDING, REJECTED, or APPROVED).
 */
public enum Status {

    /**
     * A pending status: when a person makes a reservation online, they have reserved a room for an appropriate duration, but have
     * not stayed at the hotel yet. Booking remains to be a booking
     */
    PENDING,

    /**
     * An active status: The person has checked in and is currently staying at the hotel. The booking is now a renting.
     */
    ACITVE,

    /**
     * A completed status: The customer has completed their stay at the hotel.
     */
    COMPLETED,

    /**
     * A cancelled status:  The customer cancelled booking or some other problem occurred
     */
    CANCELLED
    }