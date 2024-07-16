
--update certificate
CREATE PROCEDURE UpdateCertificate
    @CertID INT,
    @CertName varchar(100),
    @IssueDate DATE,
    @Issuer varchar(100)
AS
BEGIN
    UPDATE certificates
    SET 
        cert_name = @CertName,
        issue_date = @IssueDate,
        issuer = @Issuer
    WHERE
        cert_id = @CertID;
END;



-- Declare variables to hold parameter values
DECLARE @CertID INT = 48; -- Replace with the actual CertID
DECLARE @CertName VARCHAR(100) = 'Information Technology (IT) Certifications';
DECLARE @IssueDate DATE = '2024-03-05'; -- Replace with the actual IssueDate
DECLARE @Issuer VARCHAR(100) = 'Coursera';

-- Execute the stored procedure
EXEC UpdateCertificate
    @CertID = @CertID,
    @CertName = @CertName,
    @IssueDate = @IssueDate,
    @Issuer = @Issuer;


------------------------------------------------

--update company

create PROCEDURE UpdateCompany
    @Company_Id int,
    @Company_Name varchar(100),
    @Location varchar(100)
   
AS
BEGIN
    UPDATE companies
    SET 
        Company_Name=  @Company_Name,
        Location =  @Location
       
    WHERE
        Company_Id = @Company_Id;
END;

-- Declare variables to hold parameter values
DECLARE @CompanyId INT = 22; -- Replace with the actual Company_Id
DECLARE @CompanyName VARCHAR(100) = 'concentrix';
DECLARE @Location VARCHAR(100) = 'october';


-- Execute the stored procedure
EXEC UpdateCompany
    @Company_Id = @CompanyId,
    @Company_Name = @CompanyName,
    @Location = @Location
    

-------------------------------------------------------
---update course

CREATE PROCEDURE UpdateCourse
    @Crs_Id INT,
    @Crs_Name VARCHAR(100),
    @Crs_Duration INT
   
AS
BEGIN
    UPDATE Course
    SET
        Crs_Name = @Crs_Name,
        Crs_Duration = @Crs_Duration
        
    WHERE
        Crs_Id = @Crs_Id;
END;


-- Declare variables to hold parameter values
DECLARE @Crs_IdToUpdate INT = 81; -- Replace with the actual Crs_Id
DECLARE @Crs_NameToUpdate VARCHAR(100) = 'software';
DECLARE @Crs_DurationToUpdate INT = 6; -- Replace with the actual Crs_Duration

-- Execute the stored procedure
EXEC UpdateCourse
    @Crs_Id = @Crs_IdToUpdate,
    @Crs_Name = @Crs_NameToUpdate,
    @Crs_Duration = @Crs_DurationToUpdate;


-------------------------------------------------------------
--update department

CREATE PROCEDURE UpdateDepartment
    @Dept_Id INT,
    @Dept_Name VARCHAR(100),
    @Dept_Location VARCHAR(100),
    @Dept_Manager INT,
    @Manager_hiredate DATE
AS
BEGIN
    UPDATE Department
    SET
        Dept_Name = @Dept_Name,
        Dept_Location = @Dept_Location,
        Dept_Manager = @Dept_Manager,
        Manager_hiredate = @Manager_hiredate
    WHERE
        Dept_Id = @Dept_Id;
END;

-- Declare variables to hold parameter values
DECLARE @Dept_IdToUpdate INT = 102; -- Replace with the actual Dept_Id
DECLARE @Dept_NameToUpdate VARCHAR(100) = 'human resource';
DECLARE @Dept_LocationToUpdate VARCHAR(100) = 'cairo';
DECLARE @Dept_ManagerToUpdate INT = 35; -- Replace with the actual Dept_Manager
DECLARE @Manager_hiredateToUpdate DATE = '2024-05-19'; -- Replace with the actual Manager_hiredate

-- Execute the stored procedure
EXEC UpdateDepartment
    @Dept_Id = @Dept_IdToUpdate,
    @Dept_Name = @Dept_NameToUpdate,
    @Dept_Location = @Dept_LocationToUpdate,
    @Dept_Manager = @Dept_ManagerToUpdate,
    @Manager_hiredate = @Manager_hiredateToUpdate;


-----------------------------------------------------------------------
--update exam 

CREATE PROCEDURE UpdateExam
    @Exam_Id INT,
    @Exam_Name VARCHAR(100),
    @Exam_Date DATE
    
AS
BEGIN
    UPDATE Exam
    SET
        Exam_Name = @Exam_Name,
        Exam_Date = @Exam_Date
       
    WHERE
        Exam_Id = @Exam_Id;
END;

-- Declare variables to hold parameter values
DECLARE @Exam_IdToUpdate INT = 318; -- Replace with the actual Exam_Id
DECLARE @Exam_NameToUpdate VARCHAR(100) = 'software';
DECLARE @Exam_DateToUpdate DATE = '2024-06-21'; -- Replace with the actual Exam_Date

-- Execute the stored procedure
EXEC UpdateExam
    @Exam_Id = @Exam_IdToUpdate,
    @Exam_Name = @Exam_NameToUpdate,
    @Exam_Date = @Exam_DateToUpdate;


--------------------------------------------------------------


--update freelancing

CREATE PROCEDURE UpdateFreelancing
    @Freelance_Id INT,
    @Freelance_Name VARCHAR(100),
    @St_Id INT
AS
BEGIN
    UPDATE Freelancing
    SET
        Freelance_Name = @Freelance_Name,
        St_Id = @St_Id
    WHERE
        Freelance_Id = @Freelance_Id;
END;

-- Declare variables to hold parameter values
DECLARE @Freelance_IdToUpdate INT = 5181; -- Replace with the actual Freelance_Id
DECLARE @Freelance_NameToUpdate VARCHAR(100) = 'solospere solution';
DECLARE @St_IdToUpdate INT = 177; -- Replace with the actual St_Id

-- Execute the stored procedure
EXEC UpdateFreelancing
    @Freelance_Id = @Freelance_IdToUpdate,
    @Freelance_Name = @Freelance_NameToUpdate,
    @St_Id = @St_IdToUpdate;

---------------------------------------------------
--update hiring 

CREATE PROCEDURE UpdateHiring
    @Hiring_Id INT,
    
    @Position_Id INT,
    @St_Id INT,
    @Hire_Date DATE
    
AS
BEGIN
    UPDATE Hiring
    SET
        
        Position_Id = @Position_Id,
        St_Id = @St_Id,
        Hire_Date = @Hire_Date
        
    WHERE
        Hiring_Id = @Hiring_Id;
END;


-- Declare variables to hold parameter values
DECLARE @Hiring_IdToUpdate INT = 379380; -- Replace with the actual Hiring_Id
DECLARE @Position_IdToUpdate INT = 94; -- Replace with the actual Position_Id
DECLARE @St_IdToUpdate INT = 330; -- Replace with the actual St_Id
DECLARE @Hire_DateToUpdate DATE = '2024-07-05'; -- Replace with the actual Hire_Date

-- Execute the stored procedure
EXEC UpdateHiring
    @Hiring_Id = @Hiring_IdToUpdate,
    @Position_Id = @Position_IdToUpdate,
    @St_Id = @St_IdToUpdate,
    @Hire_Date = @Hire_DateToUpdate;



----------------------------------------------------
--update instractor 

CREATE PROCEDURE UpdateInstructor
    @Ins_Id INT,
    @Ins_Name VARCHAR(100),
    @Salary INT
    
AS
BEGIN
    UPDATE Instructor
    SET
        Ins_Name = @Ins_Name,
        Salary = @Salary
        
    WHERE
        Ins_Id = @Ins_Id;
END;

-- Declare variables to hold parameter values
DECLARE @Ins_IdToUpdate INT = 21; -- Replace with the actual Ins_Id
DECLARE @Ins_NameToUpdate VARCHAR(100) = 'Sama';
DECLARE @SalaryToUpdate INT = 5000; -- Replace with the actual Salary

-- Execute the stored procedure
EXEC UpdateInstructor
    @Ins_Id = @Ins_IdToUpdate,
    @Ins_Name = @Ins_NameToUpdate,
    @Salary = @SalaryToUpdate;



------------------------------------------------------------
--update positions


CREATE PROCEDURE UpdatePosition
    @Position_Id INT,
    @Position_Name VARCHAR(100),
    @Salary INT
AS
BEGIN
    UPDATE Positions
    SET
        Position_Name = @Position_Name,
        Salary = @Salary
    WHERE
        Position_Id = @Position_Id;
END;

---------------------------------------------------------------------
--update project 

CREATE PROCEDURE UpdateProject
    @Project_Id INT,
    @Project_Name VARCHAR(100),
    @Start_Date DATE,
    @End_Date DATE
AS
BEGIN
    UPDATE Projects
    SET
        Project_Name = @Project_Name,
        Start_Date = @Start_Date,
        End_Date = @End_Date
    WHERE
        Project_Id = @Project_Id;
END;

------------------------------------------------------------

--update skills

CREATE PROCEDURE UpdateSkills
    @Skill_Id INT,
    @Skill_Name VARCHAR(100)
AS
BEGIN
    UPDATE Skills
    SET Skill_Name = @Skill_Name
    WHERE Skill_Id = @Skill_Id;
END;



-------------------------------------------------

--update student

CREATE PROCEDURE UpdateStudent
    @St_Id INT,
    
    @St_Lname VARCHAR(100),
    @St_Address VARCHAR(100),
    @St_Age INT,
    @Email VARCHAR(100),
    @Dept_Id INT,
   
    @Gender VARCHAR(50)
AS
BEGIN
    UPDATE Student
    SET
       
        St_Lname = @St_Lname,
        St_Address = @St_Address,
        St_Age = @St_Age,
        Email = @Email,
        Dept_Id = @Dept_Id,
        
        Gender = @Gender
    WHERE St_Id = @St_Id;
END;

-----------------------------------------------------

--update topic 

CREATE PROCEDURE UpdateTopic
    @Top_Id INT,
    @Top_Name VARCHAR(100)
AS
BEGIN
    UPDATE Topic
    SET
        Top_Name = @Top_Name
    WHERE Top_Id = @Top_Id;
END;

-----------------------------------
--update training 

CREATE PROCEDURE UpdateTraining
    @Train_ID INT,
    @Train_Name VARCHAR(100),
    @Start_Date DATE,
    @End_Date DATE
AS
BEGIN
    UPDATE Training
    SET
        Train_Name = @Train_Name,
        Start_Date = @Start_Date,
        End_Date = @End_Date
    WHERE Train_ID = @Train_ID;
END;
----------------------------------------------------------


