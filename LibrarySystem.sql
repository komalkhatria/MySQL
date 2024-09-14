CREATE DATABASE LibrarySystem;
USE LibrarySystem;

CREATE TABLE Books(book_id int, title varchar(150),
author varchar(150), publisher varchar(100), date_of_publication date, quantity int);

CREATE TABLE Members(member_id int, member_name varchar(100), email varchar(100),
phone varchar(15), membership_date date);

CREATE TABLE BorrowedBooks(borrow_id int, book_id int,
member_id int, borrow_date date, due_date date,
return_date date);

INSERT INTO Books(book_id, title, author, publisher, 
date_of_publication, quantity) values (1, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951-10-12', 5),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', '1960-09-21', 3),
(3, '1984', 'George Orwell', 'Secker & Warburg', '1949-07-30', 4),
(4, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton', '1813-06-29', 6),
(5, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner\'s Sons', '1925-03-10', 2);

INSERT INTO Members(member_id, member_name, email, phone, membership_date)
values(1, 'John Doe', 'john.doe@example.com', '9876543210', '2023-01-10'),
(2, 'Jane Smith', 'jane.smith@example.com', '8765432109', '2023-02-14'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '7654321098', '2023-03-01');

INSERT INTO BorrowedBooks(borrow_id, book_id, member_id,
borrow_date, due_date, return_date) values(1, 1, 1, '2023-08-01', '2023-08-15', NULL),
(2, 2, 2, '2023-07-20', '2023-08-03', '2023-08-02'),  
(3, 3, 3, '2023-08-05', '2023-08-19', NULL);  

SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM BorrowedBooks;

INSERT INTO Books(book_id, title, author, publisher, date_of_publication) 
values(6, 'The Power of Subconscious Mind', 'Unknown', 'Secker & Warburg', '2001-10-25');

INSERT INTO Members(member_id, member_name, email, phone) values
(4, 'Peter Kavinsky', 'peter.kavinsky@gmail.com', '7864963764');

SELECT * FROM BorrowedBooks WHERE return_date is NULL;

SELECT * FROM BorrowedBooks WHERE member_id=3;

UPDATE Members SET email='smith.jane@yahoo.com' WHERE member_id=2;

UPDATE BorrowedBooks SET due_date='2023-08-22'
WHERE borrow_id=1;

DELETE FROM BorrowedBooks WHERE return_date IS NOT NULL;

UPDATE Books SET title='Pride and Prejudice 2'
WHERE book_id=4;

DELETE FROM Members WHERE member_id=1;

DELETE FROM Books WHERE quantity=0;

DELETE FROM BorrowedBooks WHERE (due_date - borrow_date)>30;

ALTER TABLE Members MODIFY email varchar(50);
DESC Members;

ALTER TABLE BorrowedBooks CHANGE borrow_date issue_date date;
DESC BorrowedBooks;

ALTER TABLE BorrowedBooks DROP COLUMN due_date;