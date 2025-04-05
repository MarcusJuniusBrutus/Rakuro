package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


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
     * @param country               the country the customer wants to find available rooms in
     * @param province              the province the customer wants to find available rooms in
     * @param city                  the city the customer wants to find available rooms in
     * @param hotel_chain_name      the country the customer wants to find available rooms in
     * @param room_capacity         the maximum room capacity the customer wishes their room to have
     * @param upperbound_price      the maximum price the customer is willing to pay
     * @param rating                rating of the hotel
     * @param total_number_of_rooms the total number of rooms of that hotel
     * @param start_date            the date of the first day they would like to book their room
     * @param start_time            the time in which their booking will start
     * @param end_date              the date of the last day they would like to book their room
     * @param end_time              the time in which their booking will end
     * @return a list of all available rooms in the based on the parameters the provide database
     * @throws Exception when trying to connect to database
     */

    public List<Room> getAvailableRooms(String country, String province, String city, String hotel_chain_name, String room_capacity,
                                        String upperbound_price, String rating, String total_number_of_rooms, String start_date,
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

        //connect to db
        ConnectionDB db = new ConnectionDB();

        //list that is going to store all the available rooms
        List<Room> available_rooms = new ArrayList<Room>();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            //sets searching parameters
            stmt.setString(1, country);
            stmt.setString(2, province);
            stmt.setString(3, city);
            stmt.setString(4, hotel_chain_name);
            stmt.setString(5, room_capacity);
            stmt.setString(6, upperbound_price);
            stmt.setString(7, rating);
            stmt.setString(8, total_number_of_rooms);

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

    /**
     * Adds a report of any problems or damages of a specific room and saves it in the db
     *
     * @param hotel_chain_name hotel chain name of specified hotel
     * @param hotel_number hotel number of specified hotel
     * @param room_number the room number the problems/damages occured
     * @param problem_damages the description of the problem/damages in the room specified
     * @throws Exception when trying to connect to database
     */

    public void createRoomDamagesReport(String hotel_chain_name, String hotel_number, String room_number, String problem_damages) throws Exception{

        String sql = "INSERT INTO Room_Problems_Damages (hotel_chain_name, hotel_number, room_number, problem_damages) " +
                     "VALUES (?, ?, ?,?)";

        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, hotel_chain_name);
            stmt.setString(2, hotel_number);
            stmt.setString(3, room_number);
            stmt.setString(4, problem_damages);

            stmt.executeUpdate();
        }
        db.close();
    }

    public static void main(String[] args) {
        try {
            RoomService service = new RoomService();

            // Test getRooms
            List<Room> allRooms = service.getRooms();
            System.out.println("All Rooms:");
            for (Room room : allRooms) {
                System.out.println(room);
            }

            // Test getAvailableRooms (replace these values with actual valid data)
            List<Room> availableRooms = service.getAvailableRooms(
                    "Canada",          // country
                    "Ontario",         // province
                    "Toronto",         // city
                    "Marriott",        // hotel_chain_name
                    "2",               // room_capacity
                    "300",             // upperbound_price
                    "4",               // rating
                    "100",             // total_number_of_rooms
                    "2025-04-10",      // start_date
                    "14:00:00",        // start_time
                    "2025-04-15",      // end_date
                    "11:00:00"         // end_time
            );

            System.out.println("\nAvailable Rooms:");
            for (Room room : availableRooms) {
                System.out.println(room);
            }

            // Test damage report (optional)
            service.createRoomDamagesReport("Marriott", "1", "101", "TV not working");

            System.out.println("\nDamage report added successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
