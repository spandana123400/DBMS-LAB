#CREATE DATABASE Spandana;
USE Spandana;
CREATE TABLE Taxpayer(
taxpayer_id INT PRIMARY KEY,
pan_number VARCHAR(10) NOT NULL UNIQUE,
full_name VARCHAR(100) NOT NULL,
date_of_birth DATE NOT NULL,
occupation VARCHAR(100),
annual_income DECIMAL(12,2) NOT NULL,
email VARCHAR(100) UNIQUE,
is_active BOOLEAN);
INSERT INTO Taxpayer
VALUES
(101,'ABCDE1234F','Ravi Kumar','1995-06-15','Software Engineer',850000.00,'ravi.kumar@example.com',TRUE);
INSERT INTO Taxpayer
VALUES(102,'bcdef2345g','Priya Sharma','1992-11-22','Doctor',1200000.00,'Priya.sharma@example.com',TRUE);
INSERT INTO Taxpayer
VALUES(103,'CDEFG3456H','Arjun Reddy','1988-03-10','Business Owner',1800000.00,'arjun.reddy@example.com',TRUE);
INSERT INTO Taxpayer
VALUES(104,'DEFGH4567J','Sneha Patel','1998-08-05','Teacher',6200000.00,'sneha.patel@example.com',TRUE);
INSERT INTO Taxpayer
VALUES(105,'EFGHJ5678K','Kiran Rao','1990-01-18','freelancer','750000.00','kiran.rao@example.com',TRUE);
INSERT INTO Taxpayer
VALUES(106,'FGHJK6789L','Meera Singh','1985-12-30','Consultant','1500000.00','meera.singh@example.com',FALSE);
SELECT*FROM Taxpayer;

CREATE TABLE Income_Category(
category_id INT PRIMARY KEY,
category_name VARCHAR(100) NOT NULL,
description VARCHAR(100) NOT NULL,
taxable BOOLEAN);
INSERT INTO Income_Category
VALUES(1,'Salary','Income received from employment',TRUE);
INSERT INTO Income_Category
VALUES(2,'Business','Income earned from business activities',TRUE);
INSERT INTO Income_Category
VALUES(3,'House Property','Income received from property or rent',TRUE);
INSERT INTO Income_Category
VALUES(4,'Capital Gains','Income from transfer of eligible assets',TRUE);
INSERT INTO Income_Category
VALUES(5,'Other Sources','Income such as bank interest',TRUE);
INSERT INTO Income_Category
VALUES(6,'Agriculture Income','Income from eligible agricultural activities',FALSE);
SELECT*FROM Income_Category;

USE Spandana;
CREATE TABLE Financial_Year(
year_id INT PRIMARY KEY,
year_label VARCHAR(9) NOT NULL UNIQUE,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
filing_deadline DATE ,
is_current BOOLEAN NOT NULL);
INSERT INTO Financial_Year
VALUES(1,'2020-2021','2020-04-01','2021-03-31','2021-07-31',FALSE);
INSERT INTO Financial_Year
VALUES(2,'2021-2022','2021-04-01','2022-03-31','2022-07-31',FALSE);
INSERT INTO Financial_Year
VALUES(3,'2022-2023','2022-04-01','2023-03-31','2023-07-31',FALSE);
INSERT INTO Financial_Year
VALUES(4,'2023-2024','2023-04-01','2024-03-31','2024-07-31',FALSE);
INSERT INTO Financial_Year
VALUES(5,'2024-2025','2024-04-01','2025-03-31','2025-07-31',FALSE);
INSERT INTO Financial_Year
VALUES(6,'2025-2026','2025-04-01','2026-03-31','2026-07-31',TRUE);
SELECT*FROM Financial_Year;

CREATE TABLE Income_Record(
income_id INT PRIMARY KEY,
taxpayer_id INT NOT NULL,
income_source VARCHAR(100) NOT NULL,
category_name VARCHAR(50) NOT NULL,
amount DECIMAL(12,2)  NOT NULL,
received_date DATE NOT NULL,
financial_year VARCHAR(9) NOT NULL);
INSERT INTO Income_Record
VALUES(1001,101,'Technova Solutions','Salary',850000.00,'2026-03-31','2025-2026');
INSERT INTO Income_Record
VALUES(1002,102,'City Care Hospital','Salary',1200000.00,'2026-03-31','2025-2026');
INSERT INTO Income_Record
VALUES(1003,103,'ReddyEnter Prices','Business',1800000.00,'2026-03-31','2025-2026');
INSERT INTO Income_Record
VALUES(1004,104,'Sunrise School','Salary',620000.00,'2026-03-31','2025-2026');
INSERT INTO Income_Record
VALUES(1005,105,'Web Design Projects','Business',750000.00,'2026-03-31','2025-2026');
INSERT INTO Income_Record
values(1006,106,'Professional Consulting','Business',1500000.00,'2026-03-31','2025-2026');
SELECT*FROM Income_Record;
INSERT INTO Taxpayer(taxpayer_id,pan_number,full_name,date_of_birth,occupation,annual_income,email,is_active)
VALUES(107,'GHJKL7890M','Rahul Sharma','1996-05-20','Accountant',600000.00,'rahul.sharma@example.com',TRUE);
UPDATE Taxpayer 
SET annual_income=950000.00
WHERE taxpayer_id=101;
UPDATE Taxpayer 
SET occupation='Software consultant'
WHERE taxpayer_id=105;
UPDATE Taxpayer 
SET annual_income=950000.00
WHERE taxpayer_id=101;
UPDATE Taxpayer 
SET is_active=TRUE
WHERE taxpayer_id=106;
DELETE FROM Taxpayer
WHERE taxpayer_id=107;
INSERT INTO Income_Category(
category_id,category_name,description,taxable)
VALUES(7,'Rental Income','Income earned from renting property',TRUE);
ALTER TABLE Taxpayer
ADD phone_number VARCHAR(15);
ALTER TABLE Income_Record
ADD remarks VARCHAR(200);
ALTER TABLE Taxpayer
MODIFY occupation VARCHAR(100);
CREATE TABLE Tax_Office(
office_id INT PRIMARY KEY,
office_name VARCHAR(100) NOT NULL,
city VARCHAR(50) NOT NULL);
INSERT INTO Tax_Office
VALUES(1,'Hyderabad Tax Office','Hyderabad');
INSERT INTO Tax_Office
VALUES(2,'Chennai Tax Office','Chennai');
TRUNCATE TABLE Tax_Office;
DROP TABLE Tax_Office;