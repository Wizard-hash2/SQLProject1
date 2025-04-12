mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| dtb                |
| information_schema |
| library            |
| mysql              |
| performance_schema |
| plp                |
| sakila             |
| sys                |
+--------------------+
8 rows in set (0.00 sec)

mysql> create database BookCommerce;
Query OK, 1 row affected (0.02 sec)

mysql> use BookCommerce;
Database changed
mysql> CREATE TABLE Book (
    ->     BookId INT PRIMARY KEY,
    ->     BookName VARCHAR(255) NOT NULL,
    ->     LangId INT,
    ->     PublisherId INT,
    ->     FOREIGN KEY (LangId) REFERENCES Book_Language(LangId),
    ->     FOREIGN KEY (PublisherId) REFERENCES Publisher(PublisherId)
    -> );
ERROR 1824 (HY000): Failed to open the referenced table 'book_language'
mysql> CREATE TABLE Book_Language (
    ->     LangId INT PRIMARY KEY,
    ->     LangName VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Publisher (
    ->     PublisherId INT PRIMARY KEY,
    ->     PublisherName VARCHAR(255) NOT NULL
    ->     
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql> CREATE TABLE Publisher (
    ->     PublisherId INT PRIMARY KEY,
    ->     PublisherName VARCHAR(25) NOT NULL
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Book (
    ->     BookId INT PRIMARY KEY,
    ->     BookName VARCHAR(255) NOT NULL,
    ->     LangId INT,
    ->     PublisherId INT,
    ->     FOREIGN KEY (LangId) REFERENCES Book_Language(LangId),
    ->     FOREIGN KEY (PublisherId) REFERENCES Publisher(PublisherId)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE Author (
    ->     AuthorId INT PRIMARY KEY,
    ->     AuthorName VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE Book_Author (
    ->     BookAuthorID INT PRIMARY KEY,
    ->     BookId INT,
    ->     AuthorId INT,
    ->     FOREIGN KEY (BookId) REFERENCES Book(BookId),
    ->     FOREIGN KEY (AuthorId) REFERENCES Author(AuthorId)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE Customer (
    ->     CustomerId INT PRIMARY KEY,
    ->     CustomerName VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE Customer_Address (
    ->     CustAddressId INT PRIMARY KEY,
    ->     CustomerId INT,
    ->     AddressStatusId INT,
    ->     FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    ->     FOREIGN KEY (AddressStatusId) REFERENCES Address_Status(AddressStatusId)
    -> );
ERROR 1824 (HY000): Failed to open the referenced table 'address_status'
mysql> CREATE TABLE Address_Status (
    ->     AddressStatusId INT PRIMARY KEY,
    ->     AddressStatus VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Customer_Address (
    ->     CustAddressId INT PRIMARY KEY,
    ->     CustomerId INT,
    ->     AddressStatusId INT,
    ->     FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    ->     FOREIGN KEY (AddressStatusId) REFERENCES Address_Status(AddressStatusId)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> CREATE TABLE Country (
    ->     CountryId INT PRIMARY KEY,
    ->     CountryName VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> CREATE TABLE Address (
    ->     CustAddressId INT PRIMARY KEY,
    ->     AddressName VARCHAR(255) NOT NULL,
    ->     CountryId INT,
    ->     FOREIGN KEY (CountryId) REFERENCES Country(CountryId)
    -> );
Query OK, 0 rows affected (0.05 sec)


mysql> CREATE TABLE Shipping_Method (
    ->     ShippingId INT PRIMARY KEY,
    ->     ShippingName VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Order_History (
    ->     OrderHistId INT PRIMARY KEY,
    ->     OrderHistoryName VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Order_Status (
    ->     OrderStatusId INT PRIMARY KEY,
    ->     OrderStatusName VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

 mysql> CREATE TABLE Order_Line (
    ->     OrderLineId INT PRIMARY KEY,
    ->     OrderId INT,
    ->     BookId INT,
    ->     BookName VARCHAR(255),
    ->     
    ->     FOREIGN KEY (BookId) REFERENCES Book(BookId)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE Cust_Order (
    ->     OrderId INT PRIMARY KEY,
    ->     CustomerId INT,
    ->     OrderLineId INT,
    ->     ShippingId INT,
    ->     OrderHistId INT,
    ->     OrderStatusId INT,
    ->     FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    ->     FOREIGN KEY (OrderLineId) REFERENCES Order_Line(OrderLineId),
    ->     FOREIGN KEY (ShippingId) REFERENCES Shipping_Method(ShippingId),
    ->     FOREIGN KEY (OrderHistId) REFERENCES Order_History(OrderHistId),
    ->     FOREIGN KEY (OrderStatusId) REFERENCES Order_Status(OrderStatusId)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> SHOW TABLES;
+------------------------+
| Tables_in_bookcommerce |
+------------------------+
| address                |
| address_status         |
| author                 |
| book                   |
| book_author            |
| book_language          |
| country                |
| cust_order             |
| customer               |
| customer_address       |
| order_history          |
| order_line             |
| order_status           |
| publisher              |
| shipping_method        |
+------------------------+
15 rows in set (0.01 sec)

mysql> SET FOREIGN_KEY_CHECKS=0;

Query OK, 0 rows affected (0.00 sec)

mysql> INSERT INTO Book (BookId, BookName, LangId, PublisherId)
    -> VALUES 
    -> (1, 'Adventures of AI', 1, 1),
    -> (2, 'Data Science Insights', 2, 2),
    -> (3, 'Mystery in the Jungle', 3, 3);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Book_Author (BookAuthorID, BookId, AuthorId)
    -> VALUES 
    -> (1, 1, 1),
    -> (2, 2, 2),
    -> (3, 3, 3);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Author (AuthorId, AuthorName)
    -> VALUES 
    -> (1, 'Alice Brown'),
    -> (2, 'John Doe'),
    -> (3, 'Sarah Wangari');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Book_Language (LangId, LangName)
    -> VALUES 
    -> (1, 'English'),
    -> (2, 'French'),
    -> (3, 'Swahili');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Publisher (PublisherId, PublisherName)
    -> VALUES 
    -> (1, 'Tech Press'),
    -> (2, 'Global Reads'),
    -> (3, 'African Tales');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Customer (CustomerId, CustomerName)
    -> VALUES 
    -> (1, 'Tom Karanja'),
    -> (2, 'Lisa Muthoni'),
    -> (3, 'Steve Nyaga');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Customer_Address (CustAddressId, CustomerId, AddressStatusId)
    -> VALUES 
    -> (1, 1, 1),
    -> (2, 2, 2),
    -> (3, 3, 1);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Address_Status (AddressStatusId, AddressStatus)
    -> VALUES 
    -> (1, 'Current'),
    -> (2, 'Old');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Address (CustAddressId, AddressName, CountryId)
    -> VALUES 
    -> (1, '123 Elm Street', 1),
    -> (2, '456 Pine Avenue', 2),
    -> (3, '789 Acacia Road', 3);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Country (CountryId, CountryName)
    -> VALUES 
    -> (1, 'Kenya'),
    -> (2, 'USA'),
    -> (3, 'UK');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Cust_Order (OrderId, CustomerId, OrderLineId, ShippingId, OrderHistId, OrderStatusId)
    -> VALUES 
    -> (1, 1, 1, 1, 1, 1),
    -> (2, 2, 2, 2, 2, 2),
    -> (3, 3, 3, 3, 3, 3);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Order_Line (OrderLineId, OrderId, BookId, BookName)
    -> VALUES 
    -> (1, 1, 1, 'Adventures of AI'),
    -> (2, 2, 2, 'Data Science Insights'),
    -> (3, 3, 3, 'Mystery in the Jungle');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Shipping_Method (ShippingId, ShippingName)
    -> VALUES 
    -> (1, 'Standard'),
    -> (2, 'Express'),
    -> (3, 'Overnight');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Order_History (OrderHistId, OrderHistoryName)
    -> VALUES 
    -> (1, 'Ordered'),
    -> (2, 'Cancelled'),
    -> (3, 'Delivered');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Order_Status (OrderStatusId, OrderStatusName)
    -> VALUES 
    -> (1, 'Pending'),
    -> (2, 'Shipped'),
    -> (3, 'Delivered');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> set FOREIGN_KEY_CHECKS=1;
Query OK, 0 rows affected (0.00 sec)

mysql> create role ADMIN;
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT SELECT, UPDATE, DELETE, INSERT ON bookcommerce.* TO ADMIN;
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE ROLE CUSTOMERS;
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT select on cust_order to CUSTOMERS;
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE ROLE ORDERMANAGER;
Query OK, 0 rows affected (0.01 sec)


mysql> GRANT SELECT, UPDATE ON ORDER_STATUS TO ORDERMANAGER;
Query OK, 0 rows affected (0.00 sec)

mysql> GRANT SELECT, UPDATE ON ORDER_LINE TO ORDERMANAGER;
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE ROLE SHIPMANAGER;
Query OK, 0 rows affected (0.01 sec)

mysql> notee;

mysql> create user 'Aron' identified by '1234';
Query OK, 0 rows affected (0.01 sec)

mysql> grant ADMIN TO Aron;
Query OK, 0 rows affected (0.01 sec)

mysql> create user 'Ngeno' identified by '1234';
Query OK, 0 rows affected (0.02 sec)

mysql> grant CUSTOMER TO NGENO;
ERROR 3523 (HY000): Unknown authorization ID `NGENO`@`%`

mysql> grant CUSTOMERS TO Ngeno;
Query OK, 0 rows affected (0.01 sec)
