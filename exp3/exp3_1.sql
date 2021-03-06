USE BOOK_961120013;


ALTER TABLE BookTitle
ADD FOREIGN KEY(PublisherID) REFERENCES Publisher(PublisherID) ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE Book_Author
ADD FOREIGN KEY (ISBN_Number) REFERENCES BookTitle(ISBN_Number) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Book_Author
ADD FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID) ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE Book_Category
ADD FOREIGN KEY (ISBN_Number) REFERENCES BookTitle(ISBN_Number) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Book_Category
ADD FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) ON DELETE CASCADE ON UPDATE CASCADE;


