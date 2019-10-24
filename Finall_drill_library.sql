

USE Finall_Drill

CREATE TABLE library_branch(
		BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BranchName VARCHAR (50) NOT NULL,
		Address_ VARCHAR (90) NOT NULL

	);

	INSERT INTO library_branch 
		(BranchName, Address_)
		VALUES
		('Sharpstown', '4563 rocky road, Lehi, UT 84121'),
		('Central', '123 sometthing Blv, Sandy, UT 84121'),		
		('Murray', '4563435 lala road, Somwehere, UT 84121'),
		('Wassup', '45637568 lala road, Somwehere, UT 84121'),
		('SQL drives me crazy', '4563123 lala road, Somwehere, UT 84121');



	CREATE TABLE Book_Copies (
		BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		Number_Of_Copies INT NOT NULL
	);


	INSERT INTO Book_Copies
		(BookID, BranchID, Number_Of_Copies)
		VALUES
		(208, 5, 6),
		(218, 3, 12),
		(218, 2, 1),
		(218, 5, 6),
		(218, 4, 8),
		(218, 1, 9),
		(218, 5, 2),
		(218, 3, 4),
		(218, 3, 10),
		(201, 6, 3),
		(203, 6, 3),
		(208, 6, 3),
		(205, 6, 3),
		(201, 6, 3),
		(201, 6, 3),
		(201, 6, 3),
		(218, 6, 10),
		(201, 1, 3),
		(202, 2, 4),
		(203, 2, 2),
		(204, 2, 4),
		(205, 2, 6),
		(206, 2, 4),
		(207, 2, 5),
		(208, 1, 4),
		(209, 2, 8),
		(201, 2, 4),
		(201, 2, 4),
		(202, 2, 4),
		(202, 2, 1),
		(203, 2, 4),
		(203, 2, 42),
		(204, 3, 9),
		(205, 3, 6),
		(203, 3, 1),
		(206, 3, 14),
		(207, 2, 51),
		(208, 4, 23),
		(209, 4, 86),
		(201, 4, 12),
		(201, 4, 12),
		(208, 5, 12),
		(201, 4, 9),
		(201, 4, 12)

	;


	CREATE TABLE Publisher(
		PublisherName VARCHAR (50) PRIMARY KEY NOT NULL,
		Address_ VARCHAR(50) NOT NULL,
		Phone nvarchar(60) NOT NULL
	);

	INSERT INTO Publisher
		(PublisherName, Address_, Phone)
		VALUES
		('Penguin Random House','Random House Tower, New York', 212-366-2636),
		('Hachette Livre','10 Allée Latécoère,Vélizy, France',314-392-3000),
		('HarperCollins','195 Broadway, New York, NY 10007',212-207-7000),
		('Macmillan Publishers','Equitable Life, Broadway, NY 10271',888-330-8477),
		('Simon & Schuster','1230 6th Ave, New York, ',800-223-2336),
		('McGraw-Hill Education','P.O.Box 182 Columbus, OH',800-338-3987)
		;

	CREATE TABLE Book_Loans(
		BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut DATE NOT NULL,
		DateDue DATE NOT NULL
	);


		INSERT INTO Book_Loans 
		(BookID, BranchID, CardNo, DateOut, DateDue)
		VALUES
		(203, 6, 2105, '2019-10-15', '2019-10-23'),
		(206, 6, 2105, '2019-10-15', '2019-09-24'),
		(207, 6, 2105, '2019-10-15', '2019-09-24'),
		(208, 6, 2105, '2019-10-15', '2019-09-24'),
		(209, 6, 2105, '2019-10-15', '2019-09-24'),
		(202, 6, 2103, '2019-10-15', '2019-09-24'),
		(204, 6, 2103, '2019-10-15', '2019-09-24'),
		(204, 6, 2103, '2019-10-15', '2019-09-24'),
		(204, 6, 2103, '2019-10-15', '2019-09-24'),
		(204, 6, 2103, '2019-10-15', '2019-09-24'),
		(205, 6, 2103, '2019-10-15', '2019-09-24'),
		(205, 6, 2103, '2019-10-15', '2019-09-24'),
		(205, 6, 2103, '2019-10-15', '2019-09-24'),
		(205, 1, 2103, '2019-10-15', '2019-09-24'),
		(206, 1, 2103, '2019-10-15', '2019-09-24'),
		(206, 2, 2103, '2019-10-15', '2019-09-24'),
		(206, 2, 2101, '2019-10-15', '2019-09-24'),
		(206, 2, 2101, '2019-10-15', '2019-09-24'),
		(206, 2, 2101, '2019-10-15', '2019-09-24'),
		(207, 2, 2101, '2019-10-15', '2019-09-24'),
		(208, 2, 2101, '2019-10-15', '2019-09-24'),
		(208, 2, 2101, '2019-10-15', '2019-09-24'),
		(207, 2, 2101, '2019-10-15', '2019-09-24'),
		(209, 2, 2102, '2019-10-15', '2019-09-24'),
		(209, 3, 2102, '2019-10-15', '2019-09-24'),
		(209, 3, 2102, '2019-10-15', '2019-09-24'),
		(209, 3, 2102, '2019-10-15', '2019-09-24'),
		(209, 1, 2102, '2019-10-15', '2019-09-24'),
		(207, 1, 2102, '2019-10-15', '2019-09-24'),
		(207, 1, 2102, '2019-10-15', '2019-09-24'),
		(201, 1, 2100, '2019-01-15', '2019-02-14'),
		(201, 1, 2101, '2019-01-15', '2019-02-14'),
		(201, 1, 2102, '2019-01-15', '2019-02-14'),
		(201, 1, 2103, '2019-01-15', '2019-02-14'),
		(202, 1, 2104, '2019-02-19', '2019-01-19'),
		(202, 2, 2105, '2019-02-19', '2019-01-19'),
		(202, 2, 2106, '2019-03-22', '2019-06-05'),
		(202, 2, 2107, '2019-03-22', '2019-06-05'),
		(202, 2, 2108, '2019-10-15', '2019-09-24'),
		(203, 3, 2109, '2019-10-15', '2019-09-24'),
		(203, 3, 2109, '2019-10-15', '2019-09-24'),
		(203, 3, 2109, '2019-10-15', '2019-09-24'),
		(203, 3, 2108, '2019-10-15', '2019-09-24'),
		(203, 4, 2108, '2019-10-15', '2019-09-24'),
		(215, 4, 2108, '2019-10-15', '2019-09-24'),
		(203, 4, 2108, '2019-10-15', '2019-09-24'),
		(203, 4, 2108, '2019-10-15', '2019-09-24'),
		(203, 4, 2105, '2019-10-15', '2019-09-24'),
		(203, 4, 2105, '2019-10-15', '2019-09-24')
		
		;/**/


	CREATE TABLE Book_Authors (
		BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(50) NOT NULL,
	); 



	INSERT INTO Book_Authors
		(BookID, AuthorName)
		VALUES	
		(201, 'Karen Lord'),
		(202,'Jeff Vandermeer'),
		(203,'Margaret Cavendish'),
		(204,'Aldous Huxley'),
		(201,'Walter Miller'),
		(202,'P. D. James'),
		(202,'China Miéville'),
		(202,'Greg Bear'),
		(202,'Samuel R. Delany'),
		(202,'Philip K. Dick'),
		(202,'Connie Willis'),
		(202,'C. J. Cherryh'),
		(203,'Anne McCaffrey'),
		(204,'Frank Herbert'),
		(205,'Elizabeth Bear'),
		(206,'Peter Clines'),
		(207,'Mark Lee'),
		(208,'Stephen King')
	;




	CREATE TABLE Borrower (
		CardNo INT PRIMARY KEY NOT NULL identity(2100,1),
		Name_ VARCHAR(50) NOT NULL,
		Address_ VARCHAR(50) NOT NULL,
		Phone varchar(50) NOT NULL
	); 

		INSERT INTO Borrower 
		(Name_, Address_, Phone)
		VALUES
		('Karen Dobbs', '1221 Carol LN, Sandy UT', 321-321-9089),
		('Bob Smith', '1234 Spoke LN, Sandy UT', 123-123-1234),
		('Bob Barker', '1234 Cougar DR, Sandy UT', 123-123-1456),
		('Sandra Dee', '124 Holliday LN, Salt Lake UT', 123-123-7894),
		('Canter Cane', '46 Bougie BLV, Murray UT', 123-123-7891),
		('Sarah Mcholin', '90 west Trust DR, Holliday AZ', 1456-7891-1234),
		('Kane Brown', '52 asd LN, Sandy UT', 7891-123-1234),
		('Bo Bider', '34 Spoke LN, Sandy UT', 123-1456-1234),
		('Kara Delvine', '687 Camino Way, Kearns UT', 123-7891-1234),
		('Sabrina Ng', '46 Southbend Road, West Valley UT', 7891-123-1456)

		;


	CREATE TABLE Books (
		BookID INT PRIMARY KEY NOT NULL IDENTITY (200,1),
		Title VARCHAR(50) NOT NULL,
		PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
	); 

	INSERT INTO Books
	(Title,PublisherName)
		VALUES 
		('The Best of All Possible Worlds','Penguin Random House'),
		('The Big Book of Science Fiction','Penguin Random House'),
		('The Blazing World and Other Writings','Hachette Livre'),
		('Brave New World','Hachette Livre'),
		('A Canticle for Leibowitz','Hachette Livre'),
		('The Children of Men','Hachette Livre'),
		('The City & The City','Hachette Livre'),
		('Darwin’s Radio','HarperCollins'),
		('Dhalgren','HarperCollins'),
		('Do Androids Dream of Electric Sheep?','HarperCollins'),
		('Doomsday Book','HarperCollins'),
		('Downbelow Station','Macmillan Publishers'),
		('Dragonflight','Macmillan Publishers'),
		('Dune: Deluxe Edition','Macmillan Publishers'),
		('Dust','Simon & Schuster'),
		('The Fold','Simon & Schuster'),
		('The Lost Tribe','Simon & Schuster'),
		('Pet Sematary','McGraw-Hill Education'),
		('The Dark Tower','McGraw-Hill Education')
;


USE Final_Drill


	SELECT * FROM Publisher
	SELECT * FROM Books
	SELECT * FROM Borrower
	SELECT * FROM Book_Authors
	SELECT * FROM Book_Loans	
	SELECT * FROM Book_Copies	
	SELECT * FROM library_branch


