USE BOOK_961120013;

CREATE TABLE Publisher(
	PublisherID INT NOT NULL, 
	PublisherName VARCHAR(50) NOT NULL,
	PRIMARY KEY(PublisherID)
);

CREATE TABLE BookTitle(
	ISBN_Number NCHAR(13) NOT NULL ,
	Title VARCHAR(50) NOT NULL,
	PublisherID INT NOT NULL,
	Date_of_Published DATETIME,
	Pages INT,
	Price DECIMAL(20,2), 
	Comment VARCHAR(100),
	PRIMARY KEY(ISBN_Number),
	FOREIGN KEY(PublisherID) REFERENCES Publisher(PublisherID) ON DELETE CASCADE
);

CREATE TABLE Author(
	AuthorID INT NOT NULL,
	AuthorFirstName VARCHAR(20) NOT NULL, 
	AuthorLastName VARCHAR(30) NOT NULL,
	PRIMARY KEY(AuthorID)
);

CREATE TABLE Category(
	CategoryID INT NOT NULL,
	CategoryDescription VARCHAR(50) NOT NULL,
	PRIMARY KEY(CategoryID)
);

CREATE TABLE Book_Author(
	ISBN_Number NCHAR(13) NOT NULL,
	AuthorID INT NOT NULL,
	FOREIGN KEY (ISBN_Number) REFERENCES BookTitle(ISBN_Number) ON DELETE CASCADE,
	FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID) ON DELETE CASCADE
);	

CREATE TABLE Book_Category(
	ISBN_Number NCHAR(13) NOT NULL,
	CategoryID INT NOT NULL,
	FOREIGN KEY (ISBN_Number) REFERENCES BookTitle(ISBN_Number) ON DELETE CASCADE,
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) ON DELETE CASCADE
);