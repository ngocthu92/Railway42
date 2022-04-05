-- create database Testing_System_Assignment_4
DROP DATABASE IF EXISTS Testing_System_Assignment_4;
CREATE DATABASE Testing_System_Assignment_4;
USE Testing_System_Assignment_4;


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
 
 
-- ***Insert data vào 11 table***
-- THÊM DL bảng Department
INSERT INTO Department(DepartmentID,DepartmentName) VALUES(1, 'Phòng Nhân Sự');
INSERT INTO Department(DepartmentID,DepartmentName) VALUES(2, 'Phòng Hành Chính');
INSERT INTO Department(DepartmentID,DepartmentName) VALUES(3, 'Phòng Marketing');
INSERT INTO Department(DepartmentName) VALUES('Phòng Kế Toán');
INSERT INTO Department(DepartmentName) VALUES('Phòng Kỹ Thuật');
INSERT INTO Department(DepartmentName) VALUES('Phòng Kiểm Định');
INSERT INTO Department(DepartmentName) VALUES('Phòng Sale');
INSERT INTO Department(DepartmentName) VALUES('Phòng Bảo vệ');
INSERT INTO Department(DepartmentName) VALUES('Giám đốc');
INSERT INTO Department(DepartmentName) VALUES('P.Giám đốc');
INSERT INTO Department(DepartmentName) VALUES('Thư kí' );


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
				VALUES(1, 'giahuy0660@gmail.com', 'Gia Huy', 'Nguyễn Gia Huy', 2, 4, '2021/2/2');
INSERT INTO `Account`(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES(2, 'huonglyy281@gmail.com', 'Hương Ly', 'Đoàn Hương Ly', 2, 1, '2021/2/2');
INSERT INTO `Account`(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES(3, 'phuongnga51@gmail.com', 'Phương Nga', 'Trần Phương Nga', 4, 2, '2020/1/8');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('hangbee103@gmail.com', 'Hằng Bee',	'Nguyễn Thị Hằng', 6, 3, '2019/5/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('mai2196@gmail.com', 'Mai Anh', 'Hoàng Mai Anh', 5, 2, '2018/7/4');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('meohenpc1@gmail.com', 'Minh Ngọc', 'Lê Minh Ngọc', 4, 3, '2020/8/9');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('ngoctu@gmail.com', 'Ngọc Tú', 'Mai Ngọc Tú',5, 1, '2021/5/2');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('hungnguyen961218@gmail.com', 'Hưng Nguyễn', 'Nguyễn Đình Hưng', 3, 4, '2019/12/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('phuonganh01@gmail.com', 'chíp còi', 'Nguyễn Phương Anh',1, 3, '2019/12/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('xuka123@gmail.com', 'xuka123', 'Đặng Bảo Giang', 10, 4 , '2019/12/7');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('doreamon01@gmail.com', 'monchan', 'Lê Tâm Anh', 1, 4,'2018/12/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('phuongdung@gmail.com', 'dunghip', 'Nguyễn Phương Dung',9, 2,'2018/12/10');               
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('anhdao01@gmail.com', 'daocoi', 'Trần Anh Đào',8, 1,'2019/12/1');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('baongoc@gmail.com', 'baongoc', 'Nguyễn Bảo Ngọc',7, 1,'2020/1/2');                
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('lebaongoc@gmail.com', 'lengoc', 'Lê Bảo Ngọc',6, 1,'2019/3/2');               
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('phuongvy@gmail.com', 'akichan', 'Nguyễn Phương Vy',6, 1,'2020/7/2');                  
                
                SELECT * FROM Account;
                
                
-- them DL table group
INSERT INTO `Group`(GroupID, GroupName, CreatorID, CreateDate) 	VALUES(1, 'GROUP1_nv1', 1, '2019/9/8');
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP2_nv2', 6, '2019/9/8');
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP3_hc', 4, '2019/10/3');
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP4_marketing', 3, '2020/5/6'); 
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP5_kcs1', 5, '2020/12/9');
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP6_kcs2', 9, '2020/11/8');
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP7_kt', 10, '2020/10/6');
INSERT INTO `Group`(GroupName, CreatorID, CreateDate) 				VALUES('GROUP8_kt', 2, '2021/10/6');

                
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

INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(1, 3, '2021/6/9');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(1, 5, '2021/6/9');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(1, 8, '2021/6/9');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(1, 4, '2021/6/9');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(2, 8, '2021/6/9');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(1, 2, '2021/6/9');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(1, 6, '2021/6/9');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(2, 6, '2021/9/10');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(2, 5, '2021/9/10');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(2, 4, '2021/9/10');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(2, 3, '2021/9/10');
INSERT INTO GroupAccount(GroupID, AccountID, JoinDate) VALUES(2, 9, '2021/9/10');


-- them DL table TypeQuestion
INSERT INTO TypeQuestion(TypeID, TypeName) VALUES(1, 'Essay'); /* tự luận*/
INSERT INTO TypeQuestion(TypeID, TypeName) VALUES(2, 'Multiple-Choice'); /* trắc nghiệm*/

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
			VALUES(3,'Câu lệnh SQL nào được dùng để xóa dữ liệu từ Database?', 2, 1, 3,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(4,'Trong SQL làm thế nào để chọn cột dữ liệu có tên FirstName từ bảng Persons?',2, 1, 3, '2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(5, 'Trong SQL làm thế nào để chọn tất cả các cột dữ liệu trong bảng Persons?', 2, 1, 3, '2020/5/6');
            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(6, 'Dấu ; được sử dụng để kết thúc lệnh trong java?', 3, 2, 4,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(7, 'Ngôn ngữ java có phân biệt chữ hoa chữ thường?', 3, 2, 4,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(8, 'java là ngôn ngữ lập trình hướng đối tượng?', 4, 2, 8,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(9, 'Chương trình viết bằng java chỉ có thể chạy được trên HDH win?', 4, 2, 8,'2020/5/6');
            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(10, 'Python là ngôn ngữ lập trình cấp cao?', 5, 2, 3,'2020/5/6');            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(11, 'Python là ngôn ngữ lâp trình hướng đối tượng?', 6, 2, 3,'2020/5/6');            
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



-- them DL table Exam
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(1, 'SQL1', 'Đề thi SQL1',1, '30 phút', 2, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(2,'SQL1', 'Đề thi SQL1', 1,'30 phút', 2, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(3,'SQL2', 'Đề thi SQL2', 2,'30 phút', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(4,'SQL2', 'Đề thi SQL2', 2,'30 phút', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(5,'SQL2', 'Đề thi SQL2', 2,'30 phút', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(6,'JAVA1', 'Câu hỏi JAVA', 1,'45 phút', 4, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(7,'JAVA1', 'Câu hỏi JAVA', 1,'45 phút', 4, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(8,'JAVA2', 'Câu hỏi JAVA', 2,'60 phút', 8, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(9,'JAVA2', 'Câu hỏi JAVA', 2,'60 phút', 8, '2019/12/20');
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
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(8,4); 
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(7,4);            
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(9,11);  
INSERT INTO ExamQuestion(ExamID, QuestionID) VALUES(7,11);  

select * from TypeQuestion;



-- xem cấu trúc bảng `Account`
-- DESC `Account`;

/**** Exercise 1: Join****/
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
select * from Department;
select * from Account;

SELECT A.*,D.DepartmentName
FROM Account as A
INNER JOIN Department as D ON A.DepartmentID = D.departmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2020
select * from Account;
select * from Department;
select * from Position;

SELECT A.*, P.PositionName, D.DepartmentName
FROM Account as A
JOIN Position as P ON A.PositionID = P.PositionID
JOIN Department as D ON A.DepartmentID = D.DepartmentID
WHERE CreateDate > '2020/12/20';


-- Question 3: Viết lệnh để lấy ra tất cả các developer

SELECT A.*, D.DepartmentName, P.PositionName
FROM Account as A
JOIN Position as P ON P.PositionID = A.PositionID
JOIN Department as D ON A.DepartmentID = D.DepartmentID 
WHERE PositionName = 'DEV';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT DepartmentName, COUNT(A.DepartmentID) as SoNV FROM Department D
JOIN Account as A ON A.DepartmentID = D.DepartmentID
GROUP BY A.DepartmentID
HAVING COUNT(A.DepartmentID) >= 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
select * from Question;
select * from ExamQuestion;

-- VẾ PHẢI:
SELECT MAX(SoCauHoi) FROM (SELECT COUNT(QuestionID) as SoCauHoi FROM ExamQuestion GROUP BY QuestionID) as Temp;

-- VẾ TRÁI:
SELECT Q.QuestionID,  Q.Content, COUNT(Q.QuestionID) as SoCauHoi FROM ExamQuestion EXQ
JOIN Question as Q ON Q.QuestionID = EXQ.QuestionID
GROUP BY (EXQ.QuestionID)
HAVING COUNT(Q.QuestionID) = (SELECT MAX(SoCauHoi) FROM (SELECT COUNT(QuestionID) as SoCauHoi FROM ExamQuestion GROUP BY QuestionID) as Temp);


-- Question 6: Thống kê mỗi category Question được sử dụng trong bao nhiêu Question
select * from CategoryQuestion;
select * from Question;

 -- left join lấy bảng CategoryQuestion
 SELECT CQ.CategoryID, CQ.CategoryName, COUNT(Q.CategoryID) as so_cate_ques FROM CategoryQuestion CQ
LEFT JOIN Question as Q ON CQ.CategoryID = Q.CategoryID
GROUP BY (CQ.CategoryID)
ORDER BY  CQ.CategoryID ASC;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
select * from Question;
select * from ExamQuestion;

SELECT Q.QuestionID, Content, COUNT(EQ.QuestionID) as so_ques_ex FROM  Question Q
LEFT JOIN ExamQuestion as EQ  ON EQ.QuestionID = Q.QuestionID
GROUP BY (Q.QuestionID)
ORDER BY EQ.ExamID ASC;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
select * from Question;
select * from Answer;
SELECT MAX(socautraloi) FROM (SELECT COUNT(AnswerID) as socautraloi FROM Answer GROUP BY QuestionID) as Temp;

SELECT Q.QuestionID, Q.Content, COUNT(AnswerID) as socautraloi FROM Answer A 
JOIN Question as Q ON Q.QuestionID = A.QuestionID
GROUP BY (A.QuestionID)
HAVING (Q.QuestionID) = (SELECT MAX(socautraloi) FROM (SELECT COUNT(AnswerID) as socautraloi FROM Answer GROUP BY QuestionID) as Temp);


-- Question 9: Thống kê số lượng account trong mỗi group
select * from groupAccount;
select * from `Group`;
 
 SELECT G.GroupID, G.GroupName, COUNT(GA.AccountID) as solg_acc
 FROM groupAccount GA
 RIGHT JOIN `Group` as G ON GA.GroupID = G.GroupID
 GROUP BY G.GroupID
 ORDER BY G.GroupID ASC;
 
-- Question 10: Tìm chức vụ có ít người nhất
SELECT * FROM `Position`;
SELECT * FROM `Account`;

SELECT MIN(SolgNV) FROM (SELECT COUNT(PositionID) as SolgNV FROM `Account` GROUP BY PositionID) as Temp;

SELECT P.PositionName, COUNT(A.PositionID) as SolgNV FROM Position P
JOIN Account A ON P.PositionID = A.PositionID
GROUP BY (A.PositionID)
HAVING COUNT(A.PositionID) = (SELECT MIN(SolgNV) FROM (SELECT COUNT(PositionID) as SolgNV FROM `Account` GROUP BY PositionID) as Temp);

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
select * from department;
select * from Position;
select * from Account;

/* SELECT * FROM department D
CROSS JOIN Position P; */

-- b1 join lần lượt từng DepartmentID với bảng Position gọi là bảng t1
SELECT t1.DepartmentID, t1.PositionID
 FROM 
(SELECT D.DepartmentID, P.PositionID  FROM Department D
CROSS JOIN Position P
WHERE P.PositionName IN('Dev', 'Test', 'Scrum Master', 'PM')
ORDER BY D.DepartmentID, P.PositionID) as t1;

-- b2 tìm số lg account của từng chức vụ trong từng phòng gọi là bảng t2
SELECT D.DepartmentID, P.PositionID, COUNT(A.AccountID) as soAccount
FROM `Position` P
LEFT JOIN `Account` A on A.PositionID = P.PositionID
RIGHT JOIN Department D on A.DepartmentID = D.DepartmentID
WHERE  P.PositionName IN('Dev', 'Test', 'Scrum Master', 'PM')
GROUP BY D.DepartmentID, P.PositionID;

-- b3 join bảng t1 với bảng t2
SELECT t1.DepartmentID, t1.PositionID,
IF ((t2.soAccount is NULL), 0, t2.soAccount)  as soAccount
 FROM 
(SELECT D.DepartmentID, P.PositionID 
FROM Department D
CROSS JOIN `Position` P
WHERE P.PositionName IN ('Dev', 'Test', 'Scrum Master', 'PM')
ORDER BY D.DepartmentID, P.PositionID) as t1
LEFT JOIN 
(SELECT D.DepartmentID, P.PositionID, COUNT(A.AccountID) as soAccount
FROM `Position` P
LEFT JOIN `Account` A on A.PositionID = P.PositionID
RIGHT JOIN Department D on A.DepartmentID = D.DepartmentID
WHERE  P.PositionName IN('Dev', 'Test', 'Scrum Master', 'PM')
GROUP BY D.DepartmentID, P.PositionID) as t2
ON t1.DepartmentID = t2.DepartmentID AND t1.PositionId = t2.PositionID
GROUP BY t1.DepartmentID, t1.PositionID
ORDER BY t1.DepartmentID, t1.PositionID;


-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm thông tin cơ bản của Question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT Q.QuestionID, Q.Content, TQ.TypeName, Q.CreatorID, A.Username, An.Content 
FROM Question Q
INNER JOIN TypeQuestion TQ ON Q.TypeID = TQ.TypeID
INNER JOIN Answer An ON Q.QuestionID = An.QuestionID
INNER JOIN Account A ON A.AccountID = Q.CreatorID;


-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
/* b1 count số lg câu hỏi theo typeID */
SELECT TypeID, COUNT(TypeID) as solg FROM Question GROUP BY TypeID;

/*b2 join table TypeQuestion với Question */
select Q.TypeID, TQ.TypeName, COUNT(Q.TypeID) as solg 
FROM TypeQuestion TQ
JOIN Question Q ON TQ.TypeID = Q.TypeID
GROUP BY Q.TypeID;

-- Question 14:Lấy ra `group` không có account nào

SELECT DISTINCT G.GroupName
FROM `Group` G
LEFT JOIN GroupAccount GA ON G.GroupID = GA.GroupID
WHERE GA.AccountID IS NULL;

-- Question 15: Lấy ra group không có account nào
SELECT * FROM `Group`
WHERE GroupID NOT IN ( SELECT GroupID FROM GroupAccount);


-- Question 16: Lấy ra question không có answer nào
SELECT * FROM Question 
WHERE QuestionID NOT IN (SELECT QuestionID FROM Answer);


/****Exercise 2: Union ****/
-- Question 17: 
/*		a) Lấy các account thuộc nhóm thứ 1
		b) Lấy các account thuộc nhóm thứ 2
		c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau */
        
/* a */     SELECT * From GroupAccount;
			SELECT A.*, A.UserName FROM Account A
			JOIN GroupAccount GA ON A.AccountID = GA.AccountID
			WHERE GroupID = 1;
/* b */		SELECT * From GroupAccount;
			SELECT A.*, A.UserName FROM Account A
			JOIN GroupAccount GA ON A.AccountID = GA.AccountID
			WHERE GroupID = 2;    
/* c */
	SELECT A.*, A.UserName FROM Account A
	JOIN GroupAccount GA ON A.AccountID = GA.AccountID
	WHERE GroupID = 1
	UNION 
	SELECT A.*, A.UserName FROM Account A
	JOIN GroupAccount GA ON A.AccountID = GA.AccountID
	WHERE GroupID = 2;
	
-- Question 18:
/*		a) Lấy các group có lớn hơn 5 thành viên
		b) Lấy các group có nhỏ hơn 7 thành viên
		c) Ghép 2 kết quả từ câu a) và câu b)  */
        
        
        SELECT * FROM GroupAccount;
/*a*/
SELECT GroupID, COUNT(AccountID) as soTV FROM GroupAccount GROUP BY GroupID;

SELECT G.GroupID, G.GroupName,COUNT(GA.AccountID) as soTV FROM GroupAccount GA
JOIN `Group` G ON G.GroupID = GA.GroupID
GROUP BY GA.GroupID
HAVING COUNT(GA.AccountID) > 5;
/*b*/
SELECT G.GroupID, G.GroupName,COUNT(GA.AccountID) as soTV FROM GroupAccount GA
JOIN `Group` G ON G.GroupID = GA.GroupID
GROUP BY GA.GroupID
HAVING COUNT(GA.AccountID) < 7;
/*c*/
SELECT G.GroupID, G.GroupName,COUNT(GA.AccountID) as soTV FROM GroupAccount GA
JOIN `Group` G ON G.GroupID = GA.GroupID
GROUP BY GA.GroupID
HAVING COUNT(GA.AccountID) > 5
UNION
SELECT G.GroupID, G.GroupName,COUNT(GA.AccountID) as soTV FROM GroupAccount GA
JOIN `Group` G ON G.GroupID = GA.GroupID
GROUP BY GA.GroupID
HAVING COUNT(GA.AccountID) < 7;
