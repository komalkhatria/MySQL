CREATE DATABASE Company;
USE Company;

CREATE TABLE Employees(EmployeeID int, FirstName varchar(50), 
LastName varchar(50), Position varchar(50),
Salary float(10,2), HireDate date);

DESC Employees;

INSERT INTO Employees(EmployeeID, FirstName, LastName, Position, Salary, HireDate) VALUES 
(101, 'John', 'Doe', 'Developer', 60000, '2020-03-15'), 
(102, 'Jane', 'Smith', 'Manager', 75000, '2019-06-01'),
(103, 'Emily', 'Johnson', 'Developer', 58000, '2018-11-22'),
(104, 'Michael', 'Brown', 'Intern', 30000, '2022-01-10'),
(105, 'Sarah', 'Davis', 'Designer', 55000, '2021-07-30'),
(106, 'David', 'Wilson', 'Developer', 62000, '2021-05-25'), 
(107, 'Laura', 'Martinez', 'Manager', 70000, '2017-12-15'),
(108, 'James', 'Anderson', 'Intern', 29000, '2023-02-20'),
(109, 'Lisa', 'Thomas', 'Designer', 50000, '2020-09-10'),
(110, 'Kevin', 'Taylor', 'Developer', 64000, '2022-04-05');

SELECT * FROM Employees;

SELECT FirstName, LastName FROM Employees;

SELECT * FROM Employees WHERE EmployeeID=101;

SELECT * FROM Employees WHERE Salary>50000;

SELECT COUNT(*) FROM Employees WHERE Position='Manager';

SELECT MAX(SALARY) FROM Employees;

SELECT * FROM Employees WHERE HireDate>'2020-01-01';

SELECT * FROM Employees ORDER BY LastName ASC;

SELECT AVG(Salary) FROM Employees;

DELETE FROM Employees WHERE EmployeeID=105;

DELETE FROM Employees WHERE Position='Intern';

UPDATE Employees SET Salary=60000 WHERE EmployeeID=103;

UPDATE Employees SET Position='Developer' WHERE Position='Junior Developer';

UPDATE Employees SET Salary= Salary+ (Salary*0.10) WHERE
HireDate<'2019-01-01';

ALTER TABLE Employees ADD COLUMN Email varchar(50);

ALTER TABLE Employees MODIFY COLUMN Salary decimal(12,2);

ALTER TABLE Employees CHANGE LastName FamilyName varchar(50);

ALTER TABLE Employees DROP COLUMN Email;