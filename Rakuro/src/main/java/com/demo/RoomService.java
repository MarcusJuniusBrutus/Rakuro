package main.java.com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import PACKAGE_NAME.com.demo.Room;
import PACKAGE_NAME.com.demo.ConnectionDB;


public class RoomService {

    /**
     * Method to get all rooms from the database
     *
     * @return List of rooms from database
     * @throws Exception when trying to connect to database
     */

    public List<Room> getRooms() throws Exception {

        // sql query
        String sql = "SELECT * FROM room";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all rooms retrieved from database
        List<Room> rooms = new ArrayList<>();

        //try to connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();


            // iterate through the result set
            while (rs.next()) {

                //get information of room i in rs
                String hotel_chain_name = rs.getString("hotel_chain_name");
                Integer hotel_humber = rs.getInt("hotel_number");
                String room_number = rs.getString("room_number");
                Integer capacity = rs.getInt("capacity");
                String view_type = rs.getString("view_type");
                boolean is_extendable = rs.getBoolean("is_extendable");
                double price = rs.getDouble("price");

                //create a room with information given
                Room new_room = new Room(hotel_chain_name, hotel_humber, room_number,
                                         capacity, view_type, is_extendable, price);

                //add to list of rooms
                rooms.add(new_room);
            }

            //close the result set
            rs.close();
            // close the statement
            stmt.close();
            con.close();
            db.close();

            // return the rooms retrieved from database
            return rooms;
        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }



    /**
     * Method to return all available rooms
     *
     * @param country the country the customer wants to find available rooms in
     * @param province the province the customer wants to find available rooms in
     * @param city the city the customer wants to find available rooms in
     * @param hotel_chain_name the country the customer wants to find available rooms in
     * @param room_capacity the maximum room capacity the customer wishes their room to have
     * @param upperbound_price the maximum price the customer is willing to pay
     * @param rating rating of the hotel
     * @param total_number_of_rooms the total number of rooms of that hotel
     * @param start_date the date of the first day they would like to book their room
     * @param start_time the time in which their booking will start
     * @param end_date the date of the last day they would like to book their room
     * @param end_time the time in which their booking will end
     * @return a list of all available rooms in the based on the parameters the provide database
     * @throws Exception when trying to connect to database
     */

    public List<Room> getAvailableRooms(String country, String province, String city, String hotel_chain_name, Integer room_capacity,
                                        double upperbound_price, Integer rating, Integer total_number_of_rooms, String start_date,
                                        String start_time, String end_date, String end_time) throws Exception {

        String sql = "SELECT DISTINCT r.* FROM room r " +
                     "NATURAL JOIN hotel h ON r.hotel_number = h.hotel_number AND r.hotel_chain_name = h.hotel_chain_name " +
                     "WHERE h.country = ? AND h.province = ? AND h.city = ? " +
                     "AND r.hotel_chain_name = ? AND r.capacity >= ? AND r.price <= ? " +
                     "AND h.rating >= ? AND h.total_number_of_rooms >= ? " +
                     "AND NOT EXISTS ( " +
                     "  SELECT 1 FROM booking b " +
                     "  WHERE b.hotel_chain_name = r.hotel_chain_name AND b.hotel_number = r.hotel_number AND b.room_number = r.room_number " +
                     "  AND NOT (b.end_date < ? OR (b.end_date = ? AND b.end_time <= ?) " +
                     "           OR b.start_date > ? OR (b.start_date = ? AND b.start_time >= ?))" +
                     ")";

        ConnectionDB db = new ConnectionDB();
        List<Room> available_rooms = new ArrayList<Room>();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            //sets searching parameters
            stmt.setString(1, country);
            stmt.setString(2, province);
            stmt.setString(3, city);
            stmt.setString(4, hotel_chain_name);
            stmt.setInt(5, room_capacity);
            stmt.setDouble(6, upperbound_price);
            stmt.setInt(7, rating);
            stmt.setInt(8, total_number_of_rooms);

            //sets booking overlap filter parameters
            //logic: excludes all bookings that do not end before we arrive or start after we leave
            stmt.setString(9, start_date);
            stmt.setString(10, start_date);
            stmt.setString(11, start_time);
            stmt.setString(12, end_date);
            stmt.setString(13, end_date);
            stmt.setString(14, end_time);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                //get information of room i in rs
                hotel_chain_name = rs.getString("hotel_chain_name");
                Integer hotel_humber = rs.getInt("hotel_number");
                String room_number = rs.getString("room_number");
                Integer capacity = rs.getInt("capacity");
                String view_type = rs.getString("view_type");
                boolean is_extendable = rs.getBoolean("is_extendable");
                double price = rs.getDouble("price");

                //create a room with information given
                Room new_room = new Room(hotel_chain_name, hotel_humber, room_number,
                        capacity, view_type, is_extendable, price);

                //add to list of rooms
                available_rooms.add(new_room);

            }
            rs.close();
            stmt.close();
            con.close();
            db.close();
        }
        return available_rooms;
     }
}
