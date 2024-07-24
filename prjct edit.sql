create database Library;
use Library;
create table Branchs( Branch_no int auto_increment primary key,
Manage_ID int,Address varchar
(200), Contact_no int);
insert into Branchs(Manage_ID,Address,Contact_no)
values(1,'Dubai-public',05588789),
(2,'Al Tawar',023659),
(5,'Al mamzar beach',012356),
(4,'Al mankhool',056148), 
(6,'Al rashidiya',05698745),
(7,'DWC knowledge',4569325),
(8,'UMM suquien',6347895),
(9,'House of wisdom',3156400),
(10,'Khalifa park library',5632470),
(1,'Al Oqoud',2300456);
select*from Branchs;

create table Employe(Customer_Id int auto_increment primary key,
Customer_name  varchar(100),
Customer_address  varchar(200),
Reg_date date);
drop table Employe;
create table  Employe( 
Emp_Id int auto_increment primary key,
Emp_name  varchar(50),
Position_area varchar(50),
Salary decimal(10,3),
 Branch_no int,foreign key (Branch_no) references Branch(Branch_no));
 insert into Employe( Emp_name,
Position_area ,
Salary ,
 Branch_no)
 values
 ('Basheer-Uv','Manager',75000,1),
 ('Maimoona_nazar','Asst_Manager',55000,2),
 ('Sijas s','Branch Manager',45000,3),
 ('Arunjith','Librarian',45000,4),
 ('Luca','Childrens_librarian',52000,5),
 ('Faizal','Teeans_manager',65000,6),
 ('Aslam','Branch_coordinator',360000,7),
 ('Kiran','Classsic_librarian',96000,8),
 ('Jaffer','Branch_manager',450000,9),
 ('Sajna','Librarian',25000,10);
 select*from Employe;
 
 create table Books(
 ISBN int primary key,
Book_title varchar(250) not null,
Category  varchar(50),
Rental_Price  decimal(10,2),
Status enum('yes','no') default 'yes',
Author  varchar(100),
Publisher varchar (255) );

alter table Books modify ISBN varchar(255);
insert into Books(ISBN,Book_title,Category,Rental_Price,Status,Author,Publisher)
 values 
 ('789-456-321','The Grass is Always Greener',	'Modern Times',10,'yes', 'Jeffrey Archer','Alyson Books'),
 ('1-86092-012-8','Murder','Crime',5.5,'no','Arnold Bennett (1867-1931)','DC Books'),
 ('	1-86092-006-3','An Occurrence at Owl Creek Bridge One of the Missing','Adventure',6.5,'yes','Ambrose Bierce','Apress'),
 ('1-86092-022-5','A Boy at Seven','Classic',7,'no','A. E. Coppard','Apress'),
 ('1-86092-025-x','	The Open Boat','Classic',5,'yes','A. E. Coppard','Baker Publishing Group'),
 ('	1-86092-031-4','The Five Orange Pips','Crime',10,'no','Arthur Conan Doyle','Baker Publishing Group'),
 ('1-86092-014-4','The Hostage','	Adventure',8,'yes','C. S. Forester','DC Books'),
 ('	1-86092-050-0','	The Dancing Partner: Clocks','Comedy',5,'yes','Jerome K. Jerome','DC Books'),
 ('	1-86092-007-1','The Rocking-Horse Winner','Classic',6,'no','D. H. Lawrence','DC  Books');
 desc Books;
 select* from Books;
 
 create table Customer (Customer_id int primary key ,
 Customer_Name varchar (250),
 Customer_Add varchar (100),
 Reg_Date date);
 desc Customer;
 insert into Customer(Customer_id,Customer_Name,Customer_Add,Reg_Date)
 values
 (151,'Malathi_s','Al Nahda-1','2024-01-06'),
(152,'Aira Dilshad','Al Tawun','2022-1-05'),
(153,'Basheer_s','Rolla-58','2024-02-16'),
(156,'Maimoona','Al ghurair',' 2020-09-04)'),
(157,'Sijas','Al Tawun', '2015-05-01'),
(160,'Kalyani','Terminal_1','2024-03-15  '),
(165,'Safwan','Muwellia','2022-11-23'),
(168,'Mushaib','Ras al Qaima','2024-06-06');

select*from Customer;
create table IssueStatus(Issue_Id INT PRIMARY KEY,
 Issued_custid int,
 Issued_book_name VARCHAR(255),
 Issue_date DATE,
 Isbn_book  varchar (250),
 FOREIGN KEY (Issued_custid) references Customer (Customer_id),
 FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN));
 desc Customer;
 desc IssueStatus;
 insert into IssueStatus(Issue_id,Issued_custid,Issued_book_name,Issue_date,Isbn_book)
 values
 (805,151,'The Rocking-Horse Winner', '2023-12-03 ','	1-86092-007-1');
  insert into IssueStatus(Issue_id,Issued_custid,Issued_book_name,Issue_date,Isbn_book)
 values
 (806,152,'	The Dancing Partner: Clocks', '2024-01-03 ','	1-86092-050-0');
  insert into IssueStatus(Issue_id,Issued_custid,Issued_book_name,Issue_date,Isbn_book)
 values
 (807,160,'The Grass is Always Greener', '2024-06-11 ','789-456-321');
  insert into IssueStatus(Issue_id,Issued_custid,Issued_book_name,Issue_date,Isbn_book)
 values
 (808,156,'A Boy at Seven', '2024-05-07 ','1-86092-022-5');
  insert into IssueStatus(Issue_id,Issued_custid,Issued_book_name,Issue_date,Isbn_book)
 values
 (809,157,'The Hostage','2021-12-12','1-86092-014-4');
  insert into IssueStatus(Issue_id,Issued_custid,Issued_book_name,Issue_date,Isbn_book)
 values
 (810,160,'An Occurrence at Owl Creek Bridge One of the Missing','2024-11-12','	1-86092-006-3');
 
 select*from IssueStatus;
 
 create table Return_status(Return_Id INT PRIMARY KEY,
 Return_cust INT,
 Return_book_name VARCHAR(255),
 Return_date DATE,
 Isbn_book2 varchar (250),
 FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_id),
 FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN));
 desc Return_status;
  
  insert into Return_status(Return_Id,Return_cust,Return_book_name,Return_date,Isbn_book2)
  values
 ( 905,151,'The Rocking-Horse Winner', '2024-12-03 ','	1-86092-007-1'),
 (906,152,'	The Dancing Partner: Clocks', '2024-02-03','	1-86092-050-0'),
 (907,160,'The Grass is Always Greener', '2024-07-11 ','789-456-321'),
 (908,156,'A Boy at Seven', '2024-07-07 ','1-86092-022-5'),
 (909,157,'The Hostage','2022-12-12','1-86092-014-4'),
(910,160,'An Occurrence at Owl Creek Bridge One of the Missing','2024-12-12','	1-86092-006-3');


select*from  Return_status;

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

SELECT Emp_name, Salary
FROM Employe
ORDER BY Salary DESC;

SELECT Books.Book_title, Customer.Customer_Name
FROM Books
JOIN IssueStatus ON Books.ISBN = IssueStatus.Isbn_book
JOIN Customer ON IssueStatus.Issued_custid = Customer.Customer_Id;
 
 SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

SELECT Emp_name, Position_area
FROM Employe
WHERE Salary > 50000;

SELECT Customer_Name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_id NOT IN (SELECT Issued_custid FROM IssueStatus);

SELECT Branch_no, COUNT(*) AS Total_Employs
FROM Employe
GROUP BY Branch_no;

SELECT Customer.Customer_Name
FROM Customer
JOIN IssueStatus ON Customer.Customer_id = IssueStatus.Issued_custid
WHERE Issue_date BETWEEN '2024-06-01' AND '2024-06-30';

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employe
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT e.Emp_name, b.Address
FROM Employe e
JOIN Branchs b ON e.Emp_Id = b.Manage_ID;

SELECT DISTINCT Customer.Customer_Name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_custid
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
WHERE Books.Rental_Price > 6.5;