CREATE PROC pr_lostCentral
AS
BEGIN
	SELECT Number_Of_Copies FROM Book_Copies
	INNER JOIN library_branch ON Book_Copies.BranchID = library_branch.BranchID
	INNER JOIN Books ON Book_Copies.BookID = Books.BookID
	WHERE BranchName = 'Sharpstown' AND Title = 'The Lost Tribe'
;


END



CREATE PROC pr_lostAll
AS
BEGIN
	SELECT Number_Of_Copies FROM Book_Copies
	INNER JOIN library_branch ON Book_Copies.BranchID = library_branch.BranchID
	INNER JOIN Books ON Book_Copies.BookID = Books.BookID
	WHERE Title = 'The Lost Tribe'
	GROUP BY BranchName, Number_Of_Copies
END


CREATE PROC pr_borrowersNoCheckout
AS
BEGIN	
	SELECT Name_ FROM Borrower
	FULL OUTER JOIN Book_Loans ON Borrower.CardNo = Book_Loans.CardNo
	WHERE DateOut  IS NULL

END



CREATE PROC pr_Sharpstown_Due
@BranchName VARCHAR(50), @DateDue DATE

AS
BEGIN 
	SELECT Books.Title, Borrower.Name_, Borrower.Address_, Book_Loans.DateDue FROM Book_Loans
	INNER JOIN Books ON Book_Loans.BookID = Books.BookID
	INNER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo
	INNER JOIN library_branch ON Book_Loans.BranchID = library_branch.BranchID
	WHERE DateDue = @DateDue AND BranchName = @BranchName
END

EXEC pr_Sharpstown_Due @BranchName = 'Sharpstown', @DateDue = '2019-10-23'


CREATE PROC pr_bookloan_forbranch
AS
BEGIN
	SELECT BranchName, COUNT(Number_Of_Copies) AS Total_Books_By_Branch FROM Book_Copies
	INNER JOIN library_branch ON Book_Copies.BranchID = library_branch.BranchID
	GROUP BY BranchName
END

EXEC pr_bookloan_forbranch



CREATE PROC pr_morethan5

AS
BEGIN
	SELECT Borrower.Name_, Borrower.Address_, COUNT(BookID) AS Number_of_Books_CheckedOut FROM Borrower
	INNER JOIN Book_Loans ON Borrower.CardNo = Book_Loans.CardNo
	GROUP BY Borrower.Name_, Borrower.Address_, Borrower.CardNo
	HAVING COUNT(Book_Loans.CardNo) > 5

END

EXECUTE pr_morethan5


CREATE PROC pr_StephenK_atCentral
@BranchName VARCHAR(50), @AuthorName VARCHAR(50)
AS 
BEGIN 
	SELECT Books.Title, Book_Copies.Number_Of_Copies  FROM Book_Copies
	INNER JOIN Book_Authors ON Book_Copies.BookID  = Book_Authors.BookID
	INNER JOIN Books ON Book_Copies.BookID = Books.BookID
	INNER JOIN library_branch ON Book_Copies.BookID = library_branch.BranchID
	WHERE BranchName = @BranchName AND AuthorName = @AuthorName

END

EXEC pr_StephenK_atCentral @BranchName = 'Central', @AuthorName = 'Stephen King'
