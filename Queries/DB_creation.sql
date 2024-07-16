CREATE TABLE [dbo].[Student](
    [St_Id] int IDENTITY(1,1) NOT NULL,
    [St_Fname] varchar(100),
    [St_Lname] varchar(100),
    [St_Address] varchar(100),
    [St_Age] int,
    [Email] varchar(100),
    [Dept_Id] int,
    [St_super] int,
    [Gender] varchar(50),
    CONSTRAINT [FK_Student_Department] FOREIGN KEY([Dept_Id]) REFERENCES [dbo].[Department] ([Dept_Id]),
    CONSTRAINT [FK_Student_Student] FOREIGN KEY([St_super]) REFERENCES [dbo].[Student] ([St_Id]))

CREATE TABLE [dbo].[Department](
    [Dept_Id] int IDENTITY(1,1) NOT NULL,
    [Dept_Name] varchar(100),
    [Dept_Location] varchar(100),
    [Dept_Manager] int,
    [Manager_hiredate] date,
    CONSTRAINT [FK_Department_Instructor] FOREIGN KEY([Dept_Manager]) REFERENCES [dbo].[Instructor] ([Ins_Id]))

CREATE TABLE [dbo].[Instructor](
    [Ins_Id] int IDENTITY(1,1) NOT NULL,
    [Ins_Name] varchar(100),
    [Salary] int,
    [Dept_Id] int,
    CONSTRAINT [FK_Instructor_Department] FOREIGN KEY([Dept_Id]) REFERENCES [dbo].[Department] ([Dept_Id]))

CREATE TABLE [dbo].[Course](
    [Crs_Id] int IDENTITY(1,1) NOT NULL,
    [Crs_Name] varchar(100),
    [Crs_Duration] int,
    [Top_Id] int,
    CONSTRAINT [FK_Course_Topic] FOREIGN KEY([Top_Id]) REFERENCES [dbo].[Topic] ([Top_Id]))


CREATE TABLE [dbo].[Topic](
    [Top_Id] int IDENTITY(1,1) NOT NULL,
    [Top_Name] varchar(100))


CREATE TABLE [dbo].[Skills](
    [Skill_Id] int IDENTITY(1,1) NOT NULL,
    [Skill_Name] varchar(100))


CREATE TABLE [dbo].[Student_skills](
    [Sk_St_id] int IDENTITY(1,1) NOT NULL,
    [Sk_Id] int,
    [St_Id] int,
    CONSTRAINT [FK_Student_skills_Skills] FOREIGN KEY([Sk_Id]) REFERENCES [dbo].[Skills] ([Skill_Id]),
    CONSTRAINT [FK_Student_skills_Student] FOREIGN KEY([St_Id]) REFERENCES [dbo].[Student] ([St_Id]))


CREATE TABLE [dbo].[Student_course](
    [Crs_Id] int,
    [St_Id] int,
    [Grade] int,
    [crs_st_id] int IDENTITY(1,1) NOT NULL,
    CONSTRAINT [FK_Student_course_Course] FOREIGN KEY([Crs_Id]) REFERENCES [dbo].[Course] ([Crs_Id]),
    CONSTRAINT [FK_Student_course_Student] FOREIGN KEY([St_Id]) REFERENCES [dbo].[Student] ([St_Id]))


CREATE TABLE [dbo].[Instructor_course](
    [Ins_Crs_ID] int IDENTITY(1,1) NOT NULL,
    [Ins_Id] int,
    [Crs_Id] int,
    [Evaluation] varchar(100) NULL,
    CONSTRAINT [FK_Instructor_course_Instructor] FOREIGN KEY([Ins_Id]) REFERENCES [dbo].[Instructor] ([Ins_Id]),
    CONSTRAINT [FK_Instructor_course_Course] FOREIGN KEY([Crs_Id]) REFERENCES [dbo].[Course] ([Crs_Id]))


CREATE TABLE [dbo].[Certificates](
    [Cert_Id] int IDENTITY(1,1) NOT NULL,
    [Cert_Name] varchar(100),
    [Issuer] varchar(100),
    [Issue_Date] date)


CREATE TABLE [dbo].[Student_Certificates](
    [St_Cer_ID] int IDENTITY(1,1) NOT NULL,
    [St_Id] int,
    [Cert_Id] int,
    CONSTRAINT [FK_Student_Certificates_Student] FOREIGN KEY([St_Id]) REFERENCES [dbo].[Student] ([St_Id]),
    CONSTRAINT [FK_Student_Certificates_Certificates] FOREIGN KEY([Cert_Id]) REFERENCES [dbo].[Certificates] ([Cert_Id]))


CREATE TABLE [dbo].[Freelancing](
    [Freelance_Id] int IDENTITY(1,1) NOT NULL,
    [Freelance_Name] varchar(100) NULL,
    [St_Id] int NULL,
    CONSTRAINT [FK_Freelancing_Student] FOREIGN KEY([St_Id]) REFERENCES [dbo].[Student] ([St_Id]))


CREATE TABLE [dbo].[Companies](
    [Company_Id] int IDENTITY(1,1) NOT NULL,
    [Company_Name] varchar(100),
    [Location] varchar(100),
    [Training_ID] int,
    CONSTRAINT [FK_Companies_Training] FOREIGN KEY([Training_ID]) REFERENCES [dbo].[Training] ([Train_ID]))


CREATE TABLE [dbo].[Positions](
    [Position_Id] int IDENTITY(1,1) NOT NULL,
    [Position_Name] varchar(100),
    [Salary] int)


CREATE TABLE [dbo].[Hiring](
    [Hiring_Id] int IDENTITY(1,1) NOT NULL,
    [Company_Id] int,
    [Position_Id] int,
    [St_Id] int,
    [Hire_Date] date,
    [ContractLength] int,
    CONSTRAINT [FK_Hiring_Companies] FOREIGN KEY([Company_Id]) REFERENCES [dbo].[Companies] ([Company_Id]),
    CONSTRAINT [FK_Hiring_Positions] FOREIGN KEY([Position_Id]) REFERENCES [dbo].[Positions] ([Position_Id]),
    CONSTRAINT [FK_Hiring_Student] FOREIGN KEY([St_Id]) REFERENCES [dbo].[Student] ([St_Id]))


CREATE TABLE [dbo].[Training](
    [Train_ID] int IDENTITY(1,1) NOT NULL,
    [Train_Name] varchar(100),
    [Start_Date] date,
    [End_Date] date)


CREATE TABLE [dbo].[Projects](
    [Project_Id] int IDENTITY(1,1) NOT NULL,
    [Project_Name] varchar(100),
    [Start_Date] date,
    [End_Date] date)


CREATE TABLE [dbo].[Student_Project](
    [St_Pro_Id] int IDENTITY(1,1) NOT NULL,
    [St_Id] int,
    [Pro_Id] int,
    CONSTRAINT [FK_Student_Project_Project] FOREIGN KEY([Pro_Id]) REFERENCES [dbo].[Projects] ([Project_Id]),
    CONSTRAINT [FK_Student_Project_Student] FOREIGN KEY([St_Id]) REFERENCES [dbo].[Student] ([St_Id]))


CREATE TABLE [dbo].[Exam](
    [Exam_Id] int IDENTITY(1,1) NOT NULL,
    [Exam_Name] varchar](100),
    [Exam_Date] date,
    [Crs_Id] int,
	CONSTRAINT [FK_Exam_Course] FOREIGN KEY(Crs_Id]) REFERENCES [dbo].[Course] ([Crs_Id]))


CREATE TABLE [dbo].[Student_Exam](
    [St_Ex_Id] int IDENTITY(1,1) NOT NULL,
    [St_Id] int,
    [Ex_Id] int,
    CONSTRAINT [FK_Student_Exam_Student] FOREIGN KEY([St_Id]) REFERENCES [dbo].[Student] ([St_Id]),
    CONSTRAINT [FK_Student_Exam_Exam] FOREIGN KEY([Ex_Id]) REFERENCES [dbo].[Exam] ([Exam_Id]))


CREATE TABLE [dbo].[Exam_answers](
    [Answer_Id] int IDENTITY(1,1) NOT NULL,
    [Answer_Text] varchar(300),
    [Question_Id] int,
    [Score] int,
    [St_Id] int,
    CONSTRAINT [FK_Exam_answers_Exam_questions] FOREIGN KEY([Question_Id]) REFERENCES [dbo].[Exam_questions] ([Question_Id]),
    CONSTRAINT [FK_Exam_answers_Student] FOREIGN KEY([St_Id]) REFERENCES [dbo].[Student] ([St_Id]))


CREATE TABLE [dbo].[Exam_questions](
    [Question_Id] int IDENTITY(1,1) NOT NULL,
    [Question_Text] varchar(200),
    [Question_Type] varchar(50),
    [Correct_Answer_Id] int,
    [Category_Name] varchar(100),
    CONSTRAINT [FK_Exam_questions_Exam_answers] FOREIGN KEY([Correct_Answer_Id]) REFERENCES [dbo].[Exam_answers] ([Answer_Id]))


CREATE TABLE [dbo].[Ques_Exam](
    [Q_Ex_Id] int IDENTITY(1,1) NOT NULL,
    [Ex_Id] int,
    [Q_Id] int,
    CONSTRAINT [FK_Ques_Exam_Exam] FOREIGN KEY([Ex_Id]) REFERENCES [dbo].[Exam] ([Exam_Id]),
    CONSTRAINT [FK_Ques_Exam_Exam_questions] FOREIGN KEY([Q_Id]) REFERENCES [dbo].[Exam_questions] ([Question_Id]))



CREATE TABLE [dbo].[Question_options](
    [Option_Id] int IDENTITY(1,1) NOT NULL,
    [Option_Text] varchar(max),
    [IsCorrect] int,
    [Question_Id] int,
    [Category_Name] varchar(100),
    CONSTRAINT [FK_Question_options_Exam_questions] FOREIGN KEY([Question_Id]) REFERENCES [dbo].[Exam_questions] ([Question_Id]))
