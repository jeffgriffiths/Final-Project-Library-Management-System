--1.) How many copies of the book titled "The Lost Tribe" 
--are owned by the library branch whose name is "Sharpstown"?
CREATE PROC uspGetBookCountSharpstown
AS
	SELECT
		a1.NumberOfCopies
		FROM BookCopies a1
		INNER JOIN Books a2 ON a2.BookID = a1.BookID
		WHERE a2.BookTitle = 'The Lost Tribe' AND a1.BranchID = 3
	;
GO

--2.) How many copies of the book titled 
--"The Lost Tribe" are owned by each library branch?
CREATE PROC uspGetBookCountByBranch
AS
	SELECT
		a1.NumberOfCopies, a1.BranchID, a2.BranchName
		FROM BookCopies a1
		INNER JOIN LibraryBranch a2 ON a2.BranchID = a1.BranchID
		WHERE a1.BookID = 100000
	;
GO

--3.) Retrieve the names of all borrowers
-- who do not have any books checked out.
CREATE PROC uspGetBorrowersWithoutBooks
AS

	SELECT 
		BorrowerName
		FROM Borrower
		WHERE EXISTS (SELECT BookID FROM BookLoans WHERE CardNo = Borrower.CardNo)
	;
GO

--4.) For each book that is loaned out from the "Sharpstown" 
--branch and whose DueDate is today, retrieve the book title, 
--the borrower's name, and the borrower's address.
CREATE PROC uspGetSharpstownDueToday
AS

	SELECT 
		Books.BookTitle, Borrower.BorrowerName, Borrower.BorrowerAddress
		FROM Books
		INNER JOIN BookLoans ON BookLoans.BookID = Books.BookID
		INNER JOIN Borrower ON Borrower.CardNo = BookLoans.CardNo
		WHERE BookLoans.BranchID = 3 AND BookLoans.DateDue = CONVERT(DATE,GETDATE()) 
	;
GO

--5.) For each library branch, retrieve the branch name 
--and the total number of books loaned out from that branch
CREATE PROC uspGetNumBooksLoanedByBranch
AS

	SELECT
		LibraryBranch.BranchName, COUNT(BookLoans.BookID) AS 'Num Borrowed Books'
		FROM LibraryBranch
		INNER JOIN BookLoans ON BookLoans.BranchID = LibraryBranch.BranchID
		GROUP BY LibraryBranch.BranchName
	;
GO

--6.) Retrieve the names, addresses, and the number of books checked out for all borrowers 
--who have more than five books checked out.
CREATE PROC uspGetBorrowerWithMoreThanFive
AS

	SELECT
		Borrower.BorrowerName, Borrower.BorrowerAddress, COUNT(BookLoans.CardNo) AS 'Num Borrowed Books'
		FROM (BookLoans
		INNER JOIN Borrower ON BookLoans.CardNo = Borrower.CardNo)
		GROUP BY Borrower.BorrowerName, Borrower.BorrowerAddress
		HAVING COUNT(BookLoans.BookID) > 5
	;
GO

--7.) For each book authored (or co-authored) by "Stephen King", 
--retrieve the title and the number of copies
--owned by the library branch whose name is "Central".
CREATE PROC uspGetKingBooksCentral
AS

	SELECT
		Books.BookTitle, COUNT(Books.BookID) As 'Num Books'
		FROM (Books
		INNER JOIN BookAuthors ON Books.BookID = BookAuthors.BookID
		INNER JOIN BookCopies ON Books.BookID = BookCopies.BookID
		INNER JOIN LibraryBranch ON BookCopies.BranchID = LibraryBranch.BranchID)
		GROUP BY Books.BookTitle, BookAuthors.AuthorName, LibraryBranch.BranchName
		HAVING BookAuthors.AuthorName = 'Stephen King' AND LibraryBranch.BranchName = 'East'
	;
GO