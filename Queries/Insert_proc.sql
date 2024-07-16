CREATE PROCEDURE InsertCertificate
    @Cert_Name VARCHAR(100),
    @Issuer VARCHAR(100),
    @Issue_Date DATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Certificates] ([Cert_Name], [Issuer], [Issue_Date])
    VALUES (@Cert_Name, @Issuer, @Issue_Date);

    SELECT SCOPE_IDENTITY() AS Cert_Id;
END;


-- Declare variables to hold values for insertion
DECLARE @Cert_Name VARCHAR(100) = 'SQL Mastery',
        @Issuer VARCHAR(100) = 'DataCamp',
        @Issue_Date DATE = '2023-05-15';

-- Execute the stored procedure to insert data
EXEC InsertCertificate @Cert_Name, @Issuer, @Issue_Date;
------------------------------------------------------------------------------------------------------------

create PROCEDURE InsertCompany
    @Company_Name VARCHAR(100),
    @Location VARCHAR(100),
   @Training_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Companies] ([Company_Name], [Location],[Training_ID])
    VALUES (@Company_Name, @Location, @Training_ID);
END;

-- Declare variables to hold values for insertion
DECLARE @Company_Name VARCHAR(100) = 'Tech Solutions Inc.',
        @Location VARCHAR(100) = 'New York',
       @Training_ID INT = 31; -- Assuming the Training_ID exists in the Training table

-- Execute the stored procedure to insert data
EXEC InsertCompany @Company_Name, @Location ,@Training_ID;

--------------------------------------------------------------------------------------------------------

create PROCEDURE InsertCourse
    @Crs_Name VARCHAR(100),
    @Crs_Duration INT,
    @Top_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Course] ([Crs_Name], [Crs_Duration], [Top_Id])
    VALUES (@Crs_Name, @Crs_Duration, @Top_Id);
END;

-- Declare variables to hold values for insertion
DECLARE @Crs_Name VARCHAR(100) = 'Advanced SQL',
        @Crs_Duration INT = 30,
        @Top_Id INT = 10 -- Assuming the Top_Id exists in the Topic table

-- Execute the stored procedure to insert data
EXEC InsertCourse @Crs_Name, @Crs_Duration, @Top_Id;


-------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE InsertDepartment
    @Dept_Name VARCHAR(100),
    @Dept_Location VARCHAR(100),
    @Dept_Manager INT,
    @Manager_hiredate DATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Department] ([Dept_Name], [Dept_Location], [Dept_Manager], [Manager_hiredate])
    VALUES (@Dept_Name, @Dept_Location, @Dept_Manager, @Manager_hiredate);
END;

-- Declare variables to hold values for insertion
DECLARE @Dept_Name VARCHAR(100) = 'Engineering',
        @Dept_Location VARCHAR(100) = 'Headquarters',
        @Dept_Manager INT = 21, -- Assuming the Dept_Manager exists in the Instructor table
        @Manager_hiredate DATE = '2023-01-15';

-- Execute the stored procedure to insert data
EXEC InsertDepartment @Dept_Name, @Dept_Location, @Dept_Manager, @Manager_hiredate;


-----------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertExam
    @Exam_Name VARCHAR(100),
    @Exam_Date DATE,
    @Crs_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Exam] ([Exam_Name], [Exam_Date], [Crs_Id])
    VALUES (@Exam_Name, @Exam_Date, @Crs_Id);
END;


-- Declare variables to hold values for insertion
DECLARE @Exam_Name VARCHAR(100) = 'Final Exam',
        @Exam_Date DATE = '2024-05-20',
        @Crs_Id INT = 81; -- Assuming the Crs_Id exists in the Course table

-- Execute the stored procedure to insert data
EXEC InsertExam @Exam_Name, @Exam_Date, @Crs_Id;

----------------------------------------------------------------------------------------------------------
alter PROCEDURE InsertExamAnswer
    @Answer_Text VARCHAR(100),
   @Question_Id INT,
   @Score INT,
   @st_id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Exam_answers] ([Answer_Text],[Question_Id] ,[Score],[St_Id])
    VALUES (@Answer_Text,@Question_Id, @Score,  @st_id );
END;


-- Declare variables to hold values for insertion
DECLARE @Answer_Text VARCHAR(100) = 'False',
        @Question_Id INT = 270, -- Assuming the Question_Id exists in the Exam_questions table
        @Score INT = 1,
		@st_id int=106

-- Execute the stored procedure to insert data
EXEC InsertExamAnswer @Answer_Text, @Question_Id, @Score ,@st_id;


-------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertExamQuestion
    @Question_Text VARCHAR(100),
    @Question_Type VARCHAR(50),
	@Correct_ans int,
	@Category varchar(100)
    
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Exam_questions] ( [Question_Text], [Question_Type],[Correct_Answer_Id],[Category_Name])
    VALUES ( @Question_Text, @Question_Type,@Correct_ans ,@Category);
END;

-- Declare variables to hold values for insertion
DECLARE  
        @Question_Text VARCHAR(100) = 'Which memory management technique allows processes to be moved between main memory and disk during execution?',
        @Question_Type VARCHAR(50) = 'MCQ',
        @Correct_ans int= 0,
		@Category varchar(100)='Operating Systems'
-- Execute the stored procedure to insert data
EXEC InsertExamQuestion  @Question_Text, @Question_Type , @Correct_ans ,@Category;



-----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertFreelancing
    @Freelance_Name VARCHAR(100),
    @St_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Freelancing] ([Freelance_Name],[St_Id])
    VALUES (@Freelance_Name,@St_Id);
END;


-- Declare variables to hold values for insertion
DECLARE @Freelance_Name VARCHAR(100) = 'John Doe',
       @St_Id INT = 105; -- Assuming the St_Id exists in the Student table

-- Execute the stored procedure to insert data
EXEC InsertFreelancing @Freelance_Name ,@St_Id;

--------------------------------------------------------------------------------------------------------

CREATE PROCEDURE InsertHiring
    @Company_Id INT,
    @Position_Id INT,
    @St_Id INT,
    @Hire_Date DATE,
    @ContractLength INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Hiring] ([Company_Id], [Position_Id], [St_Id], [Hire_Date], [ContractLength])
    VALUES (@Company_Id, @Position_Id, @St_Id, @Hire_Date, @ContractLength);
END;
----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertInstructor
    @Ins_Name VARCHAR(100),
    @Salary INT,
    @Dept_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Instructor] ([Ins_Name], [Salary], [Dept_Id])
    VALUES (@Ins_Name, @Salary, @Dept_Id);
END;
-----------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertInstructorCourse
    @Ins_Id INT,
    @Crs_Id INT,
    @Evaluation VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Instructor_course] ([Ins_Id], [Crs_Id], [Evaluation])
    VALUES (@Ins_Id, @Crs_Id, @Evaluation);
END;
-------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertPosition
    @Position_Name VARCHAR(100),
    @Salary INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Positions] ([Position_Name], [Salary])
    VALUES (@Position_Name, @Salary);
END;
------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertProject
    @Project_Name VARCHAR(100),
    @Start_Date DATE,
    @End_Date DATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Projects] ([Project_Name], [Start_Date], [End_Date])
    VALUES (@Project_Name, @Start_Date, @End_Date);
END;
----------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertQuesExam
    @Ex_Id INT,
    @Q_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Ques_Exam] ([Ex_Id], [Q_Id])
    VALUES (@Ex_Id, @Q_Id);
END;
--------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertQuestionOption
    @Option_Text VARCHAR(10),
    @IsCorrect INT,
    @Question_Id INT
    
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Question_options] ([Option_Text], [IsCorrect], [Question_Id])
    VALUES (@Option_Text, @IsCorrect, @Question_Id);
END;
------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertSkill
    @Skill_Name VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Skills] ([Skill_Name])
    VALUES (@Skill_Name);
END;
----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertStExam
    @St_Id INT,
    @Ex_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[St_Exam] ([St_Id], [Ex_Id])
    VALUES (@St_Id, @Ex_Id);
END;
-------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertStudent
    @St_Fname VARCHAR(100),
    @St_Lname VARCHAR(100),
    @St_Address VARCHAR(100),
    @St_Age INT,
    @Email VARCHAR(100),
    @Dept_Id INT,
    @St_super INT,
    @Gender VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Student] ([St_Fname], [St_Lname], [St_Address], [St_Age], [Email], [Dept_Id], [St_super], [Gender])
    VALUES (@St_Fname, @St_Lname, @St_Address, @St_Age, @Email, @Dept_Id, @St_super, @Gender);
END;
----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertStudentCertificate
    @St_Id INT,
    @Cert_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Student_Certificates] ([St_Id], [Cert_Id])
    VALUES (@St_Id, @Cert_Id);
END;
------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertStudentCourse
    @Crs_Id INT,
    @St_Id INT,
    @Grade INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Student_course] ([Crs_Id], [St_Id], [Grade])
    VALUES (@Crs_Id, @St_Id, @Grade);
END;
---------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertStudentProject
    @St_Id INT,
    @Pro_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Student_Project] ([St_Id], [Pro_Id])
    VALUES (@St_Id, @Pro_Id);
END;
--------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertStudentSkill
    @Sk_Id INT,
    @St_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Student_skills] ([Sk_Id], [St_Id])
    VALUES (@Sk_Id, @St_Id);
END;
----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertTopic
    @Top_Name VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Topic] ([Top_Name])
    VALUES (@Top_Name);
END;
---------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertTraining
    @Train_Name VARCHAR(100),
    @Start_Date DATE,
    @End_Date DATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Training] ([Train_Name], [Start_Date], [End_Date])
    VALUES (@Train_Name, @Start_Date, @End_Date);
END;
----------------------------------------------------------------------------





