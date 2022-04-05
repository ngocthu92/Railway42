DROP DATABASE IF EXISTS Testing_System_Assignment_1;
-- tạo database 
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

-- QUESTION 1: tạo bảng với các ràng buộc và kiểu dl
-- tạo bảng 1 Department
CREATE TABLE Department(
	DepartmentID		INT,
	DepartmentName		VARCHAR(50)
);

-- tạo bảng 2 Position
CREATE TABLE `Position`(
	PositionID			INT,
	PositionName		VARCHAR(50)
);

-- tạo bảng 3 Account
CREATE TABLE Account(
	AccountID			INT,
	Email 				VARCHAR(100),
	UserName			VARCHAR(20),
	FullName			VARCHAR(20),
	DepartmentID 		INT,
	PositionID 			INT,
	CreateDate 			DATE
);	

-- tạo bảng 4 `Group`
CREATE TABLE `Group`(
	GroupID 			INT,
	GroupName 			VARCHAR(50),
	CreatorID 			INT,
	CreateDate			DATE
);

-- tạo bảng 5 Group_Account
CREATE TABLE GroupAccount(
	GroupID				INT,
	AccountID 			INT,
	JoinDate 			DATE
);

-- tạo bảng 6 Type_question
CREATE TABLE Type_question(
	TypeID 				INT,
	TypeName 			VARCHAR(50)
);

-- tạo bảng 7 Category_Question
CREATE TABLE Category_Question(
	CategoryID 			INT,
	Category_name 		VARCHAR(50)
);
-- tạo bảng 8 Question
CREATE TABLE Question(
	QuestionID			INT,
	Content 			VARCHAR(200),
	CategoryID 			INT,
	TypeID 				INT,
	CreatorID 			INT,
	CreateDate 			DATE
);

-- tạo bảng 9 Answer
CREATE TABLE Answer(
	AnswerID			INT,
	Content 			VARCHAR(200),
	QuestionID 			INT,
	IsCorrect 			VARCHAR(10)
);

-- tạo bảng 10 Exam
CREATE TABLE Exam(
	ExamID 				INT,
	Code				VARCHAR(20),
	Title				VARCHAR(100),
	CategoryID 			INT,
	Duration 			VARCHAR(20),
	CreatorID 			INT,
	CreateDate			DATE
);

-- tạo bảng 11 Exam_Question
CREATE TABLE ExamQuestion(
	ExamID 				INT,
	QuestionID			INT
);
