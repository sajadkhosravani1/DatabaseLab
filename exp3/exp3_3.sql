USE BOOK_961120013;

ALTER TABLE BookTitle
ADD CHECK (ISBN_Number RLIKE "^[0-9]{9}$");

ALTER TABLE BookTitle
ADD CHECK (Date_of_Published <= NOW());


