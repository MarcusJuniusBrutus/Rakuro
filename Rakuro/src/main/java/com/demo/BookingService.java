package main.java.com.demo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import PACKAGE_NAME.com.demo.ConnectionDB;
import PACKAGE_NAME.com.demo.Booking;

public class BookingService {

    /**
     * Method to get all bookings from the database given a booking_number
     *
     * @return List of bookings from database
	 * @param booking_number the booking_number of the booking to return
     * @throws Exception when trying to connect to database
     */
    public Booking getBooking(String booking_number) throws Exception {

        // sql query
        String sql = "SELECT * FROM booking WHERE booking_number = " + booking_number + ";";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all bookings retrieved from database
        List<Booking> bookings = new ArrayList<>();

        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            rs.next();
			Booking booking = new Booking(
                        rs.getString("SSN"),
                        rs.getString("hotel_chain_name"),
                        rs.getInt("hotel_number"),
                        rs.getString("room_number"),
                        rs.getBoolean("is_paid_for"),
                        rs.getString("booking_number"),
                        rs.getTime("start_time"),
                        rs.getDate("start_date"),
                        rs.getTime("end_time"),
                        rs.getDate("end_date"),
                        rs.getObject("status", BlahBlahBlah.class) //TODO: FIX
            );

            //close the result set
            rs.close();
            // close the statement
            stmt.close();
            con.close();
            db.close();

            // return the bookings retrieved from database
            return booking;
        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }
	
	/**
	* Given a bunch of booking parameters, changes the given booking's values to them.
	* @param booking_number the booking to modifyBooking
	* @param ssn the new ssn
	* @param hotel_chain_name the new hotel_chain_name
	* @param hotel_number the new hotel_number
	* @param room_number the new room_number
	* @param is_paid_for the new is_paid_for
	* @param start_date the new start_date, must be in format YYYY-MM-DD
	* @param start_time the new start_time, must be in format HH:MM:SS
	* @param end_date the new end_date, must be in format YYYY-MM-DD
	* @param end_time the new end_time, must be in format HH:MM:SS
	* @param status the new status
	* @return boolean true if successfully modified, false otherwise
	* @throws Exception when trying to connect to database
	*/
	public boolean modifyBooking(String booking_number, String ssn, String hotel_chain_name, String hotel_number, String room_number, boolean is_paid_for, String start_date, String start_time, String end_date, String end_time, String status) {
        Connection con = null;

        // sql query
        String sql = "UPDATE BOOKING SET SSN = " + ssn + 
		", hotel_chain_name = '" + hotel_chain_name + 
		"', hotel_number = " + hotel_number + 
		", room_number = '" + room_number + 
		"', is_paid_for = " + is_paid_for + 
		", start_time = '" + start_time + 
		"', start_date = '" + start_date +
		"', end_time = '" + end_time + 
		"', end_date = '" + end_date + 
		"', status = " + status + 
		"' WHERE booking_number = " + booking_number + 
		";";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // execute the query
            stmt.executeUpdate();

            // close the statement
            stmt.close();

        } catch (Exception e) {
            return false;
        } finally {
            if (con != null) con.close();
        }

        return true;
	}

    /**
     * Method to delete by booking_number a booking
     *
     * @param booking_number number of booking to be deleted from database
     * @return boolean returns true if successfully deleted and false if not
     * @throws Exception when trying to connect to database
     */
    public boolean deleteBooking(String booking_number) throws Exception {
        Connection con = null;

        // sql query
        String sql = "DELETE FROM booking WHERE booking_number = " + booking_number + ";";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // execute the query
            stmt.executeUpdate();

            // close the statement
            stmt.close();

        } catch (Exception e) {
            return false;
        } finally {
            if (con != null) con.close();
        }

        return true;
    }
}
