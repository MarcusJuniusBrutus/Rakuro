//package PACKAGE_NAME.com.demo;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
//public class RoomService {
//
//    /**
//     * Method to get all rooms from the database
//     *
//     * @return List of rooms from database
//     * @throws Exception when trying to connect to database
//     */
//    public List<Room> getRooms() throws Exception {
//
//        // sql query
//        String sql = "SELECT * FROM room";
//        // database connection object
//        ConnectionDB db = new ConnectionDB();
//
//        // data structure to keep all grades retrieved from database
//        List<Room> rooms = new ArrayList<>();
//
//        // try connect to database, catch any exceptions
//        try (Connection con = db.getConnection()) {
//            // prepare the statement
//            PreparedStatement stmt = con.prepareStatement(sql);
//
//            // get the results from executing the query
//            ResultSet rs = stmt.executeQuery();
//
//
//            // iterate through the result set
//            while (rs.next()) {
//                // create new room object
//                //Room room = new Room(//TODO!);
//
//                // append room in rooms list
////                rooms.add(room); //TODO
//            }
//
//            //close the result set
//            rs.close();
//            // close the statement
//            stmt.close();
//            con.close();
//            db.close();
//
//            // return the grades retrieved from database
//            return rooms;
//        } catch (Exception e) {
//            // throw any errors occurred
//            throw new Exception(e.getMessage());
//        }
//    }
//
//
//}
