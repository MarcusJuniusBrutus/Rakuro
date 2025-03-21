SET search_path = "Rakuro"; 

INSERT
INTO
    Hotel_Chain
VALUES(
    'Carlton',
    '934220',
    'El Camino Road',
    'Atascadero',
    'California',
    'USA'
),(
    'Sheraton',
    'L2G3K7',
    'Falls Avenue',
    'Niagara Falls',
    'Ontario',
    'Canada'
),(
    'Hilton',
    'H5Z3K1',
    'Downsview Road',
    'Halifax',
    'Ontario',
    'Canada'
),(
    'Fairmont',
    'A8B6K9',
    'Rue Montcalm',
    'Montreal',
    'Quebec',
    'Canada'
),(
    'Marriott',
    'K1P5R7',
    'Kent Street',
    'Edmonton',
    'Alberta',
    'Canada'
);

INSERT
INTO
    Person(
        SSN,
        first_name,
        middle_name,
        last_name,
        street,
        postal_code,
        city,
        province,
        country
    )
VALUES(
    '123456789',
    'Kunala',
    NULL,
    'Deotare',
    '45 Mann Avenue',
    'K1N6Y7',
    'Ottawa',
    'Ontario',
    'Canada'
),(
    '111111111',
    'Veronica',
    NULL,
    'Nartatez',
    '123 Amazing Avenue',
    'M1T7P2',
    'Ottawa',
    'Ontario',
    'Canada'
),(
    '222222222',
    'Rachel',
    NULL,
    'Luo',
    '45 Mann Avenue',
    'K1N6Y7',
    'Ottawa',
    'Ontario',
    'Canada'
),(
    '333333333',
    'Tom',
    'Bob',
    'Timmy',
    '12 Rain Crescent',
    'T1P3Q4',
    'Toronto',
    'Ontario',
    'Canada'
),(
    '563891123',
    'John',
    'Davidson',
    'James',
    '27 Keyline Avenue',
    'K9J0K8',
    'Vancouver',
    'British Columbia',
    'Canada'
),(
    '529172937',
    'Kamala',
    NULL,
    'Bavington',
    '11 Housebringer Road',
    'N7V9G7',
    'Paris',
    'Ile-de-France',
    'France'
),(
    '752946877',
    'Ramesh',
    'Gill',
    'Koraveli',
    '9800 Hamburg Place',
    'J8B6C1',
    'London',
    'Ontario',
    'Canada'
),(
    '747382013',
    'Belle',
    NULL,
    'Phalphinios',
    '10 Luxembourg Court',
    'M8B1S3',
    'Halifax',
    'Ontario',
    'Canada'
),(
    '572966393',
    'Lily',
    NULL,
    'Sam',
    '12 Happy Street',
    'H1L0M9',
    'Prank',
    'Texas',
    'USA'
),(
    '465970687',
    'Paul',
    'Joshua',
    'Bonny',
    '45 Hello There',
    'L0L1T2',
    'Paris',
    'Jillian',
    'France'
),(
    '234705729',
    'Harry',
    'Walker',
    'Li',
    '78 Nice Good',
    'M1Q5V6',
    'Hill',
    'Ohio',
    'USA'
),(
    '900264923',
    'Samuel',
    'Alexander',
    'Till',
    '11 Happy Street',
    'Z2X3C4',
    'Bengaluru',
    'CoolPlace',
    'India'
),(
    '572425499',
    'Bob',
    'Johnathon',
    'Ross',
    '12 Rainy Street',
    'G6H7D2',
    'Water',
    'Florida',
    'USA'
),(
    '999556643',
    'Ada',
    NULL,
    'Wong',
    '55 Cloudy Street',
    'B3N1H1',
    'Berlin',
    'Poll',
    'Germany'
),(
    '365884377',
    'Angelica',
    'Angel',
    'Wells',
    '22 Bright Avenue',
    'J1K2M2',
    'Nice',
    'Sky',
    'Africa'
),(
    '927728190',
    'Katherine',
    'Alexander',
    'Till',
    '12 Happy Street',
    'Z2X3C4',
    'Bengaluru',
    'CoolPlace',
    'India'
);

INSERT
INTO
    Person
VALUES(
    '385647382',
    'Ashley',
    'Daisy',
    'Williams',
    '52 Smile Street',
    'M4N2Y9',
    'Grass',
    'Idaho',
    'USA'
),(
    '284626355',
    'Leon',
    NULL,
    'Kennedy',
    '45 Wow Avenue',
    'L0T1T2',
    'Racoon City',
    'ResidentE',
    'USA'
),(
    '999473677',
    'Pikachu',
    'Electric',
    'Raichu',
    '78 Brook Street',
    'M1A5V6',
    'Kanto',
    'Ohio',
    'USA'
),(
    '999223544',
    'Snorlax',
    NULL,
    'Munchlax',
    '11 Sleepy Street',
    'Z2Z3C4',
    'Unova',
    'NicePlace',
    'India'
),(
    '566365732',
    'Vaporean',
    'Sylveon',
    'Eevee',
    '12 Rainbow Street',
    'G6G7D2',
    'Water',
    'Florida',
    'USA'
),(
    '757676788',
    'Ditto',
    NULL,
    'Purple',
    '55 Transform Street',
    'B3X1H1',
    'Hoenn',
    'Pokemon',
    'Germany'
),(
    '959668695',
    'Charmander',
    'Charmeleon',
    'Charizard',
    '22 Fire Avenue',
    'J1P2M2',
    'Galar',
    'Flames',
    'Africa'
),(
    '686787978',
    'Psyduck',
    'Headache',
    'Golduck',
    '12 Splash Street',
    'Z2Z3C4',
    'Galar',
    'Flames',
    'Africa'
);

INSERT
INTO
    Hotel
VALUES(
    'Hilton',
    1,
    'N5Z8B8',
    'Saint Edward Road',
    'Ottawa',
    'Ontario', 
    'Canada',
    3,
    '123456789'
),(
    'Hilton',
    2,
    'H7N9S3',
    'Downtown Boulevard',
    'Ottawa',
    'Ontario', 
    'Canada',
    2,
    '111111111'
),(
    'Hilton',
    3,
    'M8X6D1',
    'Avenue Joseph de Lusignan',
    'Quebec City',
    'Quebec', 
    'Canada',
    4,
    '222222222'
),(
    'Hilton',
    4,
    'B9C3V7',
    'Westchestershire Drive',
    'Chicago',
    'Illinois', 
    'Canada',
    3,
    '333333333'
),(
    'Hilton',
    5,
    'H7V9S1',
    'Columbia Avenue',
    'Vancouver',
    'British Columbia', 
    'Canada',
    4,
    '563891123'
),(
    'Hilton',
    6,
    'B8B2Z8',
    '7 Ghosted Road',
    'Chicago',
    'Illinois', 
    'USA',
    3,
    '529172937'
),(
    'Hilton',
    7,
    'N8W9Q7',
    '89 Narvik Road',
    'Iqaluit',
    'Nunavut', 
    'Canada',
    1,
    '752946877'
),(
    'Hilton',
    8,
    'A7G0J6',
    'Johnston Crescent',
    'Calgary',
    'Alberta', 
    'Canada',
    2,
    '747382013'
),(
    'Carlton',
    1,
    'Q1W2E3',
    '12 Great Street',
    'Prank',
    'Texas',
    'USA',
    2,
    '572966393'
),(
    'Carlton',
    2,
    'V1B7N7',
    '12 Perfect Street',
    'Paris',
    'Jillian',
    'France',
    4,
    '465970687'
),(
    'Carlton',
    3,
    'A1A2W2',
    '12 Bad Street',
    'Hill',
    'Ohio',
    'USA',
    1,
    '234705729'
),(
    'Carlton',
    4,
    'B1B3Q3',
    '12 Incredible Street',
    'Bengaluru',
    'CoolPlace',
    'India',
    3,
    '900264923'
),(
    'Carlton',
    5,
    'C1C2B2',
    '12 Why Street',
    'Water',
    'Florida',
    'USA',
    2,
    '572425499'
),(
    'Carlton',
    6,
    'D9D8L8',
    '12 Wow Street',
    'Berlin',
    'Poll',
    'Germany',
    4,
    '999556643'
),(
    'Carlton',
    7,
    'E3E7Y7',
    '12 Grey Street',
    'Nice',
    'Sky',
    'Africa',
    3,
    '365884377'
),(
    'Carlton',
    8,
    'E3E7Y7',
    '72 Pink Street',
    'Nice',
    'Sky',
    'Africa',
    4,
    '927728190'
),(
    'Marriott',
    1,
    'M4N2Z9',
    '51 Happy Street',
    'Grass',
    'Idaho',
    'USA',
    3,
    '385647382'
),(
    'Marriott',
    2,
    'L0T1Z2',
    '48 Amazed Avenue',
    'Racoon City',
    'ResidentE',
    'USA',
    2,
    '284626355'
),(
    'Marriott',
    3,
    'M1A5X6',
    '70 Daisy Street',
    'Kanto',
    'Ohio',
    'USA',
    4,
    '999473677'
),(
    'Marriott',
    4,
    'Z2Z3D4',
    '15 Sleep Street',
    'Unova',
    'NicePlace',
    'India',
    3,
    '999223544'
),(
    'Marriott',
    5,
    'G6G7A2',
    '15 Colourful Street',
    'Water',
    'Florida',
    'USA',
    4,
    '566365732'
),(
    'Marriott',
    6,
    'B3X1P1',
    '58 Change Street',
    'Hoenn',
    'Pokemon',
    'Germany',
    3,
    '757676788'
),(
    'Marriott',
    7,
    'J1P2L2',
    '20 Hot Avenue',
    'Galar',
    'Flames',
    'Africa',
    1,
    '959668695'
),(
    'Marriott',
    8,
    'Z2Z3P4',
    '10 Pond Street',
    'Galar',
    'Flames',
    'Africa',
    2,
    '686787978'
);

