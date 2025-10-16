CREATE DATABASE bankloan;
USE bankloan;
-- creating table
create table Branch (
branch_name varchar (30) PRIMARY KEY,
branch_city varchar (50),
assets REAL
);
desc Branch;
create table BankAccount (
accno INT PRIMARY KEY,
branch_name VARCHAR (30),
balance REAL
);
desc BankAccount;
create table BankCustomer (
 customer_name VARCHAR(30) PRIMARY KEY,
    customer_street VARCHAR(30),
    customer_city VARCHAR(30)
);
desc BankCustomer;
create table Depositer (
 customer_name VARCHAR(30),
    accno INT,
    PRIMARY KEY (customer_name, accno),
    FOREIGN KEY (customer_name) REFERENCES BankCustomer(customer_name),
    FOREIGN KEY (accno) REFERENCES BankAccount(accno)
);
desc Depositer;
create table LOAN (
loan_number INT PRIMARY KEY,
branch_name VARCHAR(30),
amount REAL,
FOREIGN KEY (branch_name) references Branch(branch_name)
);
desc LOAN;
insert into Branch values 
('sbi_chamrajpet','bangalore',50000),
('sbi_residencyroad','bangalore',10000),
('sbi_shivajiroad','bombay',20000),
('sbi_parliamentroad','delhi',1000),
('sbi_jantarmantar','delhi',20000);
select * from Branch;
insert into BankAccount values
(1,'sbi_chamrajpet',2000),
(2,'sbi_residencyroad',5000),
(3,'sbi_shivajiroad',6000),
(4,'sbi_parliamentroad',9000),
(5,'sbi_jantarmantar',8000),
(6,'sbi_shivajiroad',4000),
(7,'sbi_residencyroad',4000),
(8,'sbi_parliamentroad',3000),
(9,'sbi_residencyroad',5000),
(10,'sbi_jantarmantar',2000),
(11,'sbi_residencyroad',7000);
select * from BankAccount;
insert into BankCustomer values 
('Avinash','bulltemple_road','bangalore'),
('Dinesh','bennergatta_road','bangalore'),
('Mohan','nationalcollege_road','bangalore'),
('Nikil','akbar_road','delhi'),
('Ravi','prithviraj_road','delhi');
INSERT INTO Depositer VALUES
('Avinash',1),
('Dinesh',2),
('Nikil',5),
('Ravi',4),
('Avinash',8),
('Nikil',9),
('Dinesh',10),
('Nikil',11);
insert into LOAN VALUES
(2,'sbi_residencyroad',2000),
(1,'sbi_chamrajpet',1000),
(3,'sbi_shivajiroad',4000),
(4,'sbi_parliamentroad',4000),
(5,'sbi_jantarmantar',5000);
COMMIT;
select * from BankCustomer;
select * from Depositer;
select * from LOAN;
select branch_name,(assets/100000) As 'Assets in Lakhs' from Branch;
select d.customer_name,
b.branch_name,
COUNT(d.accno) AS No_of_Accounts
From Depositer d
Join BankAccount b ON d.accno = b.accno
Group BY d.customer_name, b.branch_name
having count(d.accno) >=2;
Create View v3
AS select branch_name,amount
From LOAN
Where (amount>0.2);
select * from v3;




















