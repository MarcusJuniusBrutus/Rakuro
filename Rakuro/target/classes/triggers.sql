-- FINAL ACTUALLY WORKING
SET search_path = 'Rakuro2.0'; --change name to the path you have

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









--SET search_path = "Rakuro2.0"; --change name to the path you have
--
--CREATE FUNCTION CHECK_ROOM_AVAILABLE () RETURNS TRIGGER LANGUAGE 'plpgsql' AS $$ --creates function that checks room avalibiltiy and returns trigger
--declare NUMBER_ROOMS_CONFLICT INT; -- Declare a variable to store the count for it to work
--begin
--    SELECT COUNT(*) INTO NUMBER_ROOMS_CONFLICT FROM booking WHERE NEW.room_number = room_number --counts number of bookings that overlap with booking we want to insert
--       AND (START_DATE || ' ' || START_TIME)::TIMESTAMP < (NEW.END_DATE || ' ' || NEW.END_TIME)::TIMESTAMP
--       AND (END_DATE || ' ' || END_TIME)::TIMESTAMP > (NEW.START_DATE || ' ' || NEW.START_TIME)::TIMESTAMP;
--
--       IF NUMBER_ROOMS_CONFLICT > 0 THEN --there is at least one conflict
--	   raise exception 'Sorry, this room is not available for the selected times'; --send message saying booking cannot be created
--	   return null; --insertion will not take place
--     END IF;
--	 return new; --insertion will take place due to no conflicts
--end;
--$$; --function ends here
--
--
--CREATE TRIGGER check_availability_room --create trigger to check avaliable rooms before inserting a new booking
--BEFORE INSERT ON booking
--FOR EACH ROW
--EXECUTE PROCEDURE CHECK_ROOM_AVAILABLE (); --run function for each row to check that there are rooms available
--
--INSERT INTO Person VALUES
--('56385748', 'Zayne', 'Null', 'Snow', '123 Asko', 'L1Q2QA', 'Linkon City', 'Woah Prov', 'Woah Country'),
--('56385749', 'Ayne', 'Null', 'Snowy', '123 Aski', 'L1Q2QB', 'Linkon City', 'Woah Prov', 'Woah Country'),
--('56385779', 'Vanny', 'Null', 'Joke', '123 Funny Street', 'K1P2QB', 'Laugh City', 'Smile Prov', 'Happy Country');
--
--INSERT INTO Customer VALUES ('56385748'), ('56385749'), ('56385779');
--
--INSERT INTO Booking VALUES
--('56385748', 'Carlton', 1, '123A', true, 0, '12:15', '2025-04-17', '17:15', '2025-04-19', 'pending'), --should work since first one so no conflicts
--('56385749', 'Carlton', 1, '123A', true, 0, '13:00', '2025-04-17', '20:15', '2025-04-19', 'pending'), -- shouldn't work due to trigger
--('56385779', 'Carlton', 1, '123A', true, 0, '12:15', '2025-04-20', '7:15', '2025-04-24', 'pending'); --should work since no conflicts
--
----Drop triggers and function
--DROP FUNCTION IF EXISTS CHECK_ROOM_AVAILABLE ();
--DROP TRIGGER IF EXISTS check_availability_room ON booking;








--SET search_path = "Rakuro2.0"; --change name to the path you have
--
--CREATE FUNCTION CHECK_ROOM_AVAILABLE () RETURNS TRIGGER LANGUAGE 'plpgsql' AS $$ --creates function that checks room avalibiltiy and returns trigger
--declare --i did not declare any variables here since i didn't need to
--begin
--    SELECT COUNT(*) AS NUMBER_ROOMS_CONFLICT FROM booking WHERE NEW.room_id = room_id --counts number of bookings that overlap with booking we want to insert
--       AND (START_DATE || ' ' || START_TIME)::TIMESTAMP < (NEW.END_DATE || ' ' || NEW.END_TIME)::TIMESTAMP
--       AND (END_DATE || ' ' || END_TIME)::TIMESTAMP > (NEW.START_DATE || ' ' || NEW.START_TIME)::TIMESTAMP;
--
--       IF NUMBER_ROOMS_CONFLICT > 0 THEN --there is at least one conflict
--	   raise exception 'Sorry, this room is not available for the selected times'; --send message saying booking cannot be created
--	   return null; --insertion will not take place
--     END IF;
--	 return new; --insertion will take place due to no conflicts
--end;
--$$; --function ends here
--
--
--CREATE TRIGGER check_availability_room --create trigger to check avaliable rooms before inserting a new booking
--BEFORE INSERT ON booking
--FOR EACH ROW
--EXECUTE PROCEDURE CHECK_ROOM_AVAILABLE (); --run function for each row to check that there are rooms available
--
--
----Drop triggers and function
--DROP FUNCTION IF EXISTS CHECK_ROOM_AVAILABLE ();
--DROP TRIGGER IF EXISTS check_availability_room ON booking;










--SET search_path = "Rakuro2.0";
--
--CREATE FUNCTION CHECK_ROOM_AVAILABLE () RETURNS TRIGGER LANGUAGE 'plpgsql' AS $$
--declare
--begin
--    SELECT COUNT(*) AS NUMBER_ROOMS_AVAILABLE FROM booking WHERE NEW.room_id = room_id
--       AND (START_DATE || ' ' || START_TIME)::TIMESTAMP < (NEW.END_DATE || ' ' || NEW.END_TIME)::TIMESTAMP
--       AND (END_DATE || ' ' || END_TIME)::TIMESTAMP > (NEW.START_DATE || ' ' || NEW.START_TIME)::TIMESTAMP;
--
--       IF NUMBER_ROOMS_AVAILABLE > 0 THEN
--
--    raise exception 'Sorry, this room is not available for the selected times';
--    return null;
--     END IF;
--	 return new;
--end;
--$$;
--
--
--CREATE TRIGGER check_availability_room
--BEFORE INSERT ON booking
--FOR EACH ROW
--EXECUTE PROCEDURE CHECK_ROOM_AVAILABLE ();
--
--
--DROP FUNCTION CHECK_ROOM_AVAILABLE ();
--DROP TRIGGER IF EXISTS check_availability_room ON booking;












--CREATE FUNCTION CHECK_ROOM_AVAILABLE () RETURNS TRIGGER LANGUAGE 'plpgsql' AS $$
--declare
--begin
--    SELECT COUNT(*) AS NUMBER_ROOMS_AVAILABLE FROM Bookings WHERE NEW.room_id = room_id
--       AND (START_DATE || ' ' || START_TIME)::TIMESTAMP < (NEW.END_DATE || ' ' || NEW.END_TIME)::TIMESTAMP
--       AND (END_DATE || ' ' || END_TIME)::TIMESTAMP > (NEW.START_DATE || ' ' || NEW.START_TIME)::TIMESTAMP;
--
--       IF NUMBER_ROOMS_AVAILABLE > 0 THEN
--
--    raise exception 'Sorry, this room is not available for the selected times';
--    return null;
--     END IF;
--end;
--$$;
--
--DROP FUNCTION CHECK_ROOM_AVAILABLE ();
--
--CREATE TRIGGER check_availability_room
--BEFORE INSERT ON Booking
--EXECUTE PROCEDURE CHECK_ROOM_AVAILABLE ();
--
--DROP TRIGGER check_availability_room ON Booking;







--CREATE FUNCTION CHECK_ROOM_AVAILABLE () RETURNS TRIGGER LANGUAGE 'plpgsql' AS $$
--declare
--begin
--    SELECT COUNT(*) AS NUMBER_ROOMS_AVAILABLE FROM Bookings WHERE NEW.room_id = room_id
--       AND (START_DATE || ' ' || START_TIME)::TIMESTAMP < (NEW.END_DATE || ' ' || NEW.END_TIME)::TIMESTAMP
--       AND (END_DATE || ' ' || END_TIME)::TIMESTAMP > (NEW.START_DATE || ' ' || NEW.START_TIME)::TIMESTAMP;
--
--       IF NUMBER_ROOMS_AVAILABLE > 0 THEN
--
--    raise exception 'Sorry, this room is not available for the selected times';
--    return null;
--     END IF;
--end;
--$$;
--
--DROP FUNCTION CHECK_ROOM_AVAILABLE ();
--
--CREATE TRIGGER check_availability_room
--BEFORE INSERT ON Bookings
--EXECUTE PROCEDURE CHECK_ROOM_AVAILABLE ();
--
--DROP TRIGGER check_availability_room ON Bookings;







--
--CREATE TRIGGER check_availability_room
--BEFORE INSERT ON Bookings
--FOR EACH ROW
--BEGIN
--   SELECT COUNT(*) AS NUMBER_ROOMS_AVAILABLE FROM Bookings WHERE NEW.room_id = room_id
--   AND check_in_date < NEW.check_out_date
--   AND check_out_date > NEW.check_in_date;
--
--   IF NUMBER_ROOMS_AVAILABLE > 0 THEN
--   SIGNAL SQLSTATE '45000'
--        set MESSAGE_TEXT='Sorry, this room is not available for the selected times';
--   END IF;
--END;