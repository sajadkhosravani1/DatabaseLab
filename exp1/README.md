# Experiment #1
This experiment is asked from us to create corresponding tables of the following relations :


`Author (AuthorID, AuthorFirstName , AuthorLastName )`

`BookTitle (ISBN_Number, Title, PublisherID , Date_of_Published , Pages , Price ,Comment )`

`Publisher (PublisherID, PublisherName )`

`Category (CategoryID, CategoryDescription )`

`Book_Author (ISBN_Number, AuthorID )`

`Book_Category (ISBN_Number,CategoryID )`
`

| Column name         | Type         |          |
| ------------------- | ------------ | -------- |
| AuthorID            | INT          | NOT NULL |
| AuthorFirstName     | VARCHAR(20)  | NOT NULL |
| AuthorLastName      | VARCHAR(30)  | NOT NULL |
| ISBN_Number         | NCHAR(12)    | NOT NULL |
| Title               | VARCHAR(50)  | NOT NULL |
| Date_of_Published   | DATETIME     | NULL     |
| Pages               | INT          | NULL     |
| Price               | MONEY        | NULL     |
| Comment             | VARCHAR(100) | NULL     |
| PublisherID         | INT          | NOT NULL |
| PublisherName       | VARCHAR(50)  | NOT NULL |
| CategoryID          | INT          | NOT NULL |
| CategoryDescription | VARCHAR(50)  | NOT NULL |

## Solvation
SQL code is prepared. Check it out [here](exp1.sql). 
Note:
 - The code is written for MySQL (Version 8.0).
For other DBMSes you need to change data types.
If you need to change data types check [this page](https://www.w3schools.com/sql/sql_datatypes.asp) out
 - If you haven't created a database yet, use `CREATE DATABASE <name>`
 - In the begin of [sql file](exp1.sql) 
`USE BOOK_961120013;`
is used. It selects the data base which you want to create tables in.
Change `BOOK_961120013` to your data base name.
 - Data type of price column is `MONEY`. 
MySQL doesn't support MONEY data type (How ever Microsoft SQL Server does).
Oftenly `DECIMAL(size, d)` is used for monetary fields in MySQL. where: 
    - size represents the precision (total length of value including decimal places)
    - d represents the number of digits after decimal point

### Executing the file
Finally we need to execute the sql codes from file. by following command in bash:
```bash
sudo mysql -v BOOK_961120013 < exp1.sql
```
Since `-v` mode is on, bash will report you what ever happens. 
for me bash reported some thing like this :

--------------
```sql
CREATE TABLE Publisher(
	PublisherID INT NOT NULL, 
	PublisherName VARCHAR(50) NOT NULL,
	PRIMARY KEY(PublisherID)
)
```
--------------

--------------
```sql
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
)
```
--------------

--------------
```sql
CREATE TABLE Author(
	AuthorID INT NOT NULL,
	AuthorFirstName VARCHAR(20) NOT NULL, 
	AuthorLastName VARCHAR(30) NOT NULL,
	PRIMARY KEY(AuthorID)
)
```
--------------

--------------
```sql
CREATE TABLE Category(
	CategoryID INT NOT NULL,
	CategoryDescription VARCHAR(50) NOT NULL,
	PRIMARY KEY(CategoryID)
)
```
--------------

--------------
```sql
CREATE TABLE Book_Author(
	ISBN_Number NCHAR(13) NOT NULL,
	AuthorID INT NOT NULL,
	FOREIGN KEY (ISBN_Number) REFERENCES BookTitle(ISBN_Number) ON DELETE CASCADE,
	FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID) ON DELETE CASCADE
)
```
--------------

--------------
```sql
CREATE TABLE Book_Category(
	ISBN_Number NCHAR(13) NOT NULL,
	CategoryID INT NOT NULL,
	FOREIGN KEY (ISBN_Number) REFERENCES BookTitle(ISBN_Number) ON DELETE CASCADE,
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) ON DELETE CASCADE
)
```
--------------

## Checking the result
Finally we want to check results from MySQL command line.
First we have to open MySQL command line.
If you don't know how to open MySQL command line check out
 [this page](https://dev.mysql.com/doc/refman/8.0/en/mysql.html).
And then we use following commands to check each table features. 

### viewing tables
```sql
SHOW TABLES;
```
The result will be like this:

| Tables_in_BOOK_961120013 |
| ------------------------ |
| Author                   |
| BookTitle                |
| Book_Author              |
| Book_Category            |
| Category                 |
| Publisher                |

```sql
SHOW COLUMNS FROM Author;
```
The result will be like this:

| Field           | Type        | Null | Key | Default | Extra |
| ----------------|-------------|------|-----|---------|-------|
| AuthorID        | int         | NO   | PRI | NULL    |       |
| AuthorFirstName | varchar(20) | NO   |     | NULL    |       |
| AuthorLastName  | varchar(30) | NO   |     | NULL    |       |


```sql
SHOW COLUMNS FROM BookTitle;
```
| Field             | Type          | Null | Key | Default | Extra |
|-------------------|---------------|------|-----|---------|-------|
| ISBN_Number       | char(13)      | NO   | PRI | NULL    |       |
| Title             | varchar(50)   | NO   |     | NULL    |       |
| PublisherID       | int           | NO   | MUL | NULL    |       |
| Date_of_Published | datetime      | YES  |     | NULL    |       |
| Pages             | int           | YES  |     | NULL    |       |
| Price             | decimal(20,2) | YES  |     | NULL    |       |
| Comment           | varchar(100)  | YES  |     | NULL    |       |

```sql
SHOW COLUMNS FROM Book_Author;
```

| Field       | Type     | Null | Key | Default | Extra |
|-------------|----------|------|-----|---------|-------|
| ISBN_Number | char(13) | NO   | MUL | NULL    |       |
| AuthorID    | int      | NO   | MUL | NULL    |       |


```sql
SHOW COLUMNS FROM Book_Category;
```

| Field       | Type     | Null | Key | Default | Extra |
|-------------|----------|------|-----|---------|-------|
| ISBN_Number | char(13) | NO   | MUL | NULL    |       |
| CategoryID  | int      | NO   | MUL | NULL    |       |


```sql
SHOW COLUMNS FROM Category;
```
| Field               | Type        | Null | Key | Default | Extra |
|---------------------|-------------|------|-----|---------|-------|
| CategoryID          | int         | NO   | PRI | NULL    |       |
| CategoryDescription | varchar(50) | NO   |     | NULL    |       |

```sql
SHOW COLUMNS FROM Publisher;
```
| Field         | Type        | Null | Key | Default | Extra |
|---------------|-------------|------|-----|---------|-------|
| PublisherID   | int         | NO   | PRI | NULL    |       |
| PublisherName | varchar(50) | NO   |     | NULL    |       |
