-- create database Testing_System_Assignment_2
DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;

-- *****Question 1:Tối ưu lại assignment******
-- *****Question 2:Thêm các constraint vào assignment*****

-- create table Department
CREATE TABLE Department(
	DepartmentID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	DepartmentName		VARCHAR(50) NOT NULL
);

-- create table Position
CREATE TABLE `Position`(
	PositionID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	PositionName	ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);

-- create table account
CREATE TABLE `Account`(
	AccountID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Email 			VARCHAR(100) UNIQUE KEY,
	UserName		VARCHAR(30) UNIQUE KEY NOT NULL CHECK (LENGTH(UserName)>= 6),
	FullName		VARCHAR(50) NOT NULL CHECK (LENGTH(FullName)>= 6),
	DepartmentID	TINYINT UNSIGNED,
	PositionID 		TINYINT UNSIGNED,
	CreateDate 		DATE,
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- create table 'group'
CREATE TABLE `Group`(
	GroupID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	GroupName 		VARCHAR(50) UNIQUE KEY,
	CreatorID 		TINYINT UNSIGNED UNIQUE KEY,
	CreateDate		DATE,
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

-- create table grooup_account
CREATE TABLE GroupAccount(
	GroupID			TINYINT UNSIGNED,
	AccountID 		TINYINT UNSIGNED,
	JoinDate 		DATE,
    PRIMARY KEY (GroupID,AccountID),
    FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
);

-- create table type_question
CREATE TABLE TypeQuestion(
	TypeID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TypeName 	ENUM('Essay', 'Multiple-Choice')
);

-- create table Category_Question
CREATE TABLE CategoryQuestion(
	CategoryID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	CategoryName 	VARCHAR(20)
);

-- create table question
CREATE TABLE Question(
	QuestionID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content 		VARCHAR(100),
	CategoryID 		TINYINT UNSIGNED,
	TypeID 			TINYINT UNSIGNED,
	CreatorID 		TINYINT UNSIGNED,
	CreateDate 		DATE,
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID)
);

-- create table answer
CREATE TABLE Answer(
	AnswerID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content 		VARCHAR(200),
	QuestionID 		TINYINT UNSIGNED,
	IsCorrect 		ENUM('True', 'false'),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- create table exam
CREATE TABLE Exam(
	ExamID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Code			VARCHAR(50),
	Title			VARCHAR(50) ,
	CategoryID 		TINYINT UNSIGNED,
	Duration 		VARCHAR(50),
	CreatorID 		TINYINT UNSIGNED,
	CreateDate		DATE,
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

-- create table exam_question
CREATE TABLE ExamQuestion(
	ExamID 		TINYINT UNSIGNED,
	QuestionID		TINYINT UNSIGNED,
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);
 ALTER TABLE ExamQuestion ADD PRIMARY KEY(ExamID,QuestionID);
 
 
-- ***Question 3:Insert data vào 11 table, mỗi table có ít nhất 5 records***
-- THÊM DL bảng Department
INSERT INTO Department(DepartmentID,DepartmentName) VALUES(1, 'Phòng Nhân Sự');
INSERT INTO Department(DepartmentID,DepartmentName) VALUES(2, 'Phòng Hành Chính');
INSERT INTO Department(DepartmentID,DepartmentName) VALUES(3, 'Phòng Marketing');
INSERT INTO Department(DepartmentName) VALUES('Phòng Kế Toán');
INSERT INTO Department(DepartmentName) VALUES('Phòng Kỹ Thuật');
INSERT INTO Department(DepartmentName) VALUES('Phòng Kiểm Định');
INSERT INTO Department(DepartmentName) VALUES('Giám đốc');
INSERT INTO Department(DepartmentName) VALUES('P.Giám đốc');
INSERT INTO Department(DepartmentName) VALUES('Thư kí' );
INSERT INTO Department(DepartmentName) VALUES('Sale');



-- xem bảng
SELECT * FROM Department;

-- xóa hàng trong bảng 
-- DELETE FROM Department WHERE DepartmentID=3 AND DepartmentName='Phòng Hành Chính';

-- THÊM DL bảng Position
INSERT INTO `Position`(PositionID,PositionName) VALUES(1, 'DEV');
INSERT INTO `Position`(PositionID,PositionName) VALUES(2, 'TEST');
INSERT INTO `Position`(PositionName) VALUES('Scrum Master');
INSERT INTO `Position`(PositionName) VALUES('PM');


SELECT * FROM Position;

-- THÊM DL bảng `Account`
INSERT INTO `Account`(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES(1, 'giahuy0660@gmail.com', 'Gia Huy', 'Nguyễn Gia Huy', 1, 1, '2021/2/2');
INSERT INTO `Account`(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES(2, 'huonglyy281@gmail.com', 'Hương Ly', 'Đoàn Hương Ly', 2, 2, '2021/2/2');
INSERT INTO `Account`(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES(3, 'phuongnga51@gmail.com', 'Phương Nga', 'Trần Phương Nga', 4, 2, '2020/1/8');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('hangbee103@gmail.com', 'Hằng Bee',	'Nguyễn Thị Hằng', 6, 3, '2019/5/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('mai2196@gmail.com', 'Mai Anh', 'Hoàng Mai Anh', 3, 4, '2018/7/4');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('meohenpc1@gmail.com', 'Minh Ngọc', 'Lê Minh Ngọc',1, 4, '2020/8/9');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('ngoctu@gmail.com', 'Ngọc Tú', 'Mai Ngọc Tú', 1, 2, '2021/5/2');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('hungnguyen961218@gmail.com', 'Hưng Nguyễn', 'Nguyễn Đình Hưng', 3, 3, '2019/12/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('phuonganh01@gmail.com', 'chíp còi', 'Nguyễn Phương Anh',1, 3, '2019/12/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('xuka123@gmail.com', 'xuka123', 'Đặng Bảo Giang', 10, 4 , '2019/12/7');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('doreamon01@gmail.com', 'monchan', 'Lê Tâm Anh', 1, 4,'2018/12/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('phuongdung@gmail.com', 'dunghip', 'Nguyễn Phương Dung',10, 2,'2018/12/10');               
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('anhdao01@gmail.com', 'daocoi', 'Trần Anh Đào',10, 1,'2019/12/1');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('baongoc@gmail.com', 'baongoc', 'Nguyễn Bảo Ngọc',1, 1,'2020/1/2');
              
                
-- them DL table group
INSERT INTO `Group`(GroupID, GroupName, CreatorID, CreateDate) 	VALUES(1, 'GROUP1_nv1', 1, '2019/9/8');
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP2_nv2', 6, '2019/9/8');
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP3_hc', 4, '2019/10/3');
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP4_marketing', 3, '2020/5/6'); 
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP5_kcs1', 5, '2020/12/9');
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP6_kcs2', 9, '2020/11/8');
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP7_kt', 10, '2020/10/6');

                
-- Them DL table groupAccount
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(1, 1, '2021/9/9');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(2, 7, '2021/9/10');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(3, 5, '2021/10/3');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(4, 3, '2021/5/6');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(5, 4, '2021/12/2');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(6, 3, '2021-04-06');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(7, 4, '2021/10/3');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(1, 11, '2021/10/9');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(2, 12, '2021/10/4');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(3, 8, '2021/6/9');




-- them DL table TypeQuestion
INSERT INTO TypeQuestion(TypeID, TypeName) VALUES(1, 'Essay');
INSERT INTO TypeQuestion(TypeID, TypeName) VALUES(2, 'Multiple-Choice');

-- them DL table CategoryQuestion
INSERT INTO CategoryQuestion(CategoryID, CategoryName) VALUES(1, 'SQL1');
INSERT INTO CategoryQuestion(CategoryID, CategoryName) VALUES(2, 'SQL2');
INSERT INTO CategoryQuestion(CategoryID, CategoryName) VALUES(3, 'JAVA1');
INSERT INTO CategoryQuestion(CategoryID, CategoryName) VALUES(4, 'JAVA2');
INSERT INTO CategoryQuestion(CategoryID, CategoryName) VALUES(5, 'PYTHON1');
INSERT INTO CategoryQuestion(CategoryID, CategoryName) VALUES(6, 'PYTHON2');

-- them DL table Question
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(1, 'Câu lệnh SQL nào được dùng để trích xuất dữ liệu từ Database?', 1, 1, 2, '2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(2, 'Câu lệnh SQL nào được dùng để cập nhật dữ liệu từ Database?', 1, 1, 2, '2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(3,'Câu lệnh SQL nào được dùng để xóa dữ liệu từ Database?', 2, 2, 3,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(4,'Trong SQL làm thế nào để chọn cột dữ liệu có tên FirstName từ bảng Persons?',2, 2, 3, '2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(5, 'Trong SQL làm thế nào để chọn tất cả các cột dữ liệu trong bảng Persons?', 2, 2, 3, '2020/5/6');
            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(6, 'Dấu ; được sử dụng để kết thúc lệnh trong java?', 3, 1, 4,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(7, 'Ngôn ngữ java có phân biệt chữ hoa chữ thường không?', 3, 1, 4,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(8, 'java là ngôn ngữ lập trình hướng đối tượng?', 4, 2, 8,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(9, 'Chương trình viết bằng java chỉ có thể chạy được trên HDH win?', 4, 2, 8,'2020/5/6');
            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(10, 'Python là ngôn ngữ lập trình cấp cao?', 5, 1, 3,'2020/5/6');            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(11, 'Python là ngôn ngữ lâp trình hướng đối tượng?', 6, 1, 3,'2020/5/6');            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(12, 'Câu hỏi thêm?', 3, 1, 3,'2020/5/6');        
            
-- them DL table Answer
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(1,'select', 1, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(2, 'update', 2, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(3, 'delete', 3, 'True');        
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(4, 'select FirstName from Persons', 4, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(5, 'select * from Persons', 5, 'True');

INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(6, 'Sai', 6, 'false');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(7, 'Đúng', 7, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(8, 'Đúng', 8, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(9, 'Sai', 9, 'True');

INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(10, 'Sai', 10, 'false');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(11, 'Đúng', 11, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(12,  'select FirstName from Persons', 4, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(13,  'select FirstName from Persons', 4, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(14,  'select FirstName from Persons', 4, 'True');


-- them DL table Exam
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(1, 'SQL1', 'Đề thi SQL1',1, '30 phút', 2, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(2,'SQL1', 'Đề thi SQL1', 1,'30 phút', 2, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(3,'SQL2', 'Đề thi SQL2', 2,'30 phút', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(4,'SQL2', 'Đề thi SQL2', 2,'30 phút', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(5,'SQL2', 'Đề thi SQL2', 2,'30 phút', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(6,'JAVA1', 'Câu hỏi JAVA cơ bản', 1,'45 phút', 4, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(7,'JAVA1', 'Câu hỏi JAVA cơ bản', 1,'45 phút', 4, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(8,'JAVA2', 'Câu hỏi JAVA cơ bản', 2,'60 phút', 8, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(9,'JAVA2', 'Câu hỏi JAVA cơ bản', 2,'60 phút', 8, '2019/12/20');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(10,'PYTHON1', 'Đề thi PYTHON', 1,'30 phút', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(11,'PYTHON2', 'Đề thi PYTHON', 1,'30 phút', 3, '2020/5/6');



-- them DL table ExamQuestion
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(1,2);
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(2,5);
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(3,1);
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(4,3);
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(5,4);
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(6,10);
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(7,8);
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(8,9);      
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(9,7);
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(10,11);
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(11,11);
            
            
select * from Department;
select * from `Group`;
select * from groupAccount;
select * from TypeQuestion;
select * from CategoryQuestion;
select * from Question;
select * from Answer;
select * from Exam;
select * from ExamQuestion;



-- xem cấu trúc bảng `Account`
DESC `Account`;
