Library Database Management System

📋 Description
This project implements a basic Library Management System using SQL. It creates and populates relational tables to manage book records, track borrowers, and monitor dues.

🏗️ Database Schema
1. LIBARY Database
Creates the main database to hold all the tables related to the library.

sql
Copy
Edit
CREATE DATABASE LIBARY;
Note: There's a typo in the database name; it should likely be LIBRARY.

📚 Tables
📖 1. BOOK_INFO
Stores book details.

Column	   Data Type	       Description
BOOK_ID	    INT (PK)	       Unique ID of the book
CATEGORY    VARCHAR(200)	Book category (e.g., Fiction)
TITLE	    VARCHAR(200)	Title of the book
AUTHOR	    VARCHAR(200)	Author of the book
RACK_NO	    INT	                Rack location in the library  


✅ Sample Data Inserted – 15 records added.

👤 2. B0RROWER_INFO
Stores borrower details and the books they borrowed.
 
Column	      Data Type	       Description
B0RROW_ID	INT (PK)	Unique ID for each borrowing
B0RROWER_NAME	VARCHAR(200)	Name of the borrower
PHONE_NUM	VARCHAR(200)	Contact number
BORROW_DATE	DATE	       Date the book was borrowed
RETURN_DATE	DATE	       Expected return date
BOOK_ID	INT (FK)	       Book borrowed (linked to BOOK_INFO)

✅ Sample Data Inserted – 6 borrower records.

Note: The column name B0RROW_ID and table name B0RROWER_INFO use a zero ("0") instead of letter "O", which is not standard practice and may lead to confusion.

⏰ 3. B0RROWER_check3
Tracks dues for each borrower.

Column	       Data Type	Description
B0RROW_ID	INT (FK)	Reference to borrower's ID
numof_dues	INT	        Number of pending dues
due_status	VARCHAR(200)	Whether the borrower has dues

✅ Sample Data Inserted – 3 dues records.

🔍 Sample Queries Used
SELECT * FROM BOOK_INFO;
View all borrower info:

SELECT * FROM B0RROWER_INFO;


✅ Normalization Check
🔹 1NF (First Normal Form) – ✅ Satisfied
Each table has atomic values (no multiple values in a single column).

Each field contains only one value.

There are no repeating groups.

➡️ ✅ Your schema satisfies 1NF.

🔹 2NF (Second Normal Form) – ✅ Satisfied
The database is already in 1NF.

All non-key attributes are fully functionally dependent on the entire primary key.

➡️ All your tables have single-column primary keys, so partial dependencies don’t apply.

➡️ ✅ Your schema satisfies 2NF.


 Summary
Normal Form  Status	    Notes
1NF	   ✅ Satisfied	   Atomic values only
2NF	   ✅ Satisfied	   No partial dependency (single-column PKs) 