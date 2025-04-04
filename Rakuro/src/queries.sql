--Find the average rating of each hotel chain.
SELECT
	HOTEL_CHAIN_NAME,
	AVG(RATING)
FROM
	HOTEL
GROUP BY
	HOTEL_CHAIN_NAME;

--Find the cheapest price of a room in every city.
SELECT
	CITY,
	MIN(PRICE)
FROM
	HOTEL
	NATURAL JOIN ROOM
GROUP BY
	CITY;

--Find the name and SSN of all managers who manage a Hotel not located in their resident city.
SELECT
	P.FIRST_NAME,
	P.MIDDLE_NAME,
	P.LAST_NAME,
	P.SSN
FROM
	HOTEL AS H
	JOIN PERSON AS P ON H.MANAGER_SSN = P.SSN
	AND H.CITY != P.CITY;

--Find the name and city of every hotel whose rating is higher than the average rating of all hotels in the same city.
SELECT
	*
FROM
	HOTEL AS H
	JOIN (
		SELECT
			CITY,
			AVG(RATING) AS AVG_RATING
		FROM
			HOTEL
		GROUP BY
			CITY
	) AS S ON H.CITY = S.CITY
WHERE
	H.RATING > S.AVG_RATING;