-- create database Testing_System_Assignment_3
DROP DATABASE IF EXISTS Testing_System_Assignment_3;
CREATE DATABASE Testing_System_Assignment_3;
USE Testing_System_Assignment_3;



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
	FullName		NVARCHAR(50) NOT NULL CHECK (LENGTH(FullName)>= 6),
	DepartmentID	TINYINT UNSIGNED,
	PositionID 		TINYINT UNSIGNED,
	CreateDate 		DATE,
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- create table 'group'
CREATE TABLE `Group`(
	GroupID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	GroupName 		NVARCHAR(50) UNIQUE KEY,
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
	CategoryName 	NVARCHAR(20)
);

-- create table question
CREATE TABLE Question(
	QuestionID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content 		NVARCHAR(100),
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
	Content 		NVARCHAR(200),
	QuestionID 		TINYINT UNSIGNED,
	IsCorrect 		ENUM('True', 'false'),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- create table exam
CREATE TABLE Exam(
	ExamID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Code			VARCHAR(50),
	Title			NVARCHAR(50) ,
	CategoryID 		TINYINT UNSIGNED,
	Duration 		VARCHAR(50),
	CreatorID 		TINYINT UNSIGNED,
	CreateDate		DATE,
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

-- create table exam_question
CREATE TABLE ExamQuestion(
	ExamID 					TINYINT UNSIGNED,
	QuestionID				TINYINT UNSIGNED,
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);
 ALTER TABLE ExamQuestion ADD PRIMARY KEY(ExamID,QuestionID);
 
 
-- Question 1: Th??m ??t nh???t 10 record v??o m???i table

-- TH??M DL b???ng Department
INSERT INTO Department(DepartmentID,DepartmentName) VALUES(1, 'Ph??ng Nh??n S???');
INSERT INTO Department(DepartmentID,DepartmentName) VALUES(2, 'Ph??ng H??nh Ch??nh');
INSERT INTO Department(DepartmentID,DepartmentName) VALUES(3, 'Ph??ng Marketing');
INSERT INTO Department(DepartmentName) VALUES('Ph??ng K??? To??n');
INSERT INTO Department(DepartmentName) VALUES('Ph??ng K??? Thu???t');
INSERT INTO Department(DepartmentName) VALUES('Ph??ng Ki???m ?????nh');
INSERT INTO Department(DepartmentName) VALUES('Gi??m ?????c');
INSERT INTO Department(DepartmentName) VALUES('P.Gi??m ?????c');
INSERT INTO Department(DepartmentName) VALUES('Th?? k??' );
INSERT INTO Department(DepartmentName) VALUES('Sale');



-- xem b???ng
SELECT * FROM Department;

-- x??a h??ng trong b???ng 
-- DELETE FROM Department WHERE DepartmentID=3 AND DepartmentName='Ph??ng H??nh Ch??nh';

-- TH??M DL b???ng Position
INSERT INTO `Position`(PositionID,PositionName) VALUES(1, 'DEV');
INSERT INTO `Position`(PositionID,PositionName) VALUES(2, 'TEST');
INSERT INTO `Position`(PositionName) VALUES('Scrum Master');
INSERT INTO `Position`(PositionName) VALUES('PM');


SELECT * FROM Position;

-- TH??M DL b???ng `Account`
INSERT INTO `Account`(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES(1, 'giahuy0660@gmail.com', 'Gia Huy', 'Nguy???n Gia Huy', 1, 1, '2021/2/2');
INSERT INTO `Account`(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES(2, 'huonglyy281@gmail.com', 'H????ng Ly', '??o??n H????ng Ly', 2, 2, '2021/2/2');
INSERT INTO `Account`(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES(3, 'phuongnga51@gmail.com', 'Ph????ng Nga', 'Tr???n Ph????ng Nga', 4, 2, '2020/1/8');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('hangbee103@gmail.com', 'H???ng Bee',	'Nguy???n Th??? H???ng', 6, 3, '2019/5/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('mai2196@gmail.com', 'Mai Anh', 'Ho??ng Mai Anh', 3, 4, '2018/7/4');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('meohenpc1@gmail.com', 'Minh Ng???c', 'L?? Minh Ng???c',1, 4, '2020/8/9');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('ngoctu@gmail.com', 'Ng???c T??', 'Mai Ng???c T??', 1, 2, '2021/5/2');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('hungnguyen961218@gmail.com', 'H??ng Nguy???n', 'Nguy???n ????nh H??ng', 3, 3, '2019/12/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('phuonganh01@gmail.com', 'ch??p c??i', 'Nguy???n Ph????ng Anh',1, 3, '2019/12/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('xuka123@gmail.com', 'xuka123', '?????ng B???o Giang', 10, 4 , '2019/12/7');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('doreamon01@gmail.com', 'monchan', 'L?? T??m Anh', 1, 4,'2018/12/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('phuongdung@gmail.com', 'dunghip', 'Nguy???n Ph????ng Dung',10, 2,'2018/12/10');               
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('anhdao01@gmail.com', 'daocoi', 'Tr???n Anh ????o',10, 1,'2019/12/1');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('baongoc@gmail.com', 'baongoc', 'Nguy???n B???o Ng???c',1, 1,'2020/1/2');
              
                
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
			VALUES(1, 'C??u l???nh SQL n??o ???????c d??ng ????? tr??ch xu???t d??? li???u t??? Database?', 1, 1, 2, '2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(2, 'C??u l???nh SQL n??o ???????c d??ng ????? c???p nh???t d??? li???u t??? Database?', 1, 1, 2, '2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(3,'C??u l???nh SQL n??o ???????c d??ng ????? x??a d??? li???u t??? Database?', 2, 2, 3,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(4,'Trong SQL l??m th??? n??o ????? ch???n c???t d??? li???u c?? t??n FirstName t??? b???ng Persons?',2, 2, 3, '2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(5, 'Trong SQL l??m th??? n??o ????? ch???n t???t c??? c??c c???t d??? li???u trong b???ng Persons?', 2, 2, 3, '2020/5/6');
            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(6, 'D???u ; ???????c s??? d???ng ????? k???t th??c l???nh trong java?', 3, 1, 4,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(7, 'Ng??n ng??? java c?? ph??n bi???t ch??? hoa ch??? th?????ng kh??ng?', 3, 1, 4,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(8, 'java l?? ng??n ng??? l???p tr??nh h?????ng ?????i t?????ng?', 4, 2, 8,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(9, 'Ch????ng tr??nh vi???t b???ng java ch??? c?? th??? ch???y ???????c tr??n HDH win?', 4, 2, 8,'2020/5/6');
            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(10, 'Python l?? ng??n ng??? l???p tr??nh c???p cao?', 5, 1, 3,'2020/5/6');            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(11, 'Python l?? ng??n ng??? l??p tr??nh h?????ng ?????i t?????ng?', 6, 1, 3,'2020/5/6');            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(12, 'C??u h???i th??m?', 3, 1, 3,'2020/5/6');        
INSERT INTO Question VALUES(13, 'C??u h???i th??m 2', 4, 1, 4, '2022/4/3');
INSERT INTO Question VALUES(14, 'C??u h???i th??m 3', 4, 2, 4, '2022/4/3');
INSERT INTO Question VALUES(15, 'C??u h???i th??m 4', 4, 2, 5, '2022/4/3');

INSERT INTO Question VALUES(16, 'C??u h???i th??m 5', 4, 2, 5, '2022/2/3');
INSERT INTO Question VALUES(17, 'C??u h???i th??m 6', 4, 2, 5, '2022/2/3');
INSERT INTO Question VALUES(18, 'C??u h???i th??m 7', 4, 2, 5, '2022/8/3');
INSERT INTO Question VALUES(19, 'C??u h???i th??m 8', 4, 1, 3, '2022/9/3');
INSERT INTO Question VALUES(20, 'C??u h???i th??m 9', 4, 1, 3, '2022/12/3');


            
-- them DL table Answer
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(1,'select', 1, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(2, 'update', 2, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(3, 'delete', 3, 'True');        
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(4, 'select FirstName from Persons', 4, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(5, 'select * from Persons', 5, 'True');

INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(6, 'Sai', 6, 'false');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(7, '????ng', 7, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(8, '????ng', 8, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(9, 'Sai', 9, 'True');

INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(10, 'Sai', 10, 'false');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(11, '????ng', 11, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(12,  'select FirstName from Persons', 4, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(13,  'select FirstName from Persons', 4, 'True');
INSERT INTO Answer(AnswerID, Content, QuestionID, isCorrect) VALUES(14,  'select FirstName from Persons', 4, 'True');


-- them DL table Exam
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(1, 'SQL1', '????? thi SQL1',1, '30 ph??t', 2, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(2,'SQL1', '????? thi SQL1', 1,'30 ph??t', 2, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(3,'SQL2', '????? thi SQL2', 2,'30 ph??t', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(4,'SQL2', '????? thi SQL2', 2,'30 ph??t', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(5,'SQL2', '????? thi SQL2', 2,'30 ph??t', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(6,'JAVA1', 'C??u h???i JAVA c?? b???n', 1,'45 ph??t', 4, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(7,'JAVA1', 'C??u h???i JAVA c?? b???n', 1,'45 ph??t', 4, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(8,'JAVA2', 'C??u h???i JAVA c?? b???n', 2,'60 ph??t', 8, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(9,'JAVA2', 'C??u h???i JAVA c?? b???n', 2,'60 ph??t', 8, '2019/12/20');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(10,'PYTHON1', '????? thi PYTHON', 1,'30 ph??t', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(11,'PYTHON2', '????? thi PYTHON', 1,'30 ph??t', 3, '2020/5/6');

UPDATE Exam Set CreateDate = '2019/12/15' WHERE ExamID = 11;

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
     
    -- SELECT * ==> L???Y RA T???T C??? C??C C???T TRONG B???NG
select * from Department;
select * from groupAccount;
select * from TypeQuestion;
select * from CategoryQuestion;
select * from Question;
select * from Answer;
select * from Exam;
select * from ExamQuestion;

-- SELECT column1,column2,... FROM table_name ==> l???y ra c???t c???n thi???TABLE

SELECT AccountID, Email, Username FROM `Account`;



-- xem c???u tr??c b???ng `Account`
DESC `Account`;

-- Question 2: l???y ra t???t c??? c??c ph??ng 
SELECT * FROM Department;

-- Question 3: l???y ra id c???a ph??ng ban "Sale
SELECT * FROM Department WHERE DepartmentName = 'Sale';

-- Question 4: l???y ra th??ng tin account c?? full name d??i nh???t
-- b1: t??m ra fullname d??i nh???t : SELECT MAX(char_length(FullName)) From Account;
select * from `Account`;
SELECT * FROM Account WHERE char_length(FullName) = (SELECT MAX(char_length(FullName)) From Account);

-- Question 5: L???y ra th??ng tin account c?? full name d??i nh???t v?? thu???c ph??ng ban c?? id = 3
SELECT MAX(char_length(FullName)) from Account;
SELECT DepartmentID, count(DepartmentID) as soluongnhanvien FROM Account GROUP BY DepartmentID  HAVING(DepartmentID) = 3;

SELECT * FROM `Account`
WHERE length(FullName) = (SELECT MAX(char_length(FullName)) from Account)
AND DepartmentID = 3 ;

-- Question 6: L???y ra t??n group ???? tham gia tr?????c ng??y 20/12/2019
select * from `Group`;
SELECT * FROM `Group` WHERE CreateDate < '2019/12/20';

-- Question 7: L???y ra ID c???a question c?? >= 4 c??u tr??? l???i
select * from Answer;
SELECT QuestionID, count(QuestionID) as so_luong FROM Answer GROUP BY QuestionID HAVING count(QuestionID) >= 4;


-- Question 8: L???y ra c??c m?? ????? thi c?? th???i gian thi >= 60 ph??t v?? ???????c t???o tr?????c ng??y 20/12/2019
SELECT * FROM Exam WHERE Duration >= '60 ph??t' and  CreateDate <= '2019/12/20';

-- Question 9: L???y ra 5 group ???????c t???o g???n ????y 
 SELECT * FROM `Group` ORDER BY CreateDate DESC LIMIT 5;
 
-- Question 10: ?????m s??? nh??n vi??n thu???c department c?? id = 2
SELECT count(*) as so_luong FROM  `Account` WHERE DepartmentID = 2;

-- Question 11: L???y ra nh??n vi??n c?? t??n b???t ?????u b???ng ch??? "T" v?? k???t th??c b???ng ch??? "o"
SELECT * FROM `Account`;
SELECT * FROM `Account` WHERE FullName LIKE('T%') AND FullName LIKE('%o');		/* AND = V?? */
SELECT * FROM `Account` WHERE FullName LIKE('T%o');

-- SELECT * FROM `Account` WHERE FullName LIKE('??%') OR FullName LIKE('%o'); 		/* OR = HO???C */

-- Question 12: X??a t???t c??? c??c exam ???????c t???o tr?????c ng??y 20/12/2019

SELECT * From Exam;
SELECT * From ExamQuestion;
-- b1 x??a c??c ??ng con li??n k???t ?????n b???ng question
SELECT ExamID FROM Exam WHERE CreateDate < '2019/12/20';

DELETE FROM ExamQuestion
WHERE ExamID IN (SELECT ExamID FROM Exam WHERE CreateDate < '2019/12/20');

DELETE FROM Exam 
WHERE CreateDate < '2019/12/20';


-- Question 13: X??a t???t c??? c??c question c?? n???i dung b???t ?????u b???ng t??? "c??u h???i"
select * from Question;
select * from Answer;

SELECT QuestionID FROM Question WHERE Content LIKE ('C??u h???i%');
-- b1 x??a c??c ??ng con li??n k???t ?????n b???ng question
DELETE FROM Answer WHERE QuestionID IN (SELECT QuestionID FROM Question WHERE Content LIKE ('C??u h???i%'));
-- b2 
DELETE FROM Question WHERE Content LIKE ('C??u h???i%');

-- Question 14: Update th??ng tin c???a account c?? id = 5 th??nh t??n "Nguy???n B?? L???c" v?? email th??nh loc.nguyenba@vti.com.vn
SELECT * FROM `Account`;
UPDATE `Account` SET FullName =  N'Nguy???n B?? L???c', Email = 'loc.nguyenba@vti.com.vn' WHERE AccountID = 5;

-- Question 15: update account c?? id = 5 s??? thu???c group c?? id = 4
UPDATE `GroupAccount` SET AccountID = 5 WHERE GroupID = 4;

