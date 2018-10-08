USE master;
GO
ALTER DATABASE db_libraryManagementSystem SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE db_libraryManagementSystem

CREATE DATABASE db_libraryManagementSystem

USE db_libraryManagementSystem
GO

-----------------------------------------------------------------------------------------------------------------------------------
--CREATE TABLES
-----------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tbl_libraryBranch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(100) NOT NULL
)

CREATE TABLE tbl_publisher (
	PublisherName INT PRIMARY KEY NOT NULL IDENTITY (1000, 1),
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(50) NOT NULL
)

CREATE TABLE tbl_books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (10000, 1),
	Title VARCHAR(200) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL
)

CREATE TABLE tbl_bookAuthors (
	BookID INT NOT NULL CONSTRAINT fk_bookID FOREIGN KEY REFERENCES tbl_books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	Author VARCHAR(50) NOT NULL, 
)

CREATE TABLE tbl_bookCopies (
	BookID INT NOT NULL CONSTRAINT fk_copies_bookID FOREIGN KEY REFERENCES tbl_books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES tbl_libraryBranch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	numberCopies INT NOT NULL
)

CREATE TABLE tbl_Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (100000, 1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(50) NOT NULL
)

CREATE TABLE tbl_bookLoans (
	BookID INT NOT NULL CONSTRAINT fk_loans_bookID FOREIGN KEY REFERENCES tbl_books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_loans_BranchID FOREIGN KEY REFERENCES tbl_libraryBranch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES tbl_Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL, --DATE - format YYYY-MM-DD
	DateDue DATE NOT NULL,
)

-----------------------------------------------------------------------------------------------------------------------------------
--POPULATE TABLES
-----------------------------------------------------------------------------------------------------------------------------------


--There are at least 4 branches in the LIBRARY_BRANCH table.
INSERT INTO tbl_libraryBranch
	(BranchName, Address)
	VALUES
	('Sharpstown', '505 Melody Dr.'),
	('Central', '50 Lincoln Rd.'),
	('Downtown', '43 Broadway Ave.'),
	('North', '5 North Rd.')

--There are at least 20 books in the BOOK table.
--There must be at least two books written by 'Stephen King'

INSERT INTO tbl_books
	(Title, PublisherName)
	VALUES
	('Misery', 'Stephen King Publishing'),
	('Carrie', 'Stephen King Publishing'),
	('The Wings to Awakening', 'Dhammatalks.org'),
	('Buddhism: An Introduction', 'Dhammatalks.org'),
	('Biography of Ajaan Maha Boowa', 'ForestDhamma.org'),
	('Biography of Ajaan Lee', 'ForestDhamma.org'),
	('Ship Breaker', 'WindupStories.com'),
	('Windup Girl', 'WindupStories.com'),
	('The Singularity is Near', 'www.kurzweilai.net'),
	('Transcend', 'www.kurzweilai.net'),
	('Harry Potter and the Sorcerer''s Stone', 'Rowling Publishing'),
	('Harry Potter and the Chamber of Secrets', 'Rowling Publishing'),
	('Harry Potter and the Methods of Rationality', 'HPMOR.com'),
	('The Sword of Good', 'lessWrong.com'),
	('Venerable acariya Mun Bhuridatta Thera', 'ForestDhamma.org'),
	('The Ballad of Liberation from the Khandhas', 'AccessToInsight.org'),
	('Kammathana', 'ForestDhamma.org'),
	('Straight from the Heart', 'ForestDhamma.org'),
	('The 48 Laws of Power', 'Greene Publishing'),
	('The 50''th Law', 'Greene Publishing')

--There are at least 10 authors in the BOOK_AUTHORS table one's stephen king.
INSERT INTO tbl_bookAuthors
	(Author, BookID)
	VALUES
	('Stephen King', 10000),
	('Stephen King', 10001),
	('Thanissaro Bhikkhu', 10002),
	('Thanissaro Bhikkhu', 10003),	
	('Ajaan Dick Silaratano', 10004),
	('Ajaan Dick Silaratano', 10005),
	('Paolo Bacigalupi', 10006),
	('Paolo Bacigalupi', 10007),
	('Ray Kurzweil', 10008),
	('Ray Kurzweil', 10009),
	('J. K. Rowling', 10010),
	('J. K. Rowling', 10011),
	('Eliezer S. Yudkowsky', 10012),
	('Eliezer S. Yudkowsky', 10013),
	('Ajaan Mun Bhuridatta', 10014),
	('Ajaan Mun Bhuridatta', 10015),
	('Ajahn Maha Bua', 10016),
	('Ajahn Maha Bua', 10017),
	('Robert Greene', 10018),
	('Robert Greene', 10019)

--Each library branch has at least 10 book titles, and at least two copies of each of those titles.
--There must be at least two books written by 'Stephen King' located at the 'Central' branch.

INSERT INTO tbl_bookCopies
	(BranchID, BookID, numberCopies)
	VALUES
	(1, 10000, 2),
	(1, 10001, 2),
	(1, 10002, 2),
	(1, 10003, 2),
	(1, 10004, 2),
	(1, 10005, 2),
	(1, 10006, 2),
	(1, 10007, 2),
	(1, 10008, 2),
	(1, 10009, 2),
	(1, 10010, 2),
	(1, 10011, 2),
	(1, 10012, 2),
	(1, 10013, 2),
	(1, 10014, 2),
	(1, 10015, 2),
	(1, 10016, 2),
	(1, 10017, 2),
	(1, 10018, 2),
	(1, 10019, 2),
	(2, 10000, 2),
	(2, 10001, 2),
	(2, 10009, 2),
	(2, 10010, 2),
	(2, 10011, 2),
	(2, 10012, 2),
	(2, 10013, 2),
	(2, 10014, 2),
	(2, 10015, 2),
	(2, 10016, 2),
	(2, 10017, 2),
	(2, 10018, 2),
	(3, 10010, 2),
	(3, 10011, 2),
	(3, 10012, 2),
	(3, 10013, 2),
	(3, 10014, 2),
	(3, 10015, 2),
	(3, 10016, 2),
	(3, 10017, 2),
	(3, 10018, 2),
	(3, 10019, 2),
	(4, 10000, 2),
	(4, 10001, 2),
	(4, 10002, 2),
	(4, 10003, 2),
	(4, 10004, 2),
	(4, 10005, 2),
	(4, 10006, 2),
	(4, 10007, 2),
	(4, 10008, 2),
	(4, 10009, 2)

--There are at least 8 borrowers in the BORROWER table, and at least 2 of those borrowers have more than 5 books loaned to them.
INSERT INTO tbl_Borrower
	(Name, Phone, Address)
	VALUES
	('Snow White', '343-456-3453', 'Dwarfs House @ Disney land'),
	('Doc', '343-456-3453', 'Dwarfs House @ Disney land'),
	('Grumpy', '343-456-3453', 'Dwarfs House @ Disney land'),
	('Happy', '343-456-3453', 'Dwarfs House @ Disney land'),
	('Sleepy', '343-456-3453', 'Dwarfs House @ Disney land'),
	('Bashful', '343-456-3453', 'Dwarfs House @ Disney land'),
	('Sneezy', '343-456-3453', 'Dwarfs House @ Disney land'),
	('Dopey', '343-456-3453', 'Dwarfs House @ Disney land')

--There are at least 50 loans in the BOOK_LOANS table.

INSERT INTO tbl_bookLoans
	(CardNo, BranchID, BookID, DateOut, DateDue)
	VALUES
	(100000, 1, 10000, '2018-10-01', '2018-10-08'),
	(100000, 1, 10001, '2018-10-01', '2018-10-08'),
	(100000, 1, 10002, '2018-10-01', '2018-10-08'),
	(100000, 1, 10003, '2018-10-01', '2018-10-08'),
	(100000, 1, 10004, '2018-10-01', '2018-10-08'),
	(100000, 1, 10005, '2018-10-01', '2018-10-08'),
	(100000, 1, 10006, '2018-10-01', '2018-10-08'),
	(100000, 1, 10007, '2018-10-01', '2018-10-08'),
	(100000, 1, 10008, '2018-10-01', '2018-10-08'),
	(100000, 1, 10009, '2018-10-01', '2018-10-08'),
	(100000, 1, 10010, '2018-10-02', '2018-10-09'),
	(100000, 1, 10011, '2018-10-02', '2018-10-09'),
	(100000, 1, 10012, '2018-10-02', '2018-10-09'),
	(100000, 1, 10013, '2018-10-02', '2018-10-09'),
	(100000, 1, 10014, '2018-10-02', '2018-10-09'),
	(100000, 1, 10015, '2018-10-02', '2018-10-09'),
	(100000, 1, 10016, '2018-10-02', '2018-10-09'),
	(100000, 1, 10017, '2018-10-02', '2018-10-09'),
	(100000, 1, 10018, '2018-10-02', '2018-10-09'),
	(100000, 1, 10019, '2018-10-02', '2018-10-09'),
	(100001, 1, 10000, '2018-10-03', '2018-10-10'),
	(100001, 1, 10001, '2018-10-03', '2018-10-10'),
	(100001, 1, 10002, '2018-10-03', '2018-10-10'),
	(100001, 1, 10003, '2018-10-03', '2018-10-10'),
	(100001, 1, 10004, '2018-10-03', '2018-10-10'),
	(100001, 1, 10005, '2018-10-03', '2018-10-10'),
	(100001, 1, 10006, '2018-10-03', '2018-10-10'),
	(100001, 1, 10007, '2018-10-03', '2018-10-10'),
	(100001, 1, 10008, '2018-10-03', '2018-10-10'),
	(100001, 1, 10009, '2018-10-03', '2018-10-10'),
	(100001, 1, 10010, '2018-10-03', '2018-10-10'),
	(100001, 1, 10011, '2018-10-03', '2018-10-10'),
	(100001, 1, 10012, '2018-10-03', '2018-10-10'),
	(100001, 1, 10013, '2018-10-03', '2018-10-10'),
	(100001, 1, 10014, '2018-10-03', '2018-10-10'),
	(100001, 1, 10015, '2018-10-03', '2018-10-10'),
	(100001, 1, 10016, '2018-10-03', '2018-10-10'),
	(100001, 1, 10017, '2018-10-03', '2018-10-10'),
	(100001, 1, 10018, '2018-10-03', '2018-10-10'),
	(100001, 1, 10019, '2018-10-03', '2018-10-10'),
	(100002, 2, 10000, '2018-10-04', '2018-10-11'),
	(100002, 2, 10001, '2018-10-04', '2018-10-11'),
	(100002, 2, 10010, '2018-10-04', '2018-10-11'),
	(100002, 2, 10011, '2018-10-04', '2018-10-11'),
	(100002, 2, 10012, '2018-10-04', '2018-10-11'),
	(100002, 2, 10013, '2018-10-04', '2018-10-11'),
	(100002, 2, 10014, '2018-10-04', '2018-10-11'),
	(100002, 2, 10015, '2018-10-04', '2018-10-11'),
	(100002, 2, 10016, '2018-10-04', '2018-10-11'),
	(100002, 2, 10017, '2018-10-04', '2018-10-11'),
	(100002, 2, 10018, '2018-10-04', '2018-10-11'),
	(100002, 2, 10019, '2018-10-04', '2018-10-11')

-----------------------------------------------------------------------------------------------------------------------------------
--STORED PROCEDURES
-----------------------------------------------------------------------------------------------------------------------------------


--CREATE STORED PROCEDURES THAT WILL QUERY FOR EACH OF THE FOLLOWING QUESTIONS:
--1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
CREATE PROCEDURE dbo.uspGetBookNumberBranch @Title nvarchar (100) = NULL, @Branch nvarchar (50) = NULL
AS
SELECT a1.numberCopies, a2.BranchName, a3.Title
FROM tbl_bookCopies a1
INNER JOIN tbl_libraryBranch a2 ON a2.BranchID = a1.BranchID
INNER JOIN tbl_books		 a3 ON a3.BookID   = a1.BookID
WHERE a3.Title = ISNULL(@Title, a3.Title)
AND a2.BranchName LIKE '%' + ISNULL(@Branch, a2.BranchName) + '%'
GO

EXEC uspGetBookNumberBranch @Title = "The Lost Tribe",@Branch = "Sharpstown"



CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL --Create 2 Variables w/ defaults set to null
AS
SELECT *
FROM Person.Address
WHERE City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1 ,AddressLine1) + '%'
GO

	SELECT
		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type, a5.habitat_type,
		a6.nutrition_type, a7.care_type
		FROM tbl_species a1
		INNER JOIN tbl_animalia  a2 ON a2.animalia_id  = a1.species_animalia
		INNER JOIN tbl_class     a3 ON a3.class_id     = a1.species_class
		INNER JOIN tbl_order     a4 ON a4.order_id     = a1.species_order
		INNER JOIN tbl_habitat   a5 ON a5.habitat_id   = a1.species_habitat
		INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
		INNER JOIN tbl_care      a7 ON a7.care_id      = a1.species_care
		WHERE species_name = 'bobcat'
	;




--2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?

--3.) Retrieve the names of all borrowers who do not have any books checked out.

--4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

--5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

--6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.

--7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

