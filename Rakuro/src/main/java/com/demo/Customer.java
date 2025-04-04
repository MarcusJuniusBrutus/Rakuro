package main.java.com.demo;
import PACKAGE_NAME.com.demo.ConnectionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 * Customer class to save customer info
 */
public class Customer {
    private String SSN;


    /**
     * Constructor to create Customer object with SSN
     *
     * @param SSN SSN of customer
     *
     */
    public Customer(String SSN) {
        this.SSN = SSN;
    }

    /* Getters */
    public String getSSN() { return this.SSN; }

    /* Setters */
    public void setSSN(String SSN) { this.SSN = SSN; }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>SSN= " + SSN + "</li>";
    }

    /**
     * Method that takes the  and adds them to the db
     *
     * @param SSN SSN of the person
     * @param first_name first name of Person object
     * @param middle_name middle name of Person object
     * @param last_name last name of the Person object
     * @param street street address of the Person object
     * @param city city the Person object lives in
     * @param postal_code postal code of Person object
     * @param province province the Person object lives in
     * @param country country the Person object lives in
     *
     */
    public void createPerson(String SSN, String first_name, String middle_name, String last_name,
                             String street, String city, String postal_code, String province, String country) throws Exception {

        String sql = "INSERT INTO Person (SSN, first_name, middle_name, last_name, street, postal_code, city, province, country) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1,SSN);
            stmt.setString(2,first_name);
            stmt.setString(3,middle_name);
            stmt.setString(4,last_name);
            stmt.setString(5,street);
            stmt.setString(6,postal_code);
            stmt.setString(7,city);
            stmt.setString(8,province);
            stmt.setString(9,country);

            int rows_affected = stmt.executeUpdate();

            //check if operation was successful
            if (rows_affected > 0) {
                System.out.println("Customer successfully registered!");

            } else {
                System.out.println("Failed to register customer.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
