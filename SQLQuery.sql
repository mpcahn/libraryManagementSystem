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
Copies

--There are at least 50 loans in the BOOK_LOANS table.
Loans

--There are at least 8 borrowers in the BORROWER table, and at least 2 of those borrowers have more than 5 books loaned to them.
Borrower



publisher

	












/*
CREATE STORED PROCEDURES THAT WILL QUERY FOR EACH OF THE FOLLOWING QUESTIONS:
1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?

3.) Retrieve the names of all borrowers who do not have any books checked out.

4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.

7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
*/

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------

	INSERT INTO tbl_animalia 
		(animalia_type) 
		VALUES
		('vertebrate'),
		('invertebrate')
	;

	SELECT * FROM tbl_animalia;

	CREATE TABLE tbl_class (
		class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
		class_type VARCHAR(50) NOT NULL
	);

	INSERT INTO tbl_class
		(class_type)
		VALUES
		('bird'),
		('reptilian'),
		('mammal'),
		('arthropod'),
		('fish'),
		('worm'),
		('cnidaria'),
		('echinoderm')
	;

	CREATE TABLE tbl_order (
		order_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		order_type VARCHAR(50) NOT NULL,
	);

	CREATE TABLE tbl_care (
		care_id VARCHAR(50) PRIMARY KEY NOT NULL,
		care_type VARCHAR(50) NOT NULL,
		care_specialist INT NOT NULL
	);

	CREATE TABLE tbl_nutrition (
		nutrition_id INT PRIMARY KEY NOT NULL IDENTITY(2200,1),
		nutrition_type VARCHAR(50) NOT NULL,
		nutrition_cost MONEY NOT NULL
	);

	CREATE TABLE tbl_habitat (
		habitat_id INT PRIMARY KEY NOT NULL IDENTITY(5000,1),
		habitat_type VARCHAR(50) NOT NULL,
		habitat_cost MONEY NOT NULL
	);

	CREATE TABLE tbl_specialist (
		specialist_id INT PRIMARY KEY NOT NULL IDENTITY(2200,1),
		specialist_fname VARCHAR(50) NOT NULL,
		specialist_lname VARCHAR(50) NOT NULL,
		specialist_contact VARCHAR(50) NOT NULL
	);

	INSERT INTO tbl_order
		(order_type)
		VALUES
		('carnivore'),
		('herbivore'),
		('omnivore')
	;

	SELECT * FROM tbl_order

	INSERT INTO tbl_care
		(care_id, care_type, care_specialist)
		VALUES
		('care_0', 'replace the straw', 1),
		('care_1', 'repair toys', 4),
		('care_2', 'feed vitamins', 1),
		('care_3', 'human contact', 2),
		('care_4', 'clean animal waste', 1),
		('care_5', 'move to exercise pen', 3),
		('care_6', 'drain and refill aquarium', 1),
		('care_7', 'dental work', 3)
	;

	SELECT * FROM tbl_care;

	INSERT INTO tbl_nutrition
		(nutrition_type, nutrition_cost)
		VALUES
		('raw fish', 1500),
		('living rodents', 600),
		('mixture of fruit and rice', 800),
		('bottled milk', 600),
		('syringe feed broth', 600),
		('lard and seed mix', 300),
		('aphids', 150),
		('vitamins and marrow', 3500)
	;

	SELECT * FROM tbl_nutrition;

	INSERT INTO tbl_habitat
		(habitat_type, habitat_cost)
		VALUES
		('tundra', 40000),
		('grassy gnoll', 12000),
		('10ft pond w/ rocks', 30000),
		('ice aquarium', 50000),
		('grassland', 50000),
		('netted forest', 10000),
		('jungle', 15000),
		('cliff face', 15000)
	;

	SELECT * FROM tbl_habitat;

	INSERT INTO tbl_specialist
		(specialist_fname, specialist_lname, specialist_contact)
		VALUES
		('marge', 'nyguen', '457-224-6643'),
		('mary', 'fischer', '445-345-3345'),
		('arnold', 'holden', '457-224-6642'),
		('ken', 'byesan', '457-224-6641'),
		('delmonte', 'fyedo', '457-224-6443')
	;


	SELECT * FROM tbl_specialist;

	CREATE TABLE tbl_species (
		species_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		species_name VARCHAR(50) NOT NULL,
		species_animalia INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_order INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_nutrition INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

	SELECT * FROM tbl_care;

	INSERT INTO tbl_species
		(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
		VALUES
		('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
		('jaguar',     1, 102, 1, 5007, 2200, 'care_4'),
		('penguin',    1, 100, 1, 5003, 2200, 'care_6'),
		('ghost bat',  1, 102, 1, 5007, 2204, 'care_2'),
		('chicken',    1, 100, 3, 5001, 2205, 'care_0'),
		('panda',      1, 102, 3, 5006, 2202, 'care_4'),
		('bobcat',     1, 102, 1, 5001, 2204, 'care_5'),
		('grey wolf',  1, 102, 1, 5000, 2201, 'care_4') 
	;

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

	SELECT 
		a1.species_name, a2.habitat_type, a2.habitat_cost, a3.nutrition_type, a3.nutrition_cost
		FROM tbl_species a1
		INNER JOIN tbl_habitat   a2 on a2.habitat_id   = a1.species_habitat
		INNER JOIN tbl_nutrition a3 on a3.nutrition_id = a1.species_nutrition
		WHERE species_name = 'ghost bat'
	;