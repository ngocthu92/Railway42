-- Exercise 1: Tiếp tục với Database Testing System (Sử dụng subquery hoặc CTE)
USE Testing_System_Assignment_3;

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
		-- account join với department qua departmentID
CREATE VIEW NV_sale as
SELECT D.DepartmentName FROM Account A
INNER JOIN Department D ON D.DepartmentID = A.DepartmentID
WHERE D.DepartmentID = (SELECT DepartmentID FROM Department WHERE DepartmentName = 'sale');

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
SELECT * from Account;
SELECT * from GroupAccount;
-- tim max
SELECT MAX(Solg) FROM (SELECT COUNT(AccountID) as Solg FROM GroupAccount GROUP BY AccountID) as Temp;

CREATE VIEW Account_Group AS
SELECT A.FullName, A.UserName,A.Email, COUNT(GA.AccountID) as Solg FROM GroupAccount GA
JOIN Account A ON GA.AccountID = A.AccountID
GROUP BY (GA.AccountID)
HAVING  COUNT(GA.AccountID) = (SELECT MAX(Solg) FROM (SELECT COUNT(AccountID) as Solg FROM GroupAccount GROUP BY AccountID) as Temp);

SELECT * FROM Account_Group;

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
SELECT * FROM ExamQuestion;
SELECT * FROM Question;
SELECT * FROM Answer;

DELETE from Question where QuestionID In (4);

SELECT QuestionID,Content FROM Question 
WHERE char_length(Content) > 70;
-- foreing key với bảng answer---> xóa fk trong bảng answer trc
-- fk với bảng examQuestion ----> xóa trongn bảng examQuestion
SELECT QuestionID from Question WHERE char_length(Content) > 70;
DROP view Question_content;

CREATE VIEW Question_content as
SELECT QU.QuestionID from Question QU WHERE char_length(QU.Content) > 70;

DELETE FROM Answer WHERE QuestionID IN (SELECT * FROM Question_content);
DELETE FROM Examquestion WHERE QuestionID IN (SELECT * FROM Question_content);

DELETE FROM Question Q WHERE Q.QuestionID 
IN (select quesID from (SELECT QC.QuestionID as quesID FROM Question_content QC) as temp);

SELECT QC.QuestionID as quesID FROM Question_content QC;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
select * FROM Department;
SELECT * FROM Account;

SELECT MAX(soNV) FROM(SELECT COUNT(AccountID) as soNV FROM Account GROUP BY AccountID) as temp;


/* CTE ds phòng ban nhiều NV nhất*/
SELECT DepartmentName, COUNT(A.DepartmentID) as CountNV from Account A
INNER JOIN Department D ON A.DepartmentID = D.DepartmentID
GROUP BY A.DepartmentID 
HAVING COUNT(A.DepartmentID) 
= (SELECT MAX(CountNV) FROM (SELECT A.DepartmentID , COUNT(A.DepartmentID) as CountNV FROM Account A GROUP BY A.DepartmentID) as temp);

WITH countSL as (SELECT A.DepartmentID , COUNT(A.DepartmentID) as CountNV FROM Account A GROUP BY A.DepartmentID),
maxsoluong as (SELECT MAX(CountNV) FROM countSL)
SELECT DepartmentName, COUNT(A.DepartmentID) as CountNV from Account A
INNER JOIN Department D ON A.DepartmentID = D.DepartmentID
GROUP BY A.DepartmentID 
HAVING COUNT(A.DepartmentID) = (SELECT * FROM maxsoluong);




-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn 
/* view */
CREATE VIEW vw_Q_HoNguyen as
SELECT Q.*,A.FullName FROM Question Q
INNER JOIN `Account` A ON Q.CreatorID = A.AccountID
WHERE substring_index(A.FullName, ' ', 1)='Nguyễn';

/* CTE tìm ra ds các câu hỏi do user họ Nguyễn tạo */
 WITH cte_account_Nguyen AS(select AccountID From Account where FullName LIKE 'Nguyễn%') 
 SELECT * FROM Question
 WHERE CreatorID IN (SELECT AccountID FROM cte_account_Nguyen);