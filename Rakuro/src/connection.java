import java.sql.*;

public class connection {
    public static void main(String[] args) throws SQLException {
        Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Rakuro", "postgres", "Newdelhi.8194!");
        Statement st = db.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM Department");
        while (rs.next()) {
            System.out.print("Column 1 returned: ");
            System.out.println(rs.getString(1));
        }
    }
