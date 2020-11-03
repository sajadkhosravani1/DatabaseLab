# Experiment #3
In this experiment we are going to change tables structure in order to:
- Reference some column to another column in another table as `foreign key`. 
- Add `check` constraint to some column so that the column
 only accept values that have some specific conditions. 


## 1- Determine Foreign key in each table.

Highlighted columns in each table is referring to a column in another
table, which means they should be defined as foreign key.

Author (AuthorID, AuthorFirstName , AuthorLastName):
- No foreign key.

Publisher (PublisherID, PublisherName)
- No foreign key.

Category (CategoryID, CategoryDescription)
- No foreign key.

BookTitle (ISBN_Number, Title, `PublisherID`, Date_of_Published, Pages, Price, Comment)
- PublisherID references to PublisherID column at Publisher
table.

Book_Author (`ISBN_Number`, `AuthorID`)
- ISBN_Number references to ISBN_Number column at
Booktitle table.
- AutherID references to AutherID colums at Auther table.

Book_Category (`ISBN_Number`, `CategoryID`)
- ISBN_Number references to ISBN_Number column at
Booktitle table.
- CategoryID references to CategoryID column at Category
table. 