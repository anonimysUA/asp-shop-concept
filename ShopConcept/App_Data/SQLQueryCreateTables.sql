CREATE DATABASE ShopData
ON
(
NAME = 'ShopData',
FILENAME = 'D:\C#\Dima\C#\REAL_Proj\ShopConcept\ShopConcept\App_Data\ShopData.mdf',
SIZE = 10MB,
FILEGROWTH = 10MB
)
LOG ON
(
NAME = 'LogShopData',
FILENAME = 'D:\C#\Dima\C#\REAL_Proj\ShopConcept\ShopConcept\App_Data\ShopData.ldf',
SIZE = 5MB,
FILEGROWTH = 5MB
)
COLLATE Cyrillic_General_CI_AS

EXECUTE sp_helpdb ShopData

USE ShopData 
GO



CREATE TABLE PRODUCTS
(
ProductID int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
DescriptionProd varchar(max) NOT NULL,
Name varchar(max) NOT NULL,
Price decimal NOT NULL,
ImageProd binary NULL,
DateLastUpdate date NOT NULL Default(GETDATE())
)

CREATE TABLE ROLES
(
RoleID int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
DescriptionProd varchar(max) NOT NULL
)

CREATE TABLE USERS
(
 UserID int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
 Login varchar(20) UNIQUE NOT NULL,
 Password varchar(30) NOT NULL,
 Name varchar(50) NOT NULL,
 Surname varchar(50) NOT NULL,
 Email varchar(50) UNIQUE NOT NULL,
 RegDate date NOT NULL Default(GETDATE()),
 Telephone varchar(50) NOT NULL,
 Role int NOT NULL DEFAULT(1) FOREIGN KEY REFERENCES ROLES(RoleID)
 )
 ALTER TABLE USERS
 ADD
 PRIMARY KEY(Login, Email)




CREATE TABLE ORDERS
(
OrderID int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
UserID int NOT NULL FOREIGN KEY REFERENCES USERS(UserID),
ProductID int NOT NULL FOREIGN KEY REFERENCES PRODUCTS(ProductID),
CountProducts int NOT NULL,
DateOrder date NOT NULL Default(GETDATE())
)


DROP DATABASE ShopData
Use msdb

DROP TABLE USERS
DROP TABLE ORDERS
DROP TABLE PRODUCTS
DROP TABLE ROLES

SELECT * FROM USERS
SELECT * FROM ORDERS
SELECT * FROM PRODUCTS
SELECT * FROM ROLES


INSERT INTO ROLES
(DescriptionProd)
VALUES
('User'),
('Admin'),
('Manager'),
('Block User');

INSERT INTO USERS
(Login, Password, Name, Surname, Email, Telephone)
VALUES
('admin', '111','Dmytro', 'Udielov', 'anonimys@meta.ua', '123-45-67'),
('Dima', '123', 'Dmytro', 'Udielov', 'ano@google.com', '123-45-67'),
('Sergey', '123', 'BlahBlah','SurBlahBla', 'awdsa@google.com', '123-45-67'),
('Masha', '123','BlahBlah','SurBlahBla', 'heros@google.com', '123-45-67'),
('Jenia', '123', 'BlahBlah','SurBlahBla','nomel@google.com', '123-45-67'),
('Hello', '123', 'BlahBlah','SurBlahBla', 'atack@google.com', '123-45-67');


