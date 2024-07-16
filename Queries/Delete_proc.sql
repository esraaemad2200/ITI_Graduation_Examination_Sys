#certificate

CREATE PROCEDURE DeleteCertificate
    @CertificateId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Student_Certificates table
    DELETE FROM dbo.Student_Certificates WHERE Cert_Id = @CertificateId;

    -- Delete records from Certificates table
    DELETE FROM dbo.Certificates WHERE Cert_Id = @CertificateId;
END

----calling

EXEC DeleteCertificate @CertificateId = 48;

------------------------------------------------------
#company

-- Create a stored procedure to delete records related to a company
CREATE PROCEDURE DeleteCompany
    @CompanyId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Hiring table
    DELETE FROM dbo.Hiring WHERE Company_Id = @CompanyId;

    -- Delete records from Companies table
    DELETE FROM dbo.Companies WHERE Company_Id = @CompanyId;
END

----calling

EXEC DeleteCompany @CompanyId = 22;

---------------------------------------------------------------
#course

-- Create a stored procedure to delete records related to a course
CREATE PROCEDURE DeleteCourse
    @CourseId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Instructor_course table
    DELETE FROM dbo.Instructor_course WHERE Crs_Id = @CourseId;

    -- Delete records from Student_course table
    DELETE FROM dbo.Student_course WHERE Crs_Id = @CourseId;

    -- Delete records from Exam table
    DELETE FROM dbo.Exam WHERE Crs_Id = @CourseId;

    -- Delete records from Course table
    DELETE FROM dbo.Course WHERE Crs_Id = @CourseId;
END

----calling

EXEC DeleteCourse @CourseId = 103;

---------------------------------------------------------------
#department

-- Create a stored procedure to delete records related to a department
CREATE PROCEDURE DeleteDepartment
    @DepartmentId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Instructor table
    DELETE FROM dbo.Instructor WHERE Dept_Id = @DepartmentId;

    -- Delete records from Student table
    DELETE FROM dbo.Student WHERE Dept_Id = @DepartmentId;

    -- Delete records from Department table
    DELETE FROM dbo.Department WHERE Dept_Id = @DepartmentId;
END

----calling

EXEC DeleteDepartment @DepartmentId = 122;

------------------------------------------------------------
#exam

-- Create a stored procedure to delete records related to an exam
CREATE PROCEDURE DeleteExam
    @ExamId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Ques_Exam table
    DELETE FROM dbo.Ques_Exam WHERE Ex_Id = @ExamId;

    -- Delete records from Exam table
    DELETE FROM dbo.Exam WHERE Exam_Id = @ExamId;
END

----calling

EXEC DeleteExam @ExamId = 318;

---------------------------------------------------------

#exam_questions

-- Create a stored procedure to delete records related to exam questions
CREATE PROCEDURE DeleteExamQuestions
    @QuestionId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Question_options table
    DELETE FROM dbo.Question_options WHERE Question_Id = @QuestionId;

    -- Delete records from Ques_Exam table
    DELETE FROM dbo.Ques_Exam WHERE Q_Id = @QuestionId;

    -- Delete records from Exam_questions table
    DELETE FROM dbo.Exam_questions WHERE Question_Id = @QuestionId;
END

----calling

EXEC DeleteExamQuestions @QuestionId = 140;

-----------------------------------------------------------------------
#freelancing

-- Create a stored procedure to delete records related to freelancing
CREATE PROCEDURE DeleteFreelancing
    @FreelanceId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Freelancing table
    DELETE FROM dbo.Freelancing WHERE Freelance_Id = @FreelanceId;
END

----calling

EXEC DeleteFreelancing @FreelanceId = 5181;

-----------------------------------------------------------------
#instructor

-- Create a stored procedure to delete records related to an instructor
CREATE PROCEDURE DeleteInstructor
    @InstructorId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Instructor_course table
    DELETE FROM dbo.Instructor_course WHERE Ins_Id = @InstructorId;

    -- Delete records from Instructor table
    DELETE FROM dbo.Instructor WHERE Ins_Id = @InstructorId;
END

----calling

EXEC DeleteInstructor @InstructorId = 21;

------------------------------------------------------------------
#positions

-- Create a stored procedure to delete records related to a position
CREATE PROCEDURE DeletePosition
    @PositionId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Hiring table
    DELETE FROM dbo.Hiring WHERE Position_Id = @PositionId;

    -- Delete records from Instructor_course table
    DELETE FROM dbo.Instructor_course WHERE Evaluation = 'Position' AND Crs_Id = @PositionId;

    -- Delete records from Positions table
    DELETE FROM dbo.Positions WHERE Position_Id = @PositionId;
END

----calling

EXEC DeletePosition @PositionId = 48;

-----------------------------------------------------------
#projects

-- Create a stored procedure to delete records related to a project
CREATE PROCEDURE DeleteProject
    @ProjectId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Student_Project table
    DELETE FROM dbo.Student_Project WHERE Pro_Id = @ProjectId;

    -- Delete records from Projects table
    DELETE FROM dbo.Projects WHERE Project_Id = @ProjectId;
END

----calling

EXEC DeleteProject @ProjectId = 11;

------------------------------------------------------------------
#question_options

-- Create a stored procedure to delete records related to a question and its options
CREATE PROCEDURE DeleteQuestionAndOptions
    @QuestionId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Question_options table
    DELETE FROM dbo.Question_options WHERE Question_Id = @QuestionId;

    -- Delete records from Ques_Exam table
    DELETE FROM dbo.Ques_Exam WHERE Q_Id = @QuestionId;

    -- Delete records from Exam_answers table
    DELETE FROM dbo.Exam_answers WHERE Question_Id = @QuestionId;

    -- Delete records from Exam_questions table
    DELETE FROM dbo.Exam_questions WHERE Question_Id = @QuestionId;
END

----calling

EXEC DeleteQuestionAndOptions @QuestionId = 4113;

-----------------------------------------------------------------------
#skills

-- Create a stored procedure to delete records related to a skill
CREATE PROCEDURE DeleteSkill
    @SkillId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Student_skills table
    DELETE FROM dbo.Student_skills WHERE Sk_Id = @SkillId;

    -- Delete records from Instructor_course table
    DELETE FROM dbo.Instructor_course WHERE Evaluation = 'Skill' AND Crs_Id = @SkillId;

    -- Delete records from Skills table
    DELETE FROM dbo.Skills WHERE Skill_Id = @SkillId;
END

----calling

EXEC DeleteSkill @SkillId = 11;

------------------------------------------------------------
#topic

-- Create a stored procedure to delete records related to a topic
CREATE PROCEDURE DeleteTopic
    @TopicId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Course table
    DELETE FROM dbo.Course WHERE Top_Id = @TopicId;

    -- Delete records from Topic table
    DELETE FROM dbo.Topic WHERE Top_Id = @TopicId;
END

----calling

EXEC DeleteTopic @TopicId = 16;

---------------------------------------------------------
#training

-- Create a stored procedure to delete records related to a training
CREATE PROCEDURE DeleteTraining
    @TrainingId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from Companies table
    DELETE FROM dbo.Companies WHERE Training_ID = @TrainingId;

    -- Delete records from Training table
    DELETE FROM dbo.Training WHERE Train_ID = @TrainingId;
END

----calling

EXEC DeleteTraining @TrainingId = 31;

--------------------------------------------------------------------
#student

-- Create a stored procedure to delete records related to a student
alter PROCEDURE DeleteStudent
    @StudentId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Remove self-references
    UPDATE dbo.Student
    SET St_super = NULL
    WHERE St_super = @StudentId;

    -- Delete records from St_Exam table
    DELETE FROM dbo.St_Exam WHERE St_Id = @StudentId;

    -- Delete records from Student_course table
    DELETE FROM dbo.Student_course WHERE St_Id = @StudentId;

    -- Delete records from Hiring table
    DELETE FROM dbo.Hiring WHERE St_Id = @StudentId;

    -- Delete records from Freelancing table
    DELETE FROM dbo.Freelancing WHERE St_Id = @StudentId;

    -- Delete records from Student_Project table
    DELETE FROM dbo.Student_Project WHERE St_Id = @StudentId;

    -- Delete records from Student_skills table
    DELETE FROM dbo.Student_skills WHERE St_Id = @StudentId;

    -- Delete records from Student_Certificates table
    DELETE FROM dbo.Student_Certificates WHERE St_Id = @StudentId;

    -- Delete records from Student table
    DELETE FROM dbo.Student WHERE St_Id = @StudentId;
END

----calling

EXEC DeleteStudent @StudentId = 116;

-----------------------------------------------------------------------------