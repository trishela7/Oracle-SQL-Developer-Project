/* Step 0.  As a comment, include your filename (CS60_8_LastName_FirstName.SQL) 
and the date. -CS60_8_Shatz_Patricia.SQL 5.2.17 */

/* Step 1.  Using Oracle’s SQL Developer interface (Project 7 describes its use)
, create the tables shown on the next page with their constraints.  Preface each 
table name with your initials LFM_ (Last First Middle and underscore).  
An example of a CREATE TABLE statement with both a primary key and a foreign key 
is in the Declaring a foreign key section of Chapter 07. 

Create the tables in an order that satisfies referential integrity.  
In the name for your primary key constraint, also include your initials because 
that name will be used for an auto-generated index, and the names for indexes 
and all objects must be unique in the database.-- CS60_8_Shatz_Patricia.SQL 
5.2.17 */

/*I realize that you only would like us to only drop the tables at the very end
of our commands, however, I have left these DROP TABLE commands here in case you 
get an error saying that these tables already exist. - CS60_8_Shatz_Patricia.SQL 
5.10.17 */

DROP TABLE SAP_Enroll;
DROP TABLE SAP_Student;
DROP TABLE SAP_Section;

CREATE TABLE SAP_Student
  (Student_ID NUMBER(7), 
  LastName    VARCHAR2(20) NOT NULL,
  FirstName   VARCHAR2(20),
  CONSTRAINT  PK_SAP_Student PRIMARY KEY(Student_ID));

CREATE TABLE SAP_Section
  (Section_Number  NUMBER(4),
  Course_Number    VARCHAR2(10) NOT NULL,
  FirstClassDate   date default SYSDATE,
  Professor_ID     NUMBER(4) NULL,
  CONSTRAINT PK_SAP_Section PRIMARY KEY(Section_Number));

CREATE TABLE SAP_Enroll 
  (Student_ID     NUMBER(7),
   Section_Number  NUMBER(4),
  CONSTRAINT PK_SAP_Enroll PRIMARY KEY(Student_ID, Section_Number),
  CONSTRAINT FK_SAP_Student_Enroll FOREIGN KEY(Student_ID) 
    REFERENCES SAP_Student(Student_ID),
  CONSTRAINT FK_SAP_Section_Enroll FOREIGN KEY(Section_Number) 
    REFERENCES SAP_Section(Section_Number));
    
--/* Step 2.  Insert the rows of raw data into each table.  INSERT is described 
--in Chapter 08.  Insert them in an order that satisfies referential integrity.  
--You’ll insert rows into your LFM_Enroll table last. */
INSERT INTO SAP_Student
  (Student_ID, LastName, FirstName)
  values
  (1340960, 'Shatz', 'Patricia');  

INSERT INTO SAP_Student  
  (Student_ID, LastName, FirstName)
  values
  (900000, 'Smith', 'John');
  
INSERT INTO SAP_Student 
  (Student_ID, LastName, FirstName)
  values
  (1000000, 'Yee', 'Yang');
  
INSERT INTO SAP_Student  
 (Student_ID, LastName, FirstName)
  values
  (1100000, 'Sanchez', 'Tim');
  
INSERT INTO SAP_Student  
 (Student_ID, LastName, FirstName)
 values
 (1200000, 'Tsuge', 'Sunichi');

INSERT INTO SAP_Student  
 (Student_ID, LastName, FirstName)
  values
  (1300000, 'Jones', 'Mary');
 
INSERT INTO SAP_Section
  (Section_Number, Course_Number, FirstClassDate, Professor_ID)
  values
  (4125, 'CS60', '30 August 2017',1000);

INSERT INTO SAP_Section
  (Section_Number, Course_Number, FirstClassDate, Professor_ID)
  values
  (4138, 'CS61', '2 September 2017', 1000);

INSERT INTO SAP_Section
  (Section_Number, Course_Number, FirstClassDate, Professor_ID)
  values
  (4126, 'CS65', '1 September 2017', 1000);
  
INSERT INTO SAP_Section
  (Section_Number, Course_Number, FirstClassDate, Professor_ID)
  values
  (1665, 'CS88C', SYSDATE, 2000);
  
INSERT INTO SAP_Section
  (Section_Number, Course_Number, FirstClassDate, Professor_ID)
  values
  (4133, 'CS42', '2 September 2017', 3000);

INSERT INTO SAP_Section
  (Section_Number, Course_Number, FirstClassDate, Professor_ID)
  values
  (1651, 'CS50', NULL, NULL);

INSERT INTO SAP_Enroll
  (Student_ID, Section_Number)
  values
  (1340960, 1665);
  
INSERT INTO SAP_Enroll
  (Student_ID, Section_Number)
  values
  (1340960, 4138);  

INSERT INTO SAP_Enroll
  (Student_ID, Section_Number)
  values
  (1340960, 4126);
  
INSERT INTO SAP_Enroll
  (Student_ID, Section_Number)
  values
  (900000, 4125);

INSERT INTO SAP_Enroll
  (Student_ID, Section_Number)
  values
  (1000000, 4126);

INSERT INTO SAP_Enroll
  (Student_ID, Section_Number)
  values
  (1100000, 4126);
  
INSERT INTO SAP_Enroll
  (Student_ID, Section_Number)
  values  
  (900000, 4138);

/* Step 3.  Update one row in each table.  UPDATE is described in Chapter 08.  
When each update statement executes, referential integrity must be satisfied.  
Your updates must satisfy referential integrity. */

UPDATE SAP_Student
   SET Student_ID= 1440938
   WHERE Student_ID = 1200000;

/*This command updates 2 rows that both have FIRSTCLASSDATE set to '2 September 
2017 - CS60_8_Shatz_Patricia.SQL - 5.10.17*/ 
UPDATE SAP_Section
  SET FIRSTCLASSDATE = '2 July 2017'
  WHERE FIRSTCLASSDATE = '2 September 2017';
  
UPDATE SAP_Enroll
  SET Section_Number = 4138
  WHERE Student_ID = 1000000 AND Section_Number = 4126;

/* Step 4.  Delete one row from each table.  DELETE is described in Chapter 08.  
The rows you delete cannot violate referential integrity (i.e., the deleted row 
cannot have a primary key that’s being referenced by some foreign key). */

DELETE FROM SAP_Student
  WHERE Student_ID = 1300000;

DELETE FROM SAP_Section
  WHERE Section_Number = 1651;
  
DELETE FROM SAP_Enroll
  WHERE Student_ID = 1100000;

/* Step 5.  Select all columns and rows from all tables.  SELECT is described in 
Chapter 08 and will be of form SELECT * FROM TableName;  where TableName is the 
name of a table.  The asterisk (*) will return all rows, and omitting the where 
clause (WHERE condition) will return values from all rows. */

SELECT * FROM SAP_Student;

SELECT * FROM SAP_Section;

SELECT * FROM SAP_Enroll;

/* Step 6.  Drop all tables, one by one, in an order that satisfies referential 
integrity with

DROP TABLE Tablename; 

where Tablename is the name of the table. */

DROP TABLE SAP_Enroll;

DROP TABLE SAP_Student;

DROP TABLE SAP_Section;