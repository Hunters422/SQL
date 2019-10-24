

USE Drill_Assignment


CREATE TABLE tbl_customer (
	customer_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	customer_fname VARCHAR(50) NOT NULL,
	customer_lname VARCHAR(50) NOT NULL,

); 

CREATE TABLE tbl_contact (
	contact_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	contact_number VARCHAR(50) NOT NULL,
	contact_email VARCHAR(60) NOT NULL
);

SELECT * FROM tbl_contact
SELECT * FROM tbl_customer
SELECT * FROM tbl_customerinfo 

INSERT INTO tbl_customer
	(customer_fname, customer_lname)
	VALUES
		('Hunter', 'Janko'),
		('Corbin', 'Dallas'),
		('Jack', 'Burton')
;

INSERT INTO tbl_contact
	(contact_number, contact_email)
	VALUES
		('123-123-1234','hj@something.com'),
		('123-123-1235','cb@somethingelse.com'),
		('123-123-1236','jb@somethingelseagain.com')


CREATE TABLE tbl_customerinfo (
	customerinfo_id INT PRIMARY KEY NOT NULL IDENTITY (10, 10),
	customerinfo_item VARCHAR(50) NOT NULL,
	customerinfo_customer INT NOT NULL CONSTRAINT fk_customer_id REFERENCES tbl_customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
	customerinfo_contact INT NOT NULL CONSTRAINT fk_contact_id REFERENCES tbl_contact(contact_id) ON UPDATE CASCADE ON DELETE CASCADE

);

INSERT INTO tbl_customerinfo 
	(customerinfo_item,customerinfo_customer, customerinfo_contact)
	VALUES
	('Batman Action Figure', 1, 100),
	('Sleeping Dogs Ps4 Game', 2, 101),
	('Nintendo Switch Console', 3, 102)
;

SELECT customer_fname, customer_lname, contact_number, contact_email FROM tbl_customerinfo
	INNER JOIN tbl_customer ON tbl_customer.customer_id = tbl_customerinfo.customerinfo_customer
	INNER JOIN tbl_contact ON tbl_contact.contact_id = tbl_customerinfo.customerinfo_contact
	WHERE customerinfo_item = 'Batman Action Figure'
;
