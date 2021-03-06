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
 
 
-- ***Insert data v??o 11 table***
-- TH??M DL b???ng Department
INSERT INTO Department(DepartmentID,DepartmentName) VALUES(1, 'Ph??ng Nh??n S???');
INSERT INTO Department(DepartmentID,DepartmentName) VALUES(2, 'Ph??ng H??nh Ch??nh');
INSERT INTO Department(DepartmentID,DepartmentName) VALUES(3, 'Ph??ng Marketing');
INSERT INTO Department(DepartmentName) VALUES('Ph??ng K??? To??n');
INSERT INTO Department(DepartmentName) VALUES('Ph??ng K??? Thu???t');
INSERT INTO Department(DepartmentName) VALUES('Ph??ng Ki???m ?????nh');
INSERT INTO Department(DepartmentName) VALUES('Ph??ng Sale');
INSERT INTO Department(DepartmentName) VALUES('Ph??ng B???o v???');
INSERT INTO Department(DepartmentName) VALUES('Gi??m ?????c');
INSERT INTO Department(DepartmentName) VALUES('P.Gi??m ?????c');
INSERT INTO Department(DepartmentName) VALUES('Th?? k??' );


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
				VALUES(1, 'giahuy0660@gmail.com', 'Gia Huy', 'Nguy???n Gia Huy', 2, 4, '2021/2/2');
INSERT INTO `Account`(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES(2, 'huonglyy281@gmail.com', 'H????ng Ly', '??o??n H????ng Ly', 2, 1, '2021/2/2');
INSERT INTO `Account`(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES(3, 'phuongnga51@gmail.com', 'Ph????ng Nga', 'Tr???n Ph????ng Nga', 4, 2, '2020/1/8');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('hangbee103@gmail.com', 'H???ng Bee',	'Nguy???n Th??? H???ng', 6, 3, '2019/5/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('mai2196@gmail.com', 'Mai Anh', 'Ho??ng Mai Anh', 5, 2, '2018/7/4');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('meohenpc1@gmail.com', 'Minh Ng???c', 'L?? Minh Ng???c', 4, 3, '2020/8/9');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('ngoctu@gmail.com', 'Ng???c T??', 'Mai Ng???c T??',5, 1, '2021/5/2');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('hungnguyen961218@gmail.com', 'H??ng Nguy???n', 'Nguy???n ????nh H??ng', 3, 4, '2019/12/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
				VALUES('phuonganh01@gmail.com', 'ch??p c??i', 'Nguy???n Ph????ng Anh',1, 3, '2019/12/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('xuka123@gmail.com', 'xuka123', '?????ng B???o Giang', 10, 4 , '2019/12/7');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('doreamon01@gmail.com', 'monchan', 'L?? T??m Anh', 1, 4,'2018/12/10');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('phuongdung@gmail.com', 'dunghip', 'Nguy???n Ph????ng Dung',9, 2,'2018/12/10');               
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('anhdao01@gmail.com', 'daocoi', 'Tr???n Anh ????o',8, 1,'2019/12/1');
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('baongoc@gmail.com', 'baongoc', 'Nguy???n B???o Ng???c',7, 1,'2020/1/2');                
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('lebaongoc@gmail.com', 'lengoc', 'L?? B???o Ng???c',6, 1,'2019/3/2');               
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
				VALUES('phuongvy@gmail.com', 'akichan', 'Nguy???n Ph????ng Vy',6, 1,'2020/7/2');                  
                
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
INSERT INTO TypeQuestion(TypeID, TypeName) VALUES(1, 'Essay'); /* t??? lu???n*/
INSERT INTO TypeQuestion(TypeID, TypeName) VALUES(2, 'Multiple-Choice'); /* tr???c nghi???m*/

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
			VALUES(3,'C??u l???nh SQL n??o ???????c d??ng ????? x??a d??? li???u t??? Database?', 2, 1, 3,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(4,'Trong SQL l??m th??? n??o ????? ch???n c???t d??? li???u c?? t??n FirstName t??? b???ng Persons?',2, 1, 3, '2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(5, 'Trong SQL l??m th??? n??o ????? ch???n t???t c??? c??c c???t d??? li???u trong b???ng Persons?', 2, 1, 3, '2020/5/6');
            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(6, 'D???u ; ???????c s??? d???ng ????? k???t th??c l???nh trong java?', 3, 2, 4,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(7, 'Ng??n ng??? java c?? ph??n bi???t ch??? hoa ch??? th?????ng?', 3, 2, 4,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(8, 'java l?? ng??n ng??? l???p tr??nh h?????ng ?????i t?????ng?', 4, 2, 8,'2020/5/6');
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(9, 'Ch????ng tr??nh vi???t b???ng java ch??? c?? th??? ch???y ???????c tr??n HDH win?', 4, 2, 8,'2020/5/6');
            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(10, 'Python l?? ng??n ng??? l???p tr??nh c???p cao?', 5, 2, 3,'2020/5/6');            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(11, 'Python l?? ng??n ng??? l??p tr??nh h?????ng ?????i t?????ng?', 6, 2, 3,'2020/5/6');            
INSERT INTO Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES(12, 'C??u h???i th??m?', 3, 1, 3,'2020/5/6');
            
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



-- them DL table Exam
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(1, 'SQL1', '????? thi SQL1',1, '30 ph??t', 2, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(2,'SQL1', '????? thi SQL1', 1,'30 ph??t', 2, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(3,'SQL2', '????? thi SQL2', 2,'30 ph??t', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(4,'SQL2', '????? thi SQL2', 2,'30 ph??t', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(5,'SQL2', '????? thi SQL2', 2,'30 ph??t', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(6,'JAVA1', 'C??u h???i JAVA', 1,'45 ph??t', 4, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(7,'JAVA1', 'C??u h???i JAVA', 1,'45 ph??t', 4, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(8,'JAVA2', 'C??u h???i JAVA', 2,'60 ph??t', 8, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(9,'JAVA2', 'C??u h???i JAVA', 2,'60 ph??t', 8, '2019/12/20');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(10,'PYTHON1', '????? thi PYTHON', 1,'30 ph??t', 3, '2020/5/6');
INSERT INTO Exam(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES(11,'PYTHON2', '????? thi PYTHON', 1,'30 ph??t', 3, '2020/5/6');


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



-- xem c???u tr??c b???ng `Account`
-- DESC `Account`;

/**** Exercise 1: Join****/
-- Question 1: Vi???t l???nh ????? l???y ra danh s??ch nh??n vi??n v?? th??ng tin ph??ng ban c???a h???
select * from Department;
select * from Account;

SELECT A.*,D.DepartmentName
FROM Account as A
INNER JOIN Department as D ON A.DepartmentID = D.departmentID;

-- Question 2: Vi???t l???nh ????? l???y ra th??ng tin c??c account ???????c t???o sau ng??y 20/12/2020
select * from Account;
select * from Department;
select * from Position;

SELECT A.*, P.PositionName, D.DepartmentName
FROM Account as A
JOIN Position as P ON A.PositionID = P.PositionID
JOIN Department as D ON A.DepartmentID = D.DepartmentID
WHERE CreateDate > '2020/12/20';


-- Question 3: Vi???t l???nh ????? l???y ra t???t c??? c??c developer

SELECT A.*, D.DepartmentName, P.PositionName
FROM Account as A
JOIN Position as P ON P.PositionID = A.PositionID
JOIN Department as D ON A.DepartmentID = D.DepartmentID 
WHERE PositionName = 'DEV';

-- Question 4: Vi???t l???nh ????? l???y ra danh s??ch c??c ph??ng ban c?? >3 nh??n vi??n

SELECT DepartmentName, COUNT(A.DepartmentID) as SoNV FROM Department D
JOIN Account as A ON A.DepartmentID = D.DepartmentID
GROUP BY A.DepartmentID
HAVING COUNT(A.DepartmentID) >= 3;

-- Question 5: Vi???t l???nh ????? l???y ra danh s??ch c??u h???i ???????c s??? d???ng trong ????? thi nhi???u nh???t
select * from Question;
select * from ExamQuestion;

-- V??? PH???I:
SELECT MAX(SoCauHoi) FROM (SELECT COUNT(QuestionID) as SoCauHoi FROM ExamQuestion GROUP BY QuestionID) as Temp;

-- V??? TR??I:
SELECT Q.QuestionID,  Q.Content, COUNT(Q.QuestionID) as SoCauHoi FROM ExamQuestion EXQ
JOIN Question as Q ON Q.QuestionID = EXQ.QuestionID
GROUP BY (EXQ.QuestionID)
HAVING COUNT(Q.QuestionID) = (SELECT MAX(SoCauHoi) FROM (SELECT COUNT(QuestionID) as SoCauHoi FROM ExamQuestion GROUP BY QuestionID) as Temp);


-- Question 6: Th???ng k?? m???i category Question ???????c s??? d???ng trong bao nhi??u Question
select * from CategoryQuestion;
select * from Question;

 -- left join l???y b???ng CategoryQuestion
 SELECT CQ.CategoryID, CQ.CategoryName, COUNT(Q.CategoryID) as so_cate_ques FROM CategoryQuestion CQ
LEFT JOIN Question as Q ON CQ.CategoryID = Q.CategoryID
GROUP BY (CQ.CategoryID)
ORDER BY  CQ.CategoryID ASC;

-- Question 7: Th??ng k?? m???i Question ???????c s??? d???ng trong bao nhi??u Exam
select * from Question;
select * from ExamQuestion;

SELECT Q.QuestionID, Content, COUNT(EQ.QuestionID) as so_ques_ex FROM  Question Q
LEFT JOIN ExamQuestion as EQ  ON EQ.QuestionID = Q.QuestionID
GROUP BY (Q.QuestionID)
ORDER BY EQ.ExamID ASC;

-- Question 8: L???y ra Question c?? nhi???u c??u tr??? l???i nh???t
select * from Question;
select * from Answer;
SELECT MAX(socautraloi) FROM (SELECT COUNT(AnswerID) as socautraloi FROM Answer GROUP BY QuestionID) as Temp;

SELECT Q.QuestionID, Q.Content, COUNT(AnswerID) as socautraloi FROM Answer A 
JOIN Question as Q ON Q.QuestionID = A.QuestionID
GROUP BY (A.QuestionID)
HAVING (Q.QuestionID) = (SELECT MAX(socautraloi) FROM (SELECT COUNT(AnswerID) as socautraloi FROM Answer GROUP BY QuestionID) as Temp);


-- Question 9: Th???ng k?? s??? l?????ng account trong m???i group
select * from groupAccount;
select * from `Group`;
 
 SELECT G.GroupID, G.GroupName, COUNT(GA.AccountID) as solg_acc
 FROM groupAccount GA
 RIGHT JOIN `Group` as G ON GA.GroupID = G.GroupID
 GROUP BY G.GroupID
 ORDER BY G.GroupID ASC;
 
-- Question 10: T??m ch???c v??? c?? ??t ng?????i nh???t
SELECT * FROM `Position`;
SELECT * FROM `Account`;

SELECT MIN(SolgNV) FROM (SELECT COUNT(PositionID) as SolgNV FROM `Account` GROUP BY PositionID) as Temp;

SELECT P.PositionName, COUNT(A.PositionID) as SolgNV FROM Position P
JOIN Account A ON P.PositionID = A.PositionID
GROUP BY (A.PositionID)
HAVING COUNT(A.PositionID) = (SELECT MIN(SolgNV) FROM (SELECT COUNT(PositionID) as SolgNV FROM `Account` GROUP BY PositionID) as Temp);

-- Question 11: Th???ng k?? m???i ph??ng ban c?? bao nhi??u dev, test, scrum master, PM
select * from department;
select * from Position;
select * from Account;

/* SELECT * FROM department D
CROSS JOIN Position P; */

-- b1 join l???n l?????t t???ng DepartmentID v???i b???ng Position g???i l?? b???ng t1
SELECT t1.DepartmentID, t1.PositionID
 FROM 
(SELECT D.DepartmentID, P.PositionID  FROM Department D
CROSS JOIN Position P
WHERE P.PositionName IN('Dev', 'Test', 'Scrum Master', 'PM')
ORDER BY D.DepartmentID, P.PositionID) as t1;

-- b2 t??m s??? lg account c???a t???ng ch???c v??? trong t???ng ph??ng g???i l?? b???ng t2
SELECT D.DepartmentID, P.PositionID, COUNT(A.AccountID) as soAccount
FROM `Position` P
LEFT JOIN `Account` A on A.PositionID = P.PositionID
RIGHT JOIN Department D on A.DepartmentID = D.DepartmentID
WHERE  P.PositionName IN('Dev', 'Test', 'Scrum Master', 'PM')
GROUP BY D.DepartmentID, P.PositionID;

-- b3 join b???ng t1 v???i b???ng t2
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


-- Question 12: L???y th??ng tin chi ti???t c???a c??u h???i bao g???m th??ng tin c?? b???n c???a Question, lo???i c??u h???i, ai l?? ng?????i t???o ra c??u h???i, c??u tr??? l???i l?? g??, ...
SELECT Q.QuestionID, Q.Content, TQ.TypeName, Q.CreatorID, A.Username, An.Content 
FROM Question Q
INNER JOIN TypeQuestion TQ ON Q.TypeID = TQ.TypeID
INNER JOIN Answer An ON Q.QuestionID = An.QuestionID
INNER JOIN Account A ON A.AccountID = Q.CreatorID;


-- Question 13: L???y ra s??? l?????ng c??u h???i c???a m???i lo???i t??? lu???n hay tr???c nghi???m
/* b1 count s??? lg c??u h???i theo typeID */
SELECT TypeID, COUNT(TypeID) as solg FROM Question GROUP BY TypeID;

/*b2 join table TypeQuestion v???i Question */
select Q.TypeID, TQ.TypeName, COUNT(Q.TypeID) as solg 
FROM TypeQuestion TQ
JOIN Question Q ON TQ.TypeID = Q.TypeID
GROUP BY Q.TypeID;

-- Question 14:L???y ra `group` kh??ng c?? account n??o

SELECT DISTINCT G.GroupName
FROM `Group` G
LEFT JOIN GroupAccount GA ON G.GroupID = GA.GroupID
WHERE GA.AccountID IS NULL;

-- Question 15: L???y ra group kh??ng c?? account n??o
SELECT * FROM `Group`
WHERE GroupID NOT IN ( SELECT GroupID FROM GroupAccount);


-- Question 16: L???y ra question kh??ng c?? answer n??o
SELECT * FROM Question 
WHERE QuestionID NOT IN (SELECT QuestionID FROM Answer);


/****Exercise 2: Union ****/
-- Question 17: 
/*		a) L???y c??c account thu???c nh??m th??? 1
		b) L???y c??c account thu???c nh??m th??? 2
		c) Gh??p 2 k???t qu??? t??? c??u a) v?? c??u b) sao cho kh??ng c?? record n??o tr??ng nhau */
        
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
/*		a) L???y c??c group c?? l???n h??n 5 th??nh vi??n
		b) L???y c??c group c?? nh??? h??n 7 th??nh vi??n
		c) Gh??p 2 k???t qu??? t??? c??u a) v?? c??u b)  */
        
        
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
