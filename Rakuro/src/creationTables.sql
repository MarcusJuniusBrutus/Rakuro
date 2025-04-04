SET search_path = "Rakuro"; 

CREATE TABLE Person(
    SSN CHAR(9) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    last_name VARCHAR(20) NOT NULL,
    street VARCHAR(50) NOT NULL,
    postal_code CHAR(6) NOT NULL,
    city VARCHAR(20) NOT NULL,
    province VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL,
    PRIMARY KEY(SSN)
);

CREATE TABLE Hotel_Chain(
    hotel_chain_name VARCHAR(20) NOT NULL,
    postal_code CHAR(6) NOT NULL,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    province VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL,
    PRIMARY KEY(hotel_chain_name)
);

CREATE TABLE Hotel_Chain_Emails(
    hotel_chain_name VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    PRIMARY KEY(hotel_chain_name, email),
    FOREIGN KEY(hotel_chain_name)
        REFERENCES Hotel_Chain(hotel_chain_name)
        ON DELETE CASCADE
);

CREATE TABLE Hotel_Chain_Phone_Numbers(
    hotel_chain_name VARCHAR(20) NOT NULL,
    number CHAR(10) NOT NULL,
    PRIMARY KEY(hotel_chain_name, number),
    FOREIGN KEY(hotel_chain_name)
        REFERENCES Hotel_Chain(hotel_chain_name)
        ON DELETE CASCADE
);

CREATE TABLE Hotel(
    hotel_chain_name VARCHAR(20) NOT NULL,
    hotel_number INT NOT NULL,
    postal_code CHAR(6) NOT NULL,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    province VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL,
    rating INT NOT NULL,
    manager_SSN CHAR(9) NOT NULL,
    PRIMARY KEY(hotel_chain_name, hotel_number),
    FOREIGN KEY(hotel_chain_name)
        REFERENCES Hotel_Chain(hotel_chain_name)
        ON DELETE CASCADE,
    FOREIGN KEY(manager_SSN)
        REFERENCES Person(SSN)
        ON DELETE CASCADE

);


CREATE TABLE Hotel_Emails (
    hotel_chain_name VARCHAR(100) NOT NULL,
    hotel_number INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    PRIMARY KEY (hotel_chain_name, hotel_number, email),
    FOREIGN KEY (hotel_chain_name, hotel_number) 
        REFERENCES Hotel(hotel_chain_name, hotel_number)
        ON DELETE CASCADE
);

CREATE TABLE Hotel_Phone_Numbers (
    hotel_chain_name VARCHAR(100) NOT NULL,
    hotel_number INT NOT NULL,
    number VARCHAR(20) NOT NULL,
    PRIMARY KEY (hotel_chain_name, hotel_number, number),
    FOREIGN KEY (hotel_chain_name, hotel_number) 
        REFERENCES Hotel(hotel_chain_name, hotel_number)
        ON DELETE CASCADE
);



CREATE TABLE Archived_Booking(
    archive_id SERIAL PRIMARY KEY,
    booking_number VARCHAR(50) NOT NULL,
    SSN VARCHAR(20) NOT NULL,
    room_number VARCHAR(5) NOT NULL,
    was_paid_for BOOLEAN DEFAULT FALSE,
    date DATE NOT NULL,
    time TIME NOT NULL,
    hotel_chain_name VARCHAR(20) NOT NULL,
    street VARCHAR(50) NOT NULL,
    postal_code VARCHAR(6) NOT NULL,
    city VARCHAR(20) NOT NULL,
    province VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20) NULL,
    last_name VARCHAR(20) NOT NULL,
    status VARCHAR(10) NOT NULL
);
CREATE TABLE Customer(
    SSN CHAR(9) NOT NULL,
    PRIMARY KEY(SSN),
    FOREIGN KEY(SSN)
        REFERENCES Person(SSN)
        ON DELETE CASCADE
);

CREATE TABLE Employee(
    SSN CHAR(9) NOT NULL,
    hotel_chain_name VARCHAR(20) NOT NULL,
    hotel_number INTEGER NOT NULL,
    PRIMARY KEY(SSN),
    FOREIGN KEY(SSN)
        REFERENCES Person(SSN)
        ON DELETE CASCADE,
    FOREIGN KEY(hotel_chain_name, hotel_number)
        REFERENCES Hotel(hotel_chain_name, hotel_number)
);

CREATE TABLE Employee_Roles(
    SSN CHAR(9) NOT NULL,
    role VARCHAR(20) NOT NULL,
    PRIMARY KEY(SSN, role),
    FOREIGN KEY(SSN)
        REFERENCES Employee(SSN)
        ON DELETE CASCADE
);


CREATE TABLE Room(
    hotel_chain_name VARCHAR(20) NOT NULL,
    hotel_number INTEGER NOT NULL,
    room_number VARCHAR(5) NOT NULL,
    capacity INTEGER NOT NULL,
    view_type VARCHAR(20) NOT NULL,
    is_extendible BOOLEAN NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(
        hotel_chain_name,
        hotel_number,
        room_number
    ),
    FOREIGN KEY(hotel_chain_name, hotel_number)
        REFERENCES Hotel(hotel_chain_name, hotel_number)
        ON DELETE CASCADE
);


CREATE TABLE Room_Amenities(
    hotel_chain_name VARCHAR(20) NOT NULL,
    hotel_number INTEGER NOT NULL,
    room_number VARCHAR(5) NOT NULL,
    amenity VARCHAR(20) NOT NULL,
    PRIMARY KEY(
        hotel_chain_name,
        hotel_number,
        room_number,
        amenity
    ),
    FOREIGN KEY(
        hotel_chain_name,
        hotel_number,
        room_number
    ) REFERENCES Room(
        hotel_chain_name,
        hotel_number,
        room_number
    )
    ON DELETE CASCADE
);


CREATE TABLE Room_Problems_Damages(
    hotel_chain_name VARCHAR(20) NOT NULL,
    hotel_number INTEGER NOT NULL,
    room_number VARCHAR(5) NOT NULL,
    problem_damages VARCHAR(20) NOT NULL,
    PRIMARY KEY(
        hotel_chain_name,
        hotel_number,
        room_number,
        problem_damages
    ),
    FOREIGN KEY(
        hotel_chain_name,
        hotel_number,
        room_number
    ) REFERENCES Room(
        hotel_chain_name,
        hotel_number,
        room_number
    )
    ON DELETE CASCADE
);

CREATE TABLE Booking(
    SSN CHAR(9) NOT NULL,
    hotel_chain_name VARCHAR(20) NOT NULL,
    hotel_number INTEGER NOT NULL,
    room_number VARCHAR(5) NOT NULL,
    is_paid_for BOOLEAN NOT NULL,
    booking_number VARCHAR(20) NOT NULL,
    start_time TIME NOT NULL,
    start_date DATE NOT NULL,
    end_time TIME NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    PRIMARY KEY(booking_number),
    FOREIGN KEY(SSN)
        REFERENCES Customer(SSN)
        ON DELETE CASCADE,
    FOREIGN KEY(
        hotel_chain_name,
        hotel_number,
        room_number
    ) REFERENCES Room(
        hotel_chain_name,
        hotel_number,
        room_number
    )
    ON DELETE CASCADE
);
