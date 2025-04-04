package PACKAGE_NAME.com.demo;

import java.sql.Date;
import java.sql.Time;



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


}
