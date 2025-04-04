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
}
