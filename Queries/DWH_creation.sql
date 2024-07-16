CREATE TABLE [dbo].[Dim_Exam](
    [exam_id_sk] int IDENTITY(1,1) NOT NULL,
    [exam_id_bk] int,
    [exam_name] varchar(100),
    [exam_date] date,
    [question_id_bk] int,
    [question_text] varchar(200),
    [question_type] varchar(50),
    [correct_answer_id] int,
    [answer_id_bk] int,
    [answer_text] varchar(300),
    [score] int,
    [option_id_bk] int,
    [option_text] varchar(300),
    [is_correct] int,
    [start_date] datetime,
    [end_date] datetime,
    [is_current] tinyint,
    CONSTRAINT [FK_Dim_Exam_Fact_table] FOREIGN KEY([exam_id_sk]) REFERENCES [dbo].[Fact_table] ([exam_id_fk]))


CREATE TABLE [dbo].[Dim_Hiring](
    [hiring_id_sk] int IDENTITY(1,1) NOT NULL,
    [hiring_id_bk] int,
    [hire_date] date,
    [contract_length] int,
    [company_id_bk] int,
    [company_name] varchar(100),
    [location] varchar(100),
    [training_id_bk] int,
    [training_name] varchar(100),
    [training_startdate] date,
    [training_enddate] date,
    [position_id_bk] int,
    [position_name] varchar(100),
    [salary] int,
    [start_date] datetime,
    [end_date] datetime,
    [is_current] tinyint,
    CONSTRAINT [FK_Dim_Hiring_Fact_table] FOREIGN KEY ([hiring_id_sk]) REFERENCES [dbo].[Fact_table] ([hiring_id_fk]))

CREATE TABLE [dbo].[Dim_Student](
    [st_id_sk] int IDENTITY(1,1) NOT NULL,
    [st_id_bk] int,
    [st_fname] varchar(100),
    [st_lname] varchar(100),
    [st_address] varchar(100),
    [st_age] int NULL,
    [email] varchar(100),
    [st_super_bk] int,
    [gender] varchar(50),
    [dept_id_bk] int,
    [dept_name] varchar(100),
    [dept_location] varchar(100),
    [dept_mgr] int,
    [mgr_hiredate] date,
    [cert_id_bk] int,
    [cert_name] varchar(100),
    [issuer] varchar(100),
    [issue_date] date,
    [freelancing_id_bk] int,
    [freelancing_name] varchar(100),
    [skill_id] int,
    [skill_name] varchar(100),
    [project_id] int,
    [project_name] varchar(100),
    [pro_startdate] date,
    [pro_enddate] date,
    [start_date] datetime,
    [end_date] datetime,
    [is_current] tinyint,
    CONSTRAINT [FK_Dim_Student_Fact_table] FOREIGN KEY ([st_id_sk]) REFERENCES [dbo].[Fact_table] ([student_id_fk]))


CREATE TABLE [dbo].[DimDate](
    [DateSK] int NOT NULL,
    [Date] date NOT NULL,
    [Day] char(2) NOT NULL,
    [DaySuffix] varchar(4) NOT NULL,
    [DayOfWeek] varchar(9) NOT NULL,
    [DOWInMonth] tinyint NOT NULL,
    [DayOfYear] int NOT NULL,
    [WeekOfYear] tinyint NOT NULL,
    [WeekOfMonth] tinyint NOT NULL,
    [Month] char(2) NOT NULL,
    [MonthName] varchar(9) NOT NULL,
    [Quarter] tinyint NOT NULL,
    [QuarterName] varchar(6) NOT NULL,
    [Year] char(4) NOT NULL,
    [StandardDate] varchar(10) NULL,
    [HolidayText] varchar(50) NULL,
    CONSTRAINT [FK_DimDate_Fact_table] FOREIGN KEY ([DateSK]) REFERENCES [dbo].[Fact_table] ([date_id_fk]))


CREATE TABLE [dbo].[Fact_table](
    [fact_id_sk] int IDENTITY(1,1) NOT NULL,
    [hiring_id_fk] int,
    [exam_id_fk] int,
    [student_id_fk] int,
    [date_id_fk] int,
    [crs_id_bk] int,
    [crs_name] varchar(100),
    [crs_duration] int,
    [topic_id_bk] int,
    [topic_name] varchar(100),
    [ins_id_bk] int,
    [ins_name] varchar(100),
    [salary] int,
    [grade] int,
    [created_at] datetime,
    CONSTRAINT [FK_Fact_table_Dim_Exam] FOREIGN KEY ([exam_id_fk]) REFERENCES [dbo].[Dim_Exam] ([exam_id_sk]),
    CONSTRAINT [FK_Fact_table_Dim_Hiring] FOREIGN KEY ([hiring_id_fk]) REFERENCES [dbo].[Dim_Hiring] ([hiring_id_sk]),
    CONSTRAINT [FK_Fact_table_Dim_Student] FOREIGN KEY ([student_id_fk]) REFERENCES [dbo].[Dim_Student] ([st_id_sk]),
    CONSTRAINT [FK_Fact_table_DimDate] FOREIGN KEY ([date_id_fk]) REFERENCES [dbo].[DimDate] ([DateSK]))

