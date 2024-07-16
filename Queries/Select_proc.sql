--Certificate  procedure 
create proc GetCertificateData as
select * from Certificates

GetCertificateData
--companies procedure 
create proc GetCompaniesData as
select * from Companies

GetCompaniesData
--course procedure
create proc GetcourseData as
select * from Course

GetcourseData

--department proc
create proc GetDepartmentData as
select * from Department

--exam  proc
create proc GetExamData as
select * from Exam

create proc GetExamAswersData as
select * from Exam_answers

create proc GetExamQuestionData as
select * from Exam_questions

create proc GetFreelacingData as
select * from Freelancing


create proc GetExamHringData as
select * from Hiring

create proc GetInstructorData as
select * from Instructor

create proc GetInstructorCourseData as
select * from Instructor_course

create proc GetPositionData as
select * from Positions

create proc GetProjectsData  as
select * from Projects

create proc GetQues_ExamData  as
select * from Ques_Exam


create proc GetQuestion_optionsData  as
select * from Question_options

create proc GetSkillsData  as
select * from Skills


create proc GetStExamData  as
select * from St_Exam


create proc GetStudentData  as
select * from Student

create proc GetStudentCertificatesData  as
select * from Student_Certificates

create proc GetStudentCourseData  as
select * from Student_course


create proc GetStudenProjectstData  as
select * from Student_Project

create proc GetStudentSkillsData  as
select * from Student_skills

create proc GetTopicData  as
select * from Topic

create proc GettraningData  as
select * from Training


