DROP DATABASE IF EXISTS fresherManagement;
CREATE DATABASE fresherManagement;
USE fresherManagement;

-- exercise1: design a table
-- Quesiton 1 tạo table với các ràng buộc và kiểu dl
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee(
TraineeID 			INT AUTO_INCREMENT PRIMARY KEY,
FullName	 		NVARCHAR(50) NOT NULL,
BirthDate 			DATE,
Gender 				ENUM('male', 'female', 'unknown') NOT NULL,
ETIQ 				FLOAT UNSIGNED NOT NULL,
					CHECK(ETIQ <= 20),
ETGmath 			TINYINT UNSIGNED NOT NULL,
					CHECK(ETGmath <= 20),
ETEnglish			TINYINT UNSIGNED NOT NULL,
					CHECK (ETEnglish <=50),
TrainingClass 		CHAR(10) NOT NULL,
EvaluationNotes 	NVARCHAR(200)
);

desc trainee;

-- Question 2 thêm trường VTIAccount với dk not null & unique
ALTER TABLE Trainee ADD COLUMN VTIAccount VARCHAR(50) NOT NULL UNIQUE;

-- exercise2: data types

DROP TABLE IF EXISTS student;
CREATE TABLE student(
ID 				INT AUTO_INCREMENT PRIMARY KEY,
`Name`			VARCHAR(50),
`Code`			CHAR(5),
ModifiedDate 	DATETIME
);
ALTER TABLE student MODIFY ModifiedDate TIMESTAMP;
desc student;

-- Exercise 2: Data Types 2

DROP TABLE IF EXISTS studentID;
CREATE TABLE studentID(
ID 					INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Name`				VARCHAR(50) NOT NULL,
BirthDate			DATE,
Gender				BIT,				 /* 0=MALE, 1=FEMALE, NULL= UNKNOWN*/
IsDeletedFlag		BIT	NOT NULL		/*0= đang hoạt động, 1= đã xóa*/
);
desc studentID;