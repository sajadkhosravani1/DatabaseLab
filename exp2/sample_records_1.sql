USE BOOK_961120013;

-- Insert sample publisher
INSERT INTO Publisher VALUES (1, "Publisher A");
INSERT INTO Publisher VALUES (2, "Publisher B");

-- Insert sample bookTitle
INSERT INTO BookTitle VALUES ("1234567891234", "The art of thinking clearly", 1, '2013-11-05 14:29:36',
 1000, 100, "The Art of Thinking Clearly is a 2013 book by the Swiss writer.");

INSERT INTO BookTitle VALUES ("1234567891235", "The Alchemist", 2, '1988-11-05 14:29:36',
 190, 21, "The Alchemist is a novel by Brazilian author Paulo Coelho.");

-- Insert sample Author
INSERT INTO Author VALUES (1, "Paulo", "Coelho");
INSERT INTO Author VALUES (2, "Rolf", "Dobelli");

-- Insert sample Category
INSERT INTO Category VALUES (1, "Novel");
INSERT INTO Category VALUES (2, "Psychology");

-- Insert sample Book_Author
INSERT INTO Book_Author VALUES ("1234567891234", 2);
INSERT INTO Book_Author VALUES ("1234567891235", 1);

-- Insert sample Book_Category
INSERT INTO Book_Category VALUES ("1234567891234", 2);
INSERT INTO Book_Category VALUES ("1234567891235", 1);
