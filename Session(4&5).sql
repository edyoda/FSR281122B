SELECT * FROM Company.Emp_info;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Company.Emp_info WHERE Emp_Id = 2;

DELETE FROM Company.Emp_info WHERE Emp_Name = "JOHN";


-- ******* Add new column ************

ALTER TABLE Company.Emp_info ADD Emp_Email VARCHAR(30); 

-- ******** UPDATE AFTER ALTER **********

UPDATE Company.Emp_info SET Emp_Email = "selena@gmail.com" WHERE Emp_id = 3;
UPDATE Company.Emp_info SET Emp_Email = "alex@gmail.com" WHERE Emp_id = 4;
UPDATE Company.Emp_info SET Emp_Email = "sam@gmail.com" WHERE Emp_id = 5;
UPDATE Company.Emp_info SET Emp_Email = "peter@gmail.com" WHERE Emp_id = 6;

-- ******** UPDATE Multiple Data *******

UPDATE Company.Emp_info SET Emp_Profile = "Senior HR" , Emp_Salary = 55000 WHERE Emp_id = 5;



-- **** Modify Column position *****

ALTER TABLE Company.Emp_info MODIFY Emp_Email VARCHAR(30) AFTER Emp_Name;

-- ******* change Column name ******* Emp_id - id

ALTER TABLE Company.Emp_info CHANGE Emp_Id ID INT(3);


-- ********* Drop the column *******

ALTER TABLE Company.Emp_info DROP COLUMN Emp_Email;



-- ***** In & NOT IN *******


SELECT * FROM Company.Emp_info WHERE ID IN(4);
SELECT * FROM Company.Emp_info WHERE ID NOT IN(4);

SELECT * FROM Company.Emp_info WHERE ID IN(3,6);
SELECT * FROM Company.Emp_info WHERE ID NOT IN(3,6);




SELECT * FROM Company.Emp_info;


ALTER TABLE Company.Emp_info ADD CITY INT(3);
ALTER TABLE Company.Emp_info ADD foreign key(CITY) references Company.City(City_ID);
UPDATE Company.Emp_info SET City = 1 WHERE ID = 3;
UPDATE Company.Emp_info SET City = 2 WHERE ID = 4;
UPDATE Company.Emp_info SET City = 1 WHERE ID = 5;
UPDATE Company.Emp_info SET City = 3 WHERE ID = 6;


CREATE TABLE Company.City(
City_ID INT(3) NOT NULL AUTO_INCREMENT,
CIty_Name VARCHAR(20),
PRIMARY KEY(City_ID)
);


INSERT INTO Company.City(City_ID,City_Name)
VALUES(1,"AGRA"),(2,"Bhopal"),(3,"Dehli"),(4,"Noida");

SELECT * FROM Company.Emp_info;
SELECT * FROM Company.City;

-- ********* JOIN *****************

SELECT * FROM Company.Emp_info INNER JOIN Company.City ON Emp_info.City = City.City_ID;


-- Add new emp info **** 
INSERT INTO Company.Emp_Info(ID,Emp_Name,Emp_Profile,Emp_Salary,CITY)
VALUES(7,"Tom","Software tester",65000,4);

INSERT INTO Company.Emp_Info(ID,Emp_Name,Emp_Profile,Emp_Salary,CITY)
VALUES(8,"John","HR",30000,6);

INSERT INTO Company.Emp_Info(ID,Emp_Name,Emp_Profile,Emp_Salary,CITY)
VALUES(9,"Lilly","Junior HR",20000,11);

-- ******** LEFT JOIN *******
SELECT * FROM Company.Emp_info LEFT JOIN Company.City ON Emp_info.City = City.City_ID;

INSERT INTO Company.City(City_ID,City_Name)
VALUES(6,"MUMBAI");

INSERT INTO Company.City(City_ID,City_Name)
VALUES(7,"Pune"),(8,"NASIK");

-- ******** RIGHT JOIN *******
SELECT * FROM Company.Emp_info RIGHT JOIN Company.City ON Emp_info.City = City.City_ID;
-- ******** OUTER JOIN *******

SELECT * FROM Company.Emp_info LEFT JOIN Company.City ON Emp_info.City = City.City_ID
UNION
SELECT * FROM Company.Emp_info RIGHT JOIN Company.City ON Emp_info.City = City.City_ID;



-- ******** VIEW **********

CREATE VIEW Company.Emp_City_Join as SELECT * FROM Company.Emp_info LEFT JOIN Company.City ON Emp_info.City = City.City_ID
UNION
SELECT * FROM Company.Emp_info RIGHT JOIN Company.City ON Emp_info.City = City.City_ID;



CREATE VIEW Company.Profile_data as SELECT Emp_Name, Emp_Profile FROM Company.Emp_info;

delimiter $$

CREATE procedure Company.GetEmp(x_id INT)
begin
SELECT * FROM Company.Emp_info WHERE ID = x_id;
end $$

call Company.GetEmp(9)
















