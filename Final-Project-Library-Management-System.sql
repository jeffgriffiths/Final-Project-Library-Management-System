CREATE DATABASE SomeCountyLibrary;

USE SomeCountyLibrary

CREATE TABLE LibraryBranch (
    BranchID int NOT NULL PRIMARY KEY IDENTITY (1,1),
    BranchName varchar(60) NOT NULL,
    BranchAddress varchar(120) NOT NULL
);

CREATE TABLE Borrower (
	CardNo int NOT NULL PRIMARY KEY IDENTITY (1000,1),
	BorrowerName varchar(50) NOT NULL,
	BorrowerAddress varchar(120) NOT NULL,
	BorrowerPhone varchar(50)
);

CREATE TABLE Publisher (
	PublisherName varchar(100) NOT NULL PRIMARY KEY,
	PublisherAddress varchar(120) NOT NULL,
	PublisherPhone varchar(50) NOT NULL
);

CREATE TABLE Books (
	BookID int NOT NULL PRIMARY KEY IDENTITY (100000,1),
	BookTitle varchar(100) NOT NULL,
	PublisherName varchar(100) NOT NULL FOREIGN KEY REFERENCES Publisher(PublisherName)
);


CREATE TABLE BookLoans (
	BookID int NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID int NOT NULL FOREIGN KEY REFERENCES LibraryBranch(BranchID),
	CardNo int NOT NULL FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

CREATE TABLE BookCopies (
	BookID int NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID int NOT NULL FOREIGN KEY REFERENCES LibraryBranch(BranchID),
	NumberOfCopies int NOT NULL
);

CREATE TABLE BookAuthors (
	BookID int NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	AuthorName varchar(50) NOT NULL
);

	INSERT INTO LibraryBranch
		(BranchName, BranchAddress)
		VALUES
		('Central', '123 E 2nd St'),
		('East', '1456 N Broadway Blvd'),
		('Sharpstown', '334 S Franklin St'),
		('Valley', '1904 W Marketplace Dr')

	SELECT * FROM LibraryBranch
		
	INSERT INTO Borrower
		(BorrowerName, BorrowerAddress, BorrowerPhone)
		VALUES
		('Gary Payton', '123 E Somewhere Rd', '123-456-7890'),
		('Detlef Schrempf', '848 S Summerset', '123-456-7890'),
		('Shawn Kemp', '4949 W Apple', '123-456-7890'),
		('Hersey Hawkins', '383 NW 1st St', '123-456-7890'),
		('Sam Perkins', '83499 Outter Rim Rd', '123-456-7890'),
		('Nate McMillan', '33 Main St', '123-456-7890'),
		('Ervin Johnson', '949 Upper Slevin Way', '123-456-7890'),
		('David Wingate', '3737 38th St Nw', '123-456-7890')

	SELECT * FROM Borrower
		
	INSERT INTO Publisher
		(PublisherName, PublisherAddress, PublisherPhone)
		VALUES
		('David C Cook', '123 Some Address', '123-456-7890'),
		('Zondervan', '123 Some Address', '123-456-7890'),
		('Moody Publishers', '123 Some Address', '123-456-7890'),
		('Crosslink Publishing', '123 Some Address', '123-456-7890')

	SELECT * FROM Publisher
		
	INSERT INTO Books
		(BookTitle, PublisherName)
		VALUES
		('The Lost Tribe', 'David C Cook'),
		('It', 'Zondervan'),
		('Misery', 'Moody Publishers'),
		('Redwall', 'Crosslink Publishing'),
		('Indian In the Cupboard', 'David C Cook'),
		('Arthur', 'Zondervan'),
		('Babar', 'Moody Publishers'),
		('Captain America', 'Crosslink Publishing'),
		('Iron Man', 'David C Cook'),
		('Spiderman', 'Zondervan'),
		('How To Make Boats', 'Moody Publishers'),
		('Knot Tying', 'Crosslink Publishing'),
		('Biography of Shawn Kemp', 'David C Cook'),
		('Reignman Returns', 'Zondervan'),
		('The Glove', 'Moody Publishers'),
		('Underwater Basket Weaving', 'Crosslink Publishing'),
		('Beavis & Butthead Grow Up', 'David C Cook'),
		('Pearl Jam Is Over-Rated', 'Zondervan'),
		('Why I Hate Dave Matthews Band', 'Moody Publishers'),
		('Faking Sick At Work', 'Crosslink Publishing')

	SELECT * FROM Books
		
	INSERT INTO BookLoans
		(BookID, BranchID, CardNo, DateOut, DateDue)
		VALUES
		(100000, 1, 1000, '2018-01-01', '2018-01-14'),
		(100001, 2, 1001, '2018-01-02', '2018-01-15'),
		(100002, 3, 1002, '2018-01-03', '2018-01-16'),
		(100003, 4, 1003, '2018-01-04', '2018-01-17'),
		(100004, 1, 1004, '2018-01-05', '2018-01-18'),
		(100005, 2, 1005, '2018-01-06', '2018-01-19'),
		(100006, 3, 1006, '2018-01-07', '2018-01-20'),
		(100007, 4, 1007, '2018-01-08', '2018-01-21'),
		(100008, 1, 1002, '2018-01-09', '2018-01-22'),
		(100009, 2, 1003, '2018-01-10', '2018-01-23'),
		(100010, 3, 1004, '2018-01-11', '2018-01-24'),
		(100011, 4, 1005, '2018-01-12', '2018-01-25'),
		(100012, 1, 1006, '2018-01-13', '2018-01-26'),
		(100013, 2, 1007, '2018-01-14', '2018-01-27'),
		(100014, 3, 1002, '2018-01-15', '2018-01-28'),
		(100015, 4, 1003, '2018-01-16', '2018-01-29'),
		(100016, 1, 1004, '2018-01-17', '2018-01-30'),
		(100017, 2, 1005, '2018-01-18', '2018-01-31'),
		(100018, 3, 1006, '2018-01-19', '2018-02-01'),
		(100019, 4, 1007, '2018-01-20', '2018-02-02'),
		(100000, 1, 1002, '2018-01-21', '2018-02-03'),
		(100001, 2, 1003, '2018-01-22', '2018-02-04'),
		(100002, 3, 1004, '2018-01-23', '2018-02-05'),
		(100003, 4, 1005, '2018-01-24', '2018-02-06'),
		(100004, 1, 1006, '2018-01-25', '2018-02-07'),
		(100005, 2, 1007, '2018-01-26', '2018-02-08'),
		(100006, 3, 1002, '2018-01-27', '2018-02-09'),
		(100007, 4, 1003, '2018-01-28', '2018-02-10'),
		(100008, 1, 1004, '2018-01-29', '2018-02-11'),
		(100009, 2, 1005, '2018-01-30', '2018-02-12'),
		(100010, 3, 1006, '2018-01-31', '2018-02-13'),
		(100011, 4, 1007, '2018-02-01', '2018-02-14'),
		(100012, 1, 1000, '2018-02-02', '2018-02-15'),
		(100013, 2, 1001, '2018-02-03', '2018-02-16'),
		(100014, 3, 1002, '2018-02-04', '2018-02-17'),
		(100015, 4, 1003, '2018-02-05', '2018-02-18'),
		(100016, 1, 1004, '2018-02-06', '2018-02-19'),
		(100017, 2, 1005, '2018-02-07', '2018-02-20'),
		(100018, 3, 1006, '2018-02-08', '2018-02-21'),
		(100019, 4, 1007, '2018-02-09', '2018-02-22'),
		(100000, 1, 1000, '2018-02-10', '2018-02-23'),
		(100001, 2, 1001, '2018-02-11', '2018-02-24'),
		(100002, 3, 1002, '2018-02-12', '2018-02-25'),
		(100003, 4, 1003, '2018-02-13', '2018-02-26'),
		(100004, 1, 1004, '2018-02-14', '2018-02-27'),
		(100005, 2, 1005, '2018-02-15', '2018-02-28'),
		(100006, 3, 1006, '2018-02-16', '2018-03-01'),
		(100007, 4, 1007, '2018-02-17', '2018-03-02'),
		(100008, 1, 1000, '2018-02-18', '2018-03-03'),
		(100009, 2, 1001, '2018-02-19', '2018-03-04')
		
	INSERT INTO BookCopies
		(BookID, BranchID, NumberOfCopies)
		VALUES
		(100000, 1, 2),
		(100001, 2, 2),
		(100002, 3, 2),
		(100003, 4, 2),
		(100004, 1, 2),
		(100005, 2, 2),
		(100006, 3, 2),
		(100007, 4, 2),
		(100008, 1, 2),
		(100009, 2, 2),
		(100010, 3, 2),
		(100011, 4, 2),
		(100012, 1, 2),
		(100013, 2, 2),
		(100014, 3, 2),
		(100015, 4, 2),
		(100016, 1, 2),
		(100017, 2, 2),
		(100018, 3, 2),
		(100019, 4, 2)
	
	INSERT INTO BookAuthors
		(BookID, AuthorName)
		VALUES
		(100000, 'Mark Lee'),
		(100001, 'Stephen King'),
		(100002, 'Stephen King'),
		(100003, 'Brian Jaques'),
		(100004, 'Melissa Matheson'),
		(100005, 'Marc Brown'),
		(100006, 'Jean de Brunhoff'),
		(100007, 'Mar Vel'),
		(100008, 'Mar Vel'),
		(100009, 'Mar Vel'),
		(100010, 'Handyman Hank'),
		(100011, 'Boring Bryan'),
		(100012, 'Shawn Kemp'),
		(100013, 'Shawn Kemp'),
		(100014, 'Gary Peyton'),
		(100015, 'Boring Bryan'),
		(100016, 'Mike Judge'),
		(100017, 'Jeff Griffiths'),
		(100018, 'Jeff Griffiths'),
		(100019, 'Lame Larry')






	 







		




				
				
				
				
				--SELECT CONVERT(VARCHAR(8),GETDATE(),1)

		
		
		
		
		
		
		
		
		







