--report 1
CREATE PROCEDURE StudentInfo
    @DeptId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT S.St_Id, S.St_Fname, S.St_Lname, S.St_Address, S.St_Age, S.Email, S.Gender
    FROM Student S
    INNER JOIN Department D ON S.Dept_Id = D.Dept_Id
    WHERE D.Dept_Id = @DeptId;
END;

StudentInfo   @DeptId = 102
---------------------------------------------------------------------------------------------------------
--report 2
CREATE PROCEDURE GetStudentGrades
    @StudentID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        C.Crs_Name AS CourseName,
        SC.Grade
    FROM 
        Student_course SC
    INNER JOIN 
        Course C ON SC.Crs_Id = C.Crs_Id
    WHERE 
        SC.St_Id = @StudentID;
END;

EXEC GetStudentGrades @StudentID = 106;
------------------------------------------------------------------------------------------------------------
--report 3
CREATE PROCEDURE GetrCoursesAndStudentsNum
    @InstructorID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        C.Crs_Name AS CourseName,
        COUNT(SC.St_Id) AS NumberOfStudents
    FROM 
        Instructor_course IC
    INNER JOIN 
        Course C ON IC.Crs_Id = C.Crs_Id
    LEFT JOIN 
        Student_course SC ON IC.Crs_Id = SC.Crs_Id
    WHERE 
        IC.Ins_Id = @InstructorID
    GROUP BY 
        C.Crs_Name;
END;

GetrCoursesAndStudentsNum  @InstructorID=21
-----------------------------------------------------------------------------------------------------------
--report 4
CREATE PROCEDURE GetCourseTopics
    @CourseID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        T.Top_Name AS TopicName
    FROM 
        Course C
    INNER JOIN 
        Topic T ON C.Top_Id = T.Top_Id
    WHERE 
        C.Crs_Id = @CourseID;
END;

EXEC GetCourseTopics @CourseID = 82;

-----------------------------------------------------------------------------------------------------------
--report 5
create PROCEDURE GetExamQuestionsAndChoices
    @ExamNumber INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        
        EQ.Question_Text,
        QO.Option_Text,
        QO.IsCorrect
    FROM 
        Exam E
    INNER JOIN 
        Ques_Exam QE ON E.Exam_Id = QE.Ex_Id
    INNER JOIN 
        Exam_questions EQ ON QE.Q_Id = EQ.Question_Id
    LEFT JOIN 
        Question_options QO ON EQ.Question_Id = QO.Question_Id
    WHERE 
        E.Exam_Id = @ExamNumber;
END;

EXEC GetExamQuestionsAndChoices @ExamNumber =318;

  --Report 6
  CREATE PROCEDURE GetExamQuestionsAndAnswers
    @ExamId INT,
    @StudentId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT EQ.Question_Text,
           EA.Answer_Text AS Student_Answer,
           EA.Score
    FROM Exam E
    INNER JOIN Ques_Exam QE ON E.Exam_Id = QE.Ex_Id
    INNER JOIN Exam_questions EQ ON QE.Q_Id = EQ.Question_Id
    LEFT JOIN Exam_answers EA ON EQ.Question_Id = EA.Question_Id
    LEFT JOIN Student S ON EA.St_Id = S.St_Id
    LEFT JOIN St_Exam SE ON E.Exam_Id = SE.Ex_Id AND S.St_Id = SE.St_Id
    WHERE E.Exam_Id = @ExamId
      AND S.St_Id = @StudentId;
END;

EXEC GetExamQuestionsAndAnswers @ExamId = 373, @StudentId = 106;

----------------------------------------------------------------------

ALTER PROCEDURE GetExamQuestionsAndChoices
    @ExamNumber INT
AS
BEGIN
    SET NOCOUNT ON;

    WITH CTE AS (
        SELECT 
            CASE 
                WHEN ROW_NUMBER() OVER (PARTITION BY EQ.Question_Text ORDER BY (SELECT NULL)) = 1 THEN EQ.Question_Text
                ELSE ''
            END AS Question_Text,
            QO.Option_Text,
            QO.IsCorrect
        FROM 
            Exam E
        INNER JOIN 
            Ques_Exam QE ON E.Exam_Id = QE.Ex_Id
        INNER JOIN 
            Exam_questions EQ ON QE.Q_Id = EQ.Question_Id
        LEFT JOIN 
            Question_options QO ON EQ.Question_Id = QO.Question_Id
        WHERE 
            E.Exam_Id = @ExamNumber
    )
    SELECT 
        Question_Text,
        Option_Text,
        IsCorrect
    FROM CTE;
END;