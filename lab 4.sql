USE Spandana;
SHOW TABLES;
SELECT * FROM Taxpayer;
SELECT* FROM Income_Record;
SELECT * FROM financial_year;
SELECT t.full_name,i.income_source FROM Taxpayer t INNER JOIN Income_Record i ON t.taxpayer_id=i.taxpayer_id;
SELECT t.full_name,ic.category_name FROM Taxpayer t INNER JOIN Income_Record ir ON t.taxpayer_id=ir.taxpayer_id INNER JOIN Income_category ic ON ir.category_id=ic.category_id;
SELECT *FROM Income_Category;
SELECT ir.income_source,fy.year_label FROM Income_Record ir INNER JOIN Financial_Year fy ON ir.year_id=fy.year_id;
SELECT t.full_name,t.annual_income,ir.amount FROM Taxpayer t INNER JOIN Income_Record ir ON t.taxpayer_id=ir.taxpayer_id;
SELECT t.full_name,ir.income_source,ic.category_name,fy.year_label FROM Taxpayer t
 INNER JOIN Income_Record ir ON t.taxpayer_id=ir.taxpayer_id INNER JOIN Income_category ic ON  ir.category_id=ic.category_id
 INNER JOIN Financial_Year fy ON ir.year_id=fy.year_id;
 SELECT t.full_name,ir.income_source,ic.category_name FROM Taxpayer t
 INNER JOIN Income_Record ir ON t.taxpayer_id=ir.taxpayer_id INNER JOIN Income_category ic ON  ir.category_id=ic.category_id WHERE ic.category_name='Salary';
  SELECT t.full_name,ir.income_source,t.occupation FROM  Taxpayer t  INNER JOIN Income_Record ir ON t.taxpayer_id=ir.taxpayer_id INNER JOIN 
  Income_category ic ON  ir.category_id=ic.category_id WHERE ic.category_name='Business';
  SELECT t.full_name,t.pan_number,t.occupation,fy.year_label,fy.start_date,fy.end_date FROM Taxpayer t
  INNER JOIN Income_Record ir ON t.taxpayer_id=ir.taxpayer_id INNER JOIN  Financial_year fy ON ir.year_id=fy.year_id;
   SELECT t.full_name,t.pan_number,t.occupation,ic.category_name,ic.description FROM Taxpayer t
  INNER JOIN Income_Record ir ON t.taxpayer_id=ir.taxpayer_id INNER JOIN Income_Category ic ON  ir.category_id=ic.category_id ;
SELECT t.full_name,t.pan_number,t.occupation,ir.income_source,ic.category_name,ir.amount,fy.year_label,fy.start_date,fy.end_date  FROM Taxpayer t
INNER JOIN Income_Record ir ON t.taxpayer_id=ir.taxpayer_id INNER JOIN Income_Category ic ON  ir.category_id=ic.category_id INNER JOIN  Financial_year fy ON ir.year_id=fy.year_id;
SELECT t.full_name,ir.income_source FROM Taxpayer t LEFT OUTER JOIN  Income_Record ir ON t.taxpayer_id=ir.taxpayer_id;
SELECT ic.category_name,ir.income_source FROM Income_Record ir RIGHT OUTER JOIN Income_Category ic ON ir.category_id=ic.category_id ;
SELECT t.full_name,ir.income_source FROM Taxpayer t LEFT JOIN Income_Record ir ON t.taxpayer_id=ir.taxpayer_id
UNION 
SELECT t.full_name,ir.income_source FROM Taxpayer t RIGHT JOIN Income_Record ir ON t.taxpayer_id=ir.taxpayer_id;
SELECT t.full_name,fy.year_label FROM Taxpayer t CROSS JOIN Financial_Year fy;
SELECT t1.full_name AS Taxpayer1,t2.full_name AS Taxpayer, t1.occupation FROM Taxpayer t1
INNER JOIN Taxpayer t2 ON t1.occupation=t2.occupation AND t1.taxpayer_id<t2.taxpayer_id;
SELECT t.full_name,t.pan_number,ir.income_source,ic.category_name,fy.year_label
FROM Taxpayer t INNER JOIN Income_Record ir ON t.taxpayer_id=ir.taxpayer_id
INNER JOIN Income_Category ic ON ir.category_id=ic.category_id INNER JOIN Financial_Year fy ON 
ir.year_id=fy.year_id;
SELECT t.full_name,ic.category_name,ic.description FROM Taxpayer t INNER JOIN 
Income_Record ir ON t.taxpayer_id=ir.taxpayer_id
INNER JOIN Income_Category ic ON ir.category_id=ic.category_id;
SELECT ir.income_source,fy.year_label FROM Income_Record ir INNER JOIN  Financial_Year fy ON ir.year_id=fy.year_id;
SELECT t.full_name,ic.category_name, ir.income_source,fy.year_label FROM Taxpayer t INNER JOIN
 Income_Record ir ON t.taxpayer_id=ir.taxpayer_id
INNER JOIN Income_Category ic ON ir.category_id=ic.category_id INNER JOIN  Financial_Year fy ON
 ir.year_id=fy.year_id WHERE ic.category_name='Business' AND fy.year_label='2025-2026';
 SELECT t.full_name,t.pan_number,t.occupation,t.annual_income,ir.income_source,ir.amount,
 ir.received_date,ic.category_name,ic.description,ic.taxable,fy.year_label,fy.start_date,fy.end_date
 FROM Taxpayer t INNER JOIN Income_Record ir ON t.taxpayer_id=ir.taxpayer_id INNER JOIN 
 Income_Category ic ON ir.category_id=ic.category_id 
  INNER JOIN  Financial_Year fy ON ir.year_id=fy.year_id;