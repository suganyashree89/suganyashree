create database online_business_information;
create table product_information1(
pro_id int PRIMARY KEY IDENTITY(2101,1),
pro_name varchar(100)NOT NULL,
pro_price VARCHAR(100)NOT NULL,
MFD date
);
INSERT INTO  product_information1 (pro_name,pro_price,MFD ) VALUES('FAN','RS.2042','2025-05-12'),
('MIXER GRIENDER','RS.2042','2025-05-13'),
('JUICER','RS.3000','2025-05-16'),
('TV','RS.25000','2025-05-12'),
('WASHING MACHINE','RS.17000','2025-05-13'),
('AC','RS.45000','2025-05-12'),
('COOLER','RS.2042','2025-05-12'),
('IRONBOX','RS.2042','2025-05-12');

CREATE TABLE DELIVERYPERSONS_INFO1(
DI_IDS INT PRIMARY KEY,
DI_NAME VARCHAR(200),
DI_PH BIGINT);

INSERT INTO DELIVERYPERSONS_INFO1 VALUES(101,'BALU',998765490),
(201,'RAMU',8807654477),
(301,'SHANU',876543200),
(501,'rishi',5445667777),
(601,'shiva',6654367809),
(701,'anbu',6776558889),
(801,'SHEKAR',998765490);

CREATE TABLE ORDERstatus1(
OR_ID INT PRIMARY KEY,
OR_STATUS VARCHAR(100),
DI_IDS INT,
pro_id INT
);
INSERT INTO ORDERstatus1 VALUES(100,'COMPLETED',501,2103),
(200,'PENDING',301,2107),
(300,'COMPLETED',201,2101),
(400,'CPMPLETED',101,2104),
(500,'COMPLETED',201,2102),
(600,'completed',401,2104),
(700,'pending',201,2107);


--CREATE VIEW FOR HIGH PRICE
CREATE VIEW view_high_price
as
select pro_name,pro_price from product_information 
where pro_price = (select max(pro_price)from product_information as highest_pro_price);

SELECT  * FROM view_high_price;

--DROP THE VIWE
drop view  view_high_price;

--ANY CHANGES NEED TO DO IN SAME VIEW NAME
--ALTER VIEW
CREATE VIEW PRODUCT_DETAILS
as
SELECT pro_name,pro_price,pro_price MFD FROM product_information 
WHERE pro_price > 2000 ;


ALTER VIEW  PRODUCT_DETAILS
AS
SELECT pro_name,pro_price, MFD FROM product_information

WHERE MFD ='2025-05-12';


SELECT * FROM PRODUCT_DETAILS;


