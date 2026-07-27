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

ALTER TABLE Income_Record
DROP COLUMN category_name;
ALTER TABLE Income_Record
DROP COLUMN financial_year;
ALTER TABLE Income_Record
ADD category_id INT,
ADD year_id INT;
ALTER TABLE Income_Record
ADD CONSTRAINT fk_taxpayer
FOREIGN KEY(taxpayer_id)
REFERENCES Taxpayer(taxpayer_id);
ALTER TABLE Income_Record
ADD CONSTRAINT fk_category
FOREIGN KEY(category_id)
REFERENCES Income_Category(category_id);
ALTER TABLE Income_Record
ADD CONSTRAINT fk_year
FOREIGN KEY(year_id)
REFERENCES Financial_Year(year_id);
UPDATE Income_Record
set category_id=2,year_id=6
WHERE income_id=1001;
UPDATE Income_Record
set category_id=1,year_id=6
WHERE income_id=1002;
UPDATE Income_Record
set category_id=2,year_id=6
WHERE income_id=1003;
UPDATE Income_Record
set category_id=1,year_id=6
WHERE income_id=1004;
UPDATE Income_Record
set category_id=2,year_id=6
WHERE income_id=1005;
UPDATE Income_Record
set category_id=1,year_id=6
WHERE income_id=1006;
SELECT DISTINCT occupation FROM Taxpayer
SELECT DISTINCT category_name FROM Income_Category;
SELECT DISTINCT year_label FROM Financial_Year;
SELECT DISTINCT income_source FROM Income_Record;
SELECT taxpayer_id FROM Income_Record
WHERE category_id=1
UNION
SELECT taxpayer_id FROM Income_Record
WHERE category_id=2;
SELECT full_name FROM taxpayer 
WHERE occupation='Teacher'
UNION
SELECT full_name FROM taxpayer 
WHERE occupation='Software Engineer';
SELECT taxpayer_id FROM Income_Record
WHERE category_id =1
AND taxpayer_id IN
(SELECT taxpayer_id FROM Income_Record
WHERE category_id=2);

/* part f*/

SELECT full_name FROM taxpayer
WHERE taxpayer_id IN
(
SELECT taxpayer_id FROM Income_Record
WHERE category_id=1
AND taxpayer_id NOT IN
(
SELECT taxpayer_id FROM Income_Record
WHERE category_id=2
)
);
SELECT full_name FROM taxpayer
WHERE taxpayer_id IN
(
SELECT taxpayer_id FROM Income_Record
);
SELECT full_name FROM taxpayer
WHERE occupation IN
(
SELECT occupation FROM taxpayer
WHERE taxpayer_id IN
(
SELECT taxpayer_id FROM Income_Record
WHERE category_id=2
)
);
SELECT full_name FROM taxpayer
WHERE taxpayer_id  NOT IN
(
SELECT taxpayer_id FROM Income_Record
);
SELECT DISTINCT occupation FROM taxpayer
WHERE taxpayer_id NOT IN 
(
SELECT taxpayer_id FROM Income_Record
);

/*part i*/

SELECT full_name FROM taxpayer t
WHERE EXISTS
(
SELECT* FROM Income_Record WHERE t.taxpayer_id=taxpayer_id
);
SELECT year_label FROM financial_year f
WHERE EXISTS
(
SELECT* FROM Income_Record
WHERE f.year_id=year_id
);
SELECT full_name FROM taxpayer t
WHERE NOT EXISTS
(
SELECT* FROM Income_Record i
WHERE t.taxpayer_id=i.taxpayer_id
);
SELECT category_name FROM income_category c
WHERE NOT EXISTS
(
SELECT* FROM Income_Record
WHERE c.category_id=category_id
);
SELECT full_name,annual_income FROM taxpayer
WHERE annual_income >ANY
(
SELECT annual_income FROM taxpayer 
WHERE occupation='Teacher'
);
SELECT full_name,annual_income FROM taxpayer
WHERE annual_income >ANY
(
SELECT annual_income FROM taxpayer
WHERE taxpayer_id IN
(
SELECT taxpayer_id FROM Income_Record
WHERE category_id=2
)
);
SELECT* FROM taxpayer ORDER BY full_name ASC;
SELECT* FROM taxpayer WHERE annual_income>800000;
SELECT* FROM Income_Record WHERE category_id=2;
SELECT* FROM Income_Record WHERE amount BETWEEN 500000 AND 1000000;
SELECT* FROM taxpayer WHERE full_name LIKE'A%';
SELECT* FROM taxpayer WHERE is_active=TRUE;
SELECT COUNT(*) AS total_taxpayers FROM taxpayer;
SELECT MAX(annual_income)AS highest_income FROM taxpayer;
SELECT full_name,annual_income FROM taxpayer WHERE annual_income=
(
SELECT MAX(annual_income) FROM taxpayer
);
SELECT category_id,COUNT(*) AS total_records FROM Income_Record 
GROUP BY category_id
ORDER BY total_records DESC LIMIT 1;
/*SELECT occupation,COUNT(*) AS total_taxpayers FROM taxapayer
GROUP BY occupation;*/
SELECT COUNT(*) AS active_taxpayers FROM taxpayer
WHERE is_active=TRUE;
SELECT year_id,COUNT(*) AS total_records FROM Income_Record
GROUP BY Year_id
ORDER BY total_records DESC LIMIT 1;
