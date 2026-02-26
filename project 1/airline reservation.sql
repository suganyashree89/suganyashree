--passenger details
CREATE TABLE passenger (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    phone VARCHAR(15),
    email VARCHAR(100)
);
--airport details

CREATE TABLE airport (
    airport_id INT PRIMARY KEY,
    airport_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

--Aircraft Table

CREATE TABLE aircraft (
    aircraft_id INT PRIMARY KEY,
    aircraft_name VARCHAR(100),
    total_seats INT
);

-- fight details

CREATE TABLE flight (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(20),
    departure_airport INT,
    arrival_airport INT,
    departure_time TIMESTAMP,
    arrival_time TIMESTAMP,
    aircraft_id INT,
    FOREIGN KEY (departure_airport) REFERENCES airport(airport_id),
    FOREIGN KEY (arrival_airport) REFERENCES airport(airport_id),
    FOREIGN KEY (aircraft_id) REFERENCES aircraft(aircraft_id)
);

--Booking Table
CREATE TABLE booking (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    seat_number VARCHAR(5),
    status VARCHAR(20),
    FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES flight(flight_id)
);

--Payment Table

CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_status VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES booking (booking_id)
);

	INSERT INTO passenger 
VALUES (131,'Arun', 'Kumar', 'Male', '9876543210', 'arun@gmail.com'),
(132,'Priya', 'Sharma', 'Female', '9123456780', 'priya@gmail.com'),
(133,'Rahul', 'Verma', 'Male', '9988776655', 'rahul@gmail.com'),
(134,'Sneha', 'Reddy', 'Female', '9012345678', 'sneha@gmail.com'),
(135,'David', 'Joseph', 'Male', '8899001122', 'david@gmail.com');

INSERT INTO airport (airport_id, airport_name, city, country)
VALUES(1, 'Kempegowda International Airport', 'Bangalore', 'India'),
(2, 'Indira Gandhi International Airport', 'Delhi', 'India'),
(3, 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'India'),
(4, 'Chennai International Airport', 'Chennai', 'India'),
(5, 'Rajiv Gandhi International Airport', 'Hyderabad', 'India');

INSERT INTO aircraft (aircraft_id, aircraft_name, total_seats)
VALUES
(1, 'Airbus A320', 180),
(2, 'Boeing 737', 189),
(3, 'Airbus A321', 220),
(4, 'Boeing 777', 396),
(5, 'Airbus A380', 853);

SELECT * FROM aircraft;

INSERT INTO flight 
(flight_id, flight_number, departure_airport, arrival_airport, departure_time, arrival_time, aircraft_id)
VALUES(101, 'AI101', 1, 2, '2026-03-01 06:00:00', '2026-03-01 08:30:00', 1);
INSERT INTO flight 
(flight_id, flight_number, departure_airport, arrival_airport, departure_time, arrival_time, aircraft_id)
VALUES(102, 'AI202', 2, 3, '2026-03-01 09:00:00', '2026-03-01 11:15:00', 2);
INSERT INTO flight 
(flight_id, flight_number, departure_airport, arrival_airport, departure_time, arrival_time, aircraft_id)
VALUES(103, 'AI303', 3, 4, '2026-03-01 12:00:00', '2026-03-01 14:00:00', 3);
INSERT INTO flight 
(flight_id, flight_number, departure_airport, arrival_airport, departure_time, arrival_time, aircraft_id)
VALUES(104, 'AI404', 4, 5, '2026-03-01 15:30:00', '2026-03-01 17:45:00', 1);

SELECT * FROM FLIGHT;

INSERT INTO booking (booking_id, passenger_id, flight_id, booking_date, seat_number, status)
VALUES (1, 131, 104, '2026-02-25', 'A1', 'Confirmed');

INSERT INTO booking 
(booking_id, passenger_id, flight_id, booking_date, seat_number, status)
VALUES(2, 134, 102, '2026-02-20', 'A1', 'Confirmed');
INSERT INTO booking 
(booking_id, passenger_id, flight_id, booking_date, seat_number, status)
VALUES(3, 132, 101, '2026-02-21', 'B2', 'Confirmed');
INSERT INTO booking 
(booking_id, passenger_id, flight_id, booking_date, seat_number, status)
VALUES(4, 133, 103, '2026-02-21', 'C3', 'Cancelled');
INSERT INTO booking 
(booking_id, passenger_id, flight_id, booking_date, seat_number, status)
VALUES(5, 134, 104, '2026-02-22', 'D4', 'refund');
INSERT INTO booking 
(booking_id, passenger_id, flight_id, booking_date, seat_number, status)
VALUES(6, 131, 104, '2026-02-22', 'D4', 'comfirmed');
INSERT INTO booking 
(booking_id, passenger_id, flight_id, booking_date, seat_number, status)
VALUES(7, 132, 102, '2026-02-21', 'D4', 'confrimed');
INSERT INTO booking 
(booking_id, passenger_id, flight_id, booking_date, seat_number, status)
VALUES(8, 133, 103, '2026-02-23', 'D4', 'cancelled'');



INSERT INTO payment
(payment_id, booking_id, amount, payment_date, payment_status)
VALUES(1001, 1, 5500.00, '2026-02-20', 'Paid');
INSERT INTO payment
(payment_id, booking_id, amount, payment_date, payment_status)
VALUES(1002, 2, 7200.00, '2026-02-21', 'Paid');
INSERT INTO payment
(payment_id, booking_id, amount, payment_date, payment_status)
VALUES(1003, 3, 6800.00, '2026-02-21', 'Refunded');
INSERT INTO payment
(payment_id, booking_id, amount, payment_date, payment_status)
VALUES(1004, 4, 4500.00, '2026-02-22', 'Paid');

INSERT INTO payment
(payment_id, booking_id, amount, payment_date, payment_status)
VALUES(1005, 5, 4500.00, '2026-02-22', 'refund');

--booking analysis

select count(*)  as total_booking from booking;

--totalrevenue
SELECT SUM(amount) AS total_revenue
FROM payment
WHERE payment_status = 'Paid';

--highest booking

SELECT f.flight_number, COUNT(b.booking_id) AS total_bookings
FROM booking b
JOIN flight f ON b.flight_id = f.flight_id
GROUP BY f.flight_number
ORDER BY total_bookings DESC
LIMIT 1;

--Daily Booking Count

SELECT booking_date, COUNT(*) AS total_bookings
FROM booking
GROUP BY booking_date
ORDER BY booking_date;

--Pending Payments

SELECT COUNT(*) AS pending_payments
FROM payment
WHERE payment_status = 'Pending';

--Cancelled Bookings Count

SELECT COUNT(*) AS cancelled_bookings
FROM booking
WHERE status = 'Cancelled';

--Passenger Who Booked Most Flights

SELECT p.first_name, COUNT(b.booking_id) AS total_bookings
FROM passenger p
JOIN booking b 
ON p.passenger_id = b.passenger_id
GROUP BY p.first_name
ORDER BY total_bookings DESC
LIMIT 1;

--triggerfunction

CREATE OR REPLACE FUNCTION check_seat_availability()
RETURNS TRIGGER AS $$
DECLARE
    total INT;
    booked INT;
BEGIN
    -- Get total seats of aircraft
    SELECT a.total_seats INTO total
    FROM aircraft a
    JOIN flight f ON a.aircraft_id = f.aircraft_id
    WHERE f.flight_id = NEW.flight_id;

    -- Count already booked seats
    SELECT COUNT(*) INTO booked
    FROM booking
    WHERE flight_id = NEW.flight_id
    AND status = 'Confirmed';

    IF booked >= total THEN
        RAISE EXCEPTION 'No seats available for this flight';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--SUMMARY OF BOOKING
SELECT 
    f.flight_number,
    
    COUNT(b.booking_id) AS total_bookings,
    
    SUM(CASE 
            WHEN b.status ILIKE 'confirm%' THEN 1 
            ELSE 0 
        END) AS confirmed_bookings,
        
    SUM(CASE 
            WHEN b.status ILIKE 'cancel%' THEN 1 
            ELSE 0 
        END) AS cancelled_bookings,
        
    SUM(CASE 
            WHEN p.payment_status ILIKE 'paid' 
            THEN p.amount 
            ELSE 0 
        END) AS total_revenue

FROM flight f
LEFT JOIN booking b 
    ON f.flight_id = b.flight_id
LEFT JOIN payment p 
    ON b.booking_id = p.booking_id

GROUP BY f.flight_number
ORDER BY f.flight_number;


