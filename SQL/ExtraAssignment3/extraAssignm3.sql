DROP DATABASE IF EXISTS fresherManagement_3;
CREATE DATABASE fresherManagement_3;
USE fresherManagement_3;

-- exercise1: design a table
-- Quesiton 1 tạo table với các ràng buộc và kiểu dl
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee(
TraineeID 			TINYINT AUTO_INCREMENT PRIMARY KEY, 
FullName	 		VARCHAR(50) NOT NULL,
BirthDate 			DATE,
Gender 				ENUM('male', 'female', 'unknown') NOT NULL,
ET_IQ 				TINYINT UNSIGNED NOT NULL,			/* Entry test point (IQ) - Điểm test đầu vào của thực tập sinh*/
					CHECK(ET_IQ <= 20),
ET_Gmath 			TINYINT UNSIGNED NOT NULL,			/* Entry test point (Gmath) - Điểm test đầu vào của thực tập sinh */
					CHECK(ET_Gmath <= 20),
ET_English			TINYINT UNSIGNED NOT NULL,			/* Entry test point (English) - Điểm test đầu vào của thực tập sinh */
					CHECK (ET_English <=50),
TrainingClass 		VARCHAR(10) NOT NULL,					/* mã lớp của thực tập sinh đang học */
EvaluationNotes 	VARCHAR(200)
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

-- Exercise 1: Tiếp tục với Database quản lý Fresher * TABLE Trainee *
desc trainee;
select * from Trainee;
-- Question 1: Thêm ít nhất 10 bản ghi vào table
INSERT INTO Trainee(TraineeID , FullName, BirthDate, Gender, ET_IQ, ET_Gmath, ET_English, TrainingClass, EvaluationNotes, VTIAccount)
				VALUES(1, 'Nguyễn Tấn Cường', '1999/04/04', 'male', 19, 19, 45, 'KT05', 'SV xuất sắc', 'cuongnguyen');
INSERT INTO Trainee(TraineeID, FullName, BirthDate, Gender, ET_IQ, ET_Gmath, ET_English, TrainingClass, EvaluationNotes,VTIAccount)
			VALUES(2, 'Nguyễn Lê Duy', '1998/03/02', 'male', 18, 16, 42,'KT05', 'SV xuất sắc', 'duynguyen');          
INSERT INTO Trainee(TraineeID, FullName, BirthDate, Gender, ET_IQ, ET_Gmath, ET_English, TrainingClass, EvaluationNotes, VTIAccount)
			VALUES(3, 'Nguyễn Minh Tuấn', '1999/12/18', 'male', 17, 18, 46, 'KT05', 'SV xuất sắc', 'minhtuan');            
INSERT INTO Trainee(TraineeID, FullName, BirthDate, Gender, ET_IQ, ET_Gmath, ET_English, TrainingClass, EvaluationNotes, VTIAccount)
			VALUES(4, 'Nguyễn Hải Đăng', '1999/6/18', 'male', 15, 17, 35, 'KT05', 'SV Giỏi', 'haidang');          
INSERT INTO Trainee(TraineeID, FullName, BirthDate, Gender, ET_IQ, ET_Gmath, ET_English, TrainingClass, EvaluationNotes, VTIAccount)
			VALUES(5,'Lê Ngọc Hân', '1999/2/1', 'female', 18, 15, 28, 'KT05', 'SV Giỏi', 'Ngochan');          
INSERT INTO Trainee(TraineeID, FullName, BirthDate, Gender, ET_IQ, ET_Gmath, ET_English, TrainingClass, EvaluationNotes, VTIAccount)
			VALUES(6, 'Nguyễn Trần Thảo Vy', '1999/3/3', 'female', 12, 14, 25, 'KT05', 'SV', 'thaovy');          
INSERT INTO Trainee(TraineeID, FullName, BirthDate, Gender, ET_IQ, ET_Gmath, ET_English, TrainingClass, EvaluationNotes, VTIAccount)
			VALUES(7, 'Nguyễn Anh Thơ', '1998/8/3', 'female', 12, 10, 17, 'KT05', 'SV', 'anhtho');           
INSERT INTO Trainee(TraineeID, FullName, BirthDate, Gender, ET_IQ, ET_Gmath, ET_English, TrainingClass, EvaluationNotes, VTIAccount)
			VALUES(8, 'Phạm Thành Trung', '1998/4/22', 'male', 8, 6, 18, 'KT05', 'SV', 'thanhtrung');          
INSERT INTO Trainee(TraineeID, FullName, BirthDate, Gender, ET_IQ, ET_Gmath, ET_English, TrainingClass, EvaluationNotes, VTIAccount)
			VALUES(9, 'Nguyễn Mai Anh', '1999/3/3', 'female', 5, 7, 16, 'KT05', 'SV', 'maianh');            
INSERT INTO Trainee(TraineeID, FullName, BirthDate, Gender, ET_IQ, ET_Gmath, ET_English, TrainingClass, EvaluationNotes, VTIAccount)
			VALUES(10, 'Trần Văn Tùng', '1999/3/3', 'female', 5, 5, 15, 'KT05', 'SV', 'tungtran');            
     
-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau

select GROUP_CONCAT(FullName), month(BirthDate)
 FROM Trainee
GROUP BY month(BirthDate);

-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
select * from Trainee;
-- b1 tìm fullname dài nhất
SELECT MAX(Char_length(FullName)) from Trainee;
-- b2 lấy ra fullname thỏa mãn đk = max
SELECT FullName FROM Trainee 
WHERE Char_length(FullName) = (SELECT MAX(Char_length(FullName)) from Trainee);

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
				--  ET_IQ + ET_Gmath>=20
				--  ET_IQ>=8
				--  ET_Gmath>=8
				--  ET_English>=18
SELECT * FROM Trainee
WHERE ET_IQ >= 8 
AND ET_Gmath >= 8 
AND ET_English >= 18 
AND (ET_IQ + ET_Gmath >= 20) ;

-- Question 5: xóa thực tập sinh có TraineeID = 3
DELETE FROM Trainee WHERE TraineeID = 3;
SELECT * FROM Trainee;

-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database

Update trainee set TrainingClass ='KT02' Where TraineeID = 4 ;
UPDATE Trainee SET TrainingClass = 'KT02' WHERE TraineeID = 5;
