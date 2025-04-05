-- FINAL ACTUALLY WORKING
SET search_path = 'Rakuro'; --change name to the path you have

CREATE FUNCTION CHECK_ROOM_AVAILABLE () RETURNS TRIGGER LANGUAGE 'plpgsql' AS $$ --creates function that checks room avalibiltiy and returns trigger
declare NUMBER_ROOMS_CONFLICT INT; -- Declare a variable to store the count for it to work
begin
    SELECT COUNT(*) INTO NUMBER_ROOMS_CONFLICT FROM booking WHERE NEW.room_number = room_number --counts number of bookings that overlap with booking we want to insert
       AND (START_DATE || ' ' || START_TIME)::TIMESTAMP < (NEW.END_DATE || ' ' || NEW.END_TIME)::TIMESTAMP
       AND (END_DATE || ' ' || END_TIME)::TIMESTAMP > (NEW.START_DATE || ' ' || NEW.START_TIME)::TIMESTAMP;

       IF NUMBER_ROOMS_CONFLICT > 0 THEN --there is at least one conflict
	   raise exception 'Sorry, this room is not available for the selected times'; --send message saying booking cannot be created
	   return null; --insertion will not take place
     END IF;
	 return new; --insertion will take place due to no conflicts
end;
$$; --function ends here


CREATE TRIGGER check_availability_room --create trigger to check avaliable rooms before inserting a new booking
BEFORE INSERT ON booking
FOR EACH ROW
EXECUTE PROCEDURE CHECK_ROOM_AVAILABLE (); --run function for each row to check that there are rooms available

INSERT INTO Person VALUES
('56385748', 'Zayne', 'Null', 'Snow', '123 Asko', 'L1Q2QA', 'Linkon City', 'Woah Prov', 'Woah Country'),
('56385749', 'Ayne', 'Null', 'Snowy', '123 Aski', 'L1Q2QB', 'Linkon City', 'Woah Prov', 'Woah Country'),
('56385779', 'Vanny', 'Null', 'Joke', '123 Funny Street', 'K1P2QB', 'Laugh City', 'Smile Prov', 'Happy Country');

INSERT INTO Customer VALUES ('56385748'), ('56385749'), ('56385779');

INSERT INTO Booking VALUES
-- ('56385748', 'Carlton', 1, '123A', true, 0, '12:15', '2025-04-17', '17:15', '2025-04-19', 'pending'); --should work since first one so no conflicts
-- ('56385749', 'Carlton', 1, '123A', true, 0, '13:00', '2025-04-17', '20:15', '2025-04-19', 'pending'); -- shouldn't work due to trigger
('56385779', 'Carlton', 1, '123A', true, 0, '12:15', '2025-04-20', '7:15', '2025-04-24', 'pending'); --should work since no conflicts

--Drop triggers and function
-- DROP FUNCTION CHECK_ROOM_AVAILABLE ();
-- DROP TRIGGER IF EXISTS check_availability_room ON booking;




-- Trigger #2:
SET search_path = 'Rakuro'; --change name to the path you have

CREATE OR REPLACE FUNCTION ADD_ARCHIVED () RETURNS TRIGGER LANGUAGE 'plpgsql' AS $$ --creates function that adds archives and returns trigger
declare  --no variables declared
begin
-- add entry to archived booking table
    INSERT INTO Archived_Booking (
    booking_number,
    SSN,
    room_number,
    was_paid_for,
    start_time,
    start_date,
    end_time,
    end_date,
    hotel_chain_name,
    street,
    postal_code,
    city,
    province,
    country,
    first_name,
    middle_name,
    last_name,
    status
)
SELECT
    b.booking_number,
    b.SSN,
    b.room_number,
    b.is_paid_for,
    b.start_time,
    b.start_date,
    b.end_time,
    b.end_date,
    b.hotel_chain_name,
    h.street,
    h.postal_code,
    h.city,
    h.province,
    h.country,
    p.first_name,
    p.middle_name,
    p.last_name,
    b.status
FROM Booking b
JOIN Hotel h
    ON b.hotel_chain_name = h.hotel_chain_name
   AND b.hotel_number = h.hotel_number
JOIN Person p
    ON b.SSN = p.SSN;

        RETURN NEW;
end;
$$; --function ends here


CREATE OR REPLACE TRIGGER add_to_archived --create trigger to add to archived booking after inserting a new booking
AFTER INSERT ON booking
FOR EACH ROW
EXECUTE PROCEDURE ADD_ARCHIVED (); --run function for each row to check that there are rooms available