package PACKAGE_NAME.com.demo;


/**
 * Room class to save room info
 */
public class Room {
    private String hotel_chain_name;
    private Integer hotel_number;
    private String room_number;
    private Integer capacity;
    private String view_type;
    private boolean is_extendable;
    private double price;

    /**
     * Constructor to create Room object with hotel_chain_name, hotel_number, room_number, capacity, view_type, is_extendable, price
     *
     * @param hotel_chain_name name of the hotel chain that room is for
     * @param hotel_number number of the hotel of the hotel chain that room is for
     * @param room_number number of the room of the hotel
     * @param capacity number that indicates the capacity of the room
     * @param view_type describes the view of the room
     * @param is_extendable boolean that indicates if the room can be extended
     * @param price the price of the room
     *
     */
    public Room(String hotel_chain_name, Integer hotel_number, String room_number, Integer capacity, String view_type, boolean is_extendable, double price) {
        this.hotel_chain_name = hotel_chain_name;
        this.hotel_number = hotel_number;
        this.room_number = room_number;
        this.capacity = capacity;
        this.view_type = view_type;
        this.is_extendable = is_extendable;
        this.price = price;
    }

    /* Getters */
    public String getHotelChainName() { return this.hotel_chain_name; }
    public Integer getHotelNumber() { return this.hotel_number; }
    public String getRoomNumber() { return this.room_number; }
    public Integer getCapacity() { return this.capacity; }
    public String getViewType() { return this.view_type; }
    public boolean getIsExtendable() { return this.is_extendable; }
    public double getPrice() { return this.price; }

    /* Setters */
    public void setHotelChainName(String hotel_chain_name) { this.hotel_chain_name = hotel_chain_name; }
    public void setHotelNumber(Integer hotel_number) { this.hotel_number = hotel_number; }
    public void setRoomNumber(String room_number) { this.room_number = room_number; }
    public void setCapacity (Integer capacity) { this.capacity = capacity; }
    public void setViewType(String view_type) { this.view_type = view_type; }
    public void setIsExtendable(boolean is_extendable) { this.is_extendable = is_extendable; }
    public void setPrice(double price) { this.price = price; } 

    @Override
    public String toString() {
        return "<ul>" 
                + "<li>hotel_chain_name= " + hotel_chain_name + "</li>"
                + "<li>hotel_number= " + hotel_number + "</li>"
                + "<li>room_number= " + room_number + "</li>"
                + "<li>capacity= " + capacity + "</li>"
                + "<li>view_type= " + view_type + "</li>"
                + "<li>is_extendable= " + is_extendable + "</li>"
                + "<li>price= " + price + "</li>";
    }


}
