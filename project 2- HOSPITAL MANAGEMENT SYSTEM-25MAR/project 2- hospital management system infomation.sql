-- Database: hospital management system details
  
--patient details

CREATE TABLE patients_info(
patient_id serial primary key,
patient_name varchar(50),
patient_phonenum bigint,
patient_age int,
patient_address varchar(30)
);

ALTER SEQUENCE patients_info_patient_id_seq RESTART WITH 1000;

--DOCTOR DETAILS

create table doctors_info(
doc_id int primary key,
doctor_name varchar(30),
doctor_phonenum bigint,
spectalist varchar(30)
);

--APPOINTMENT DETAILS

CREATE TABLE appointments_info (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doc_id INT,
    appointment_date DATE,
    appointment_time TIME,
 constraint fk_patids  FOREIGN KEY(patient_id)REFERENCES patients_info(patient_id)
 on delete cascade,
 CONSTRAINT FK_DOCDET FOREIGN KEY(DOC_ID)REFERENCES doctors_info(doc_id)
 on delete cascade
  );
--ROOM DETAILS

CREATE TABLE room_vacant (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(50),
    room_charge INT,
    status VARCHAR(20)
);	

--ADMISSION TABLE

CREATE TABLE admission_info (
    admission_id INT PRIMARY KEY,
    patient_id INT,
    room_id INT,
    admission_date DATE,
    discharge_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients_info(patient_id)
	on delete cascade,
    FOREIGN KEY (room_id) REFERENCES room_vacant(room_id)
	on delete cascade
);

--billing table

CREATE TABLE bill_info (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    bill_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients_info(patient_id)
	on delete cascade
);

--staff details
create table staff_infomation(staff_ids int primary key,
staff_name varchar(30),
designation varchar(30),
shift varchar(30));

--medicine pharmacy

create table pharmacy_details(
medicine_id int primary key,
medicine_name varchar(30),
 price DECIMAL(8,2),
    expiry_date DATE,
    stock_quantity INT
);

--insert sample data values

INSERT INTO patients_info
(patient_name, patient_phonenum, patient_age, patient_address)
VALUES('Ravi Kumar', '9876543210', 35, 'Chennai'),
('Priya Sharma', '9123456780', 28, 'Bangalore'),
('Arun Prakash', '9988776655', 40, 'Coimbatore'),
('Meena Lakshmi', '9871234567', 32, 'Madurai'),
('Karthik R', '9001122334', 45, 'Salem'),
('Karthika R', '9004532871', 35, 'Thanjavur'),
('Ramaswamy', '99764054307', 86, 'Chennai'),
('Gomathi', '8964332890', 54, 'Trichy'),
('Asha', '7843267903', 32, 'Trichy'),
('THENDRAL', '9108153638', 08, 'thanjavur');

select * from patient_details;

INSERT INTO doctors_info (doc_id, doctor_name, doctor_phonenum, spectalist)
VALUES
(101, 'Dr. Ravi Kumar', 9876543210, 'Cardiologist'),
(102, 'Dr. Meena', 9123456789, 'Neurologist'),
(103, 'Dr. Arun Prakash', 9988776655, 'Orthopedic'),
(104, 'Dr. Lakshmi', 9871234567, 'Pediatrician'),
(105, 'Dr. Karthik', 9001122334, 'Dermatologist');


INSERT Into appointments_info
(appointment_id, patient_id, doc_id, appointment_date, appointment_time)
VALUES
(1, 1000, 101, '2026-03-10', '09:30:00'),
(2, 1001, 102, '2026-03-10', '10:15:00'),
(3, 1002, 103, '2026-03-11', '11:00:00'),
(4, 1003, 104, '2026-03-11', '14:30:00'),
(5, 1004, 105, '2026-03-12', '16:00:00'),
(6, 1005, 103, '2026-03-12', '17:00:00'),
(7, 1003, 101, '2026-03-11', '16:00:00'),
(8, 1006, 102, '2026-03-09', '18:00:00'),
(9, 1007, 105, '2026-03-10', '15:00:00');

select * from appointments_info;

INSERT INTO room_vacant (room_id, room_type, room_charge, status) VALUES
(1, 'General Ward', 500, 'Available'),
(2, 'General Ward', 500, 'Occupied'),
(3, 'Semi Private', 1000, 'Available'),
(4, 'Private Room', 2000, 'Occupied'),
(5, 'ICU', 5000, 'Occupied'),
(6, 'ICU', 5000, 'Available'),
(7, 'Deluxe Room', 3500, 'Available'),
(8, 'Deluxe Room', 3500, 'Occupied'),
(9, 'Emergency Room', 1500, 'Available'),
(10, 'Emergency Room', 1500, 'Occupied');


INSERT INTO admission_info
(admission_id, patient_id, room_id, admission_date, discharge_date)
VALUES
(201, 1000, 1, '2026-03-10', '2026-03-13'),
(202,1002,  2, '2026-03-11', '2026-03-15'),
(203, 1006, 3, '2026-03-09', '2026-03-14'),
(204, 1005, 4, '2026-03-12', '2026-03-15'),
(205, 1004, 5, '2026-03-05', '2026-03-08'),
(206, 1006, 6, '2026-03-09', '2026-03-09'),
(207, 1007, 7, '2026-03-10', '2026-03-12'),
(208, 1003, 8, '2026-03-11', '2026-03-17'),
(209, 1001, 3, '2026-03-10', '2026-03-15');

INSERT INTO bill_info (bill_id, patient_id, total_amount, payment_status, bill_date)
VALUES
(441, 1000, 5000.00, 'Paid', '2026-03-13'),
(442, 1001, 7500.50, 'Pending', '2026-03-15'),
(443, 1002, 3200.75, 'Paid', '2026-03-15'),
(444, 1003, 15000.00, 'Pending', '2026-03-17'),
(445, 1004, 9800.25, 'Paid', '2026-03-08'),
(446, 1005, 4200.00, 'Cancelled', '2026-03-15'),
(447, 1006, 6100.00, 'Paid', '2026-03-09'),
(448, 1007, 2750.50, 'Pending', '2026-03-12');

INSERT INTO staff_infomation (staff_ids, staff_name, designation, shift)
VALUES(500, 'Anita Sharma', 'Nurse', 'Evening'),
(501, 'Suresh Reddy', 'Ward Boy', 'Night'),
(502, 'Priya Singh', 'Receptionist', 'Morning'),
(503, 'Kiran Patel', 'Lab Technician', 'Evening'),
(504, 'Meena Das', 'Nurse', 'Night'),
(505, 'Lakshmi Nair', 'Pharmacist', 'Morning');

INSERT INTO pharmacy_details (medicine_id, medicine_name, price, expiry_date, stock_quantity)
VALUES
(11, 'Paracetamol', 25.50, '2027-01-15', 200),
(12, 'Ibuprofen', 40.00, '2026-12-10', 150),
(13, 'Amoxicillin', 85.75, '2026-08-20', 100),
(14, 'Cough Syrup', 60.25, '2027-03-05', 80),
(15, 'Vitamin C', 120.00, '2028-05-12', 300),
(16, 'Insulin', 450.00, '2026-06-30', 50),
(17, 'Aspirin', 30.00, '2027-09-18', 180),
(18, 'Antacid', 55.50, '2026-11-25', 120);
INSERT INTO pharmacy_details (medicine_id, medicine_name, price, expiry_date, stock_quantity)
VALUES(19, 'telmikide',43.50, '2025-11-25', 120);
INSERT INTO pharmacy_details (medicine_id, medicine_name, price, expiry_date, stock_quantity)
VALUES(20, 'vitamin c tab',120.50, '2029-11-25', 90);
INSERT INTO pharmacy_details (medicine_id, medicine_name, price, expiry_date, stock_quantity)
VALUES(21, 'vitamin d tab',160.50, '2030-11-25', 50);
INSERT INTO pharmacy_details (medicine_id, medicine_name, price, expiry_date, stock_quantity)
VALUES(22, 'vitamin e tab',70.00, '2030-11-29', 98);


--Create stored procedures for billing calculations.
CREATE OR REPLACE FUNCTION bill_close()
RETURNS TABLE (
    patient_id INT,
    payment_status VARCHAR,
    bill_date DATE,
    total_amount DECIMAL(10,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        b.patient_id, 
        b.payment_status, 
        b.bill_date,
        b.total_amount
    FROM bill_info b
    WHERE b.payment_status = 'Paid';
END;
$$;
select * from bill_close();

--trigger on pharmacy details
CREATE OR REPLACE FUNCTION pharmacy_stock_warning_func()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    -- Automatically check stock
    IF NEW.stock_quantity < 100 THEN
        RAISE WARNING '⚠ Stock Low: % has only % items left!',
        NEW.medicine_name, NEW.stock_quantity;
    END IF;

    RETURN NEW;
END;
$$;
CREATE TRIGGER pharmacy_stock_warning
after INSERT OR UPDATE
ON pharmacy_details
FOR EACH ROW
EXECUTE FUNCTION pharmacy_stock_warning_func();

--low stock item table
SELECT medicine_id, medicine_name, stock_quantity
FROM pharmacy_details
WHERE stock_quantity < 100;

--auto stock reduce 
CREATE TABLE pharmacy_sales (
    sale_id INT,
    medicine_id INT,
    quantity_sold INT
);

CREATE OR REPLACE FUNCTION reduce_stock_funct()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE current_stock INT;
BEGIN

    SELECT stock_quantity INTO current_stock
    FROM pharmacy_details
    WHERE medicine_id = NEW.medicine_id;

    IF current_stock < NEW.quantity_sold THEN
        RAISE EXCEPTION 'Insufficient stock for medicine ID %', NEW.medicine_id;
    END IF;

    UPDATE pharmacy_details
    SET stock_quantity = stock_quantity - NEW.quantity_sold
    WHERE medicine_id = NEW.medicine_id;

    RETURN NEW;
END;
$$;
CREATE TRIGGER reduce_stocks_trigger
AFTER INSERT
ON pharmacy_sales
FOR EACH ROW
EXECUTE FUNCTION reduce_stock_funct();

INSERT INTO pharmacy_sales VALUES (2, 13, 10);
INSERT INTO pharmacy_sales VALUES (3, 11, 10);
INSERT INTO pharmacy_sales VALUES (4, 11, 10);
select * from pharmacy_details;

