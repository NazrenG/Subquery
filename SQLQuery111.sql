---------------------------------
--   Create TABLE&DATABASE     --
---------------------------------

create database Academy
use Academy
create table Curators
(
Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
CuratorsName nvarchar(max) NOT NULL DEFAULT 'NONE',
Surname nvarchar(max) NOT NULL DEFAULT 'NONE'
)

create table Faculties
(
Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
FacultyName nvarchar(100) NOT NULL DEFAULT 'NONE' UNIQUE
)

create table Subjects
(
Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
SubjectName nvarchar(100) NOT NULL DEFAULT 'NONE' UNIQUE
)

create table Teachers
(
Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Name] nvarchar(MAX) NOT NULL DEFAULT 'NONE' ,
Salary money NOT NULL CHECK(Salary>0),
Surname nvarchar(MAX) NOT NULL DEFAULT 'NONE',
IsProfessor bit NOT NULL DEFAULT 0
)

create table Departments
(
Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
Financing money NOT NULL CHECK(Financing>=0) DEFAULT 0,
DepartmentName nvarchar(100) NOT NULL DEFAULT 'NONE' UNIQUE,
FacultyId int NOT NULL FOREIGN KEY(FacultyId) REFERENCES Faculties(Id),
Building int NOT NULL CHECK(Building between 1 and 5)

)

create table Groups
(
Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
GroupName nvarchar(10) NOT NULL DEFAULT 'NONE' UNIQUE,
[Year] int NOT NULL CHECK([Year] between 1 and 5),
DepartmentId int NOT NULL FOREIGN KEY(DepartmentId) REFERENCES Departments(Id)
)

create table GroupsCurators
(
Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
CuratorId int NOT NULL FOREIGN KEY(CuratorId) REFERENCES Curators(Id),
GroupId  int NOT NULL FOREIGN KEY(GroupId) REFERENCES Groups(Id)
)



create table Lectures 
(
Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
DateOfLecture date NOT NULL CHECK(DateOfLecture<=GETDATE()),
SubjectId int NOT NULL FOREIGN KEY(SubjectId) REFERENCES Subjects(Id),
TeacherId int NOT NULL FOREIGN KEY(TeacherId) REFERENCES Teachers(Id),
)

create table GroupsLectures
(
Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
GroupId  int NOT NULL FOREIGN KEY(GroupId) REFERENCES Groups(Id),
LectureId int NOT NULL FOREIGN KEY(LectureId) REFERENCES Lectures(Id),

)

create table Students
(
Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Name] nvarchar(max) NOT NULL DEFAULT 'NONE',
Rating int NOT NULL CHECK(Rating between 0 and 5),
Surname nvarchar(max) NOT NULL DEFAULT 'NONE',

)

create table GroupsStudents
(
Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
GroupId  int NOT NULL FOREIGN KEY(GroupId) REFERENCES Groups(Id),
StudentId int NOT NULL FOREIGN KEY(StudentId) REFERENCES Students(Id),

)



------------------------------------
--          Fake DB               --
------------------------------------

insert into Curators (CuratorsName, Surname) values ('Yul', 'Skipperbottom');
insert into Curators (CuratorsName, Surname) values ('Stacey', 'Clissett');
insert into Curators (CuratorsName, Surname) values ('Doralia', 'McGinty');
insert into Curators (CuratorsName, Surname) values ('Fidole', 'Teggin');
insert into Curators (CuratorsName, Surname) values ('Sal', 'Shelborne');
insert into Curators (CuratorsName, Surname) values ('Janene', 'Fearne');
insert into Curators (CuratorsName, Surname) values ('Devy', 'Cod');
insert into Curators (CuratorsName, Surname) values ('Jannel', 'Swetman');
insert into Curators (CuratorsName, Surname) values ('Naomi', 'Caston');
insert into Curators (CuratorsName, Surname) values ('Ulberto', 'Tonry');
insert into Curators (CuratorsName, Surname) values ('Papageno', 'Mattheus');
insert into Curators (CuratorsName, Surname) values ('Ray', 'Ferreli');
insert into Curators (CuratorsName, Surname) values ('Kristina', 'MacPhaden');
insert into Curators (CuratorsName, Surname) values ('Almeria', 'Zapata');
insert into Curators (CuratorsName, Surname) values ('Stefan', 'Ockendon');
insert into Curators (CuratorsName, Surname) values ('Sharla', 'Droghan');
insert into Curators (CuratorsName, Surname) values ('Kaitlynn', 'Abeau');
insert into Curators (CuratorsName, Surname) values ('Ernesto', 'Pinchon');
insert into Curators (CuratorsName, Surname) values ('Vina', 'Embleton');
insert into Curators (CuratorsName, Surname) values ('Dirk', 'McKirdy');
insert into Curators (CuratorsName, Surname) values ('Trent', 'Verden');
insert into Curators (CuratorsName, Surname) values ('Davide', 'Firth');
insert into Curators (CuratorsName, Surname) values ('Katherina', 'Henzley');
insert into Curators (CuratorsName, Surname) values ('Tommy', 'Marians');
insert into Curators (CuratorsName, Surname) values ('Sid', 'Grist');
insert into Curators (CuratorsName, Surname) values ('Harlie', 'Marin');
insert into Curators (CuratorsName, Surname) values ('Kareem', 'Poleye');
insert into Curators (CuratorsName, Surname) values ('Weidar', 'Filtness');
insert into Curators (CuratorsName, Surname) values ('Antonio', 'Guslon');
insert into Curators (CuratorsName, Surname) values ('Paco', 'Mainwaring');


insert into Faculties ( FacultyName) values ( 'n/a');
insert into Faculties ( FacultyName) values ( 'Capital Goods');
insert into Faculties ( FacultyName) values ( 'Computer Science');
insert into Faculties ( FacultyName) values ( 'n/a');
insert into Faculties ( FacultyName) values ( 'n/a');
insert into Faculties ( FacultyName) values ( 'Public Utilities');
insert into Faculties ( FacultyName) values ( 'Health Care');
insert into Faculties ( FacultyName) values ('Capital Goods');
insert into Faculties ( FacultyName) values ( 'Capital Goods');
insert into Faculties ( FacultyName) values ( 'n/a');
insert into Faculties ( FacultyName) values ( 'n/a');
insert into Faculties ( FacultyName) values ('Finance');
insert into Faculties ( FacultyName) values ( 'Technology');
insert into Faculties ( FacultyName) values ( 'Finance');
insert into Faculties ( FacultyName) values ( 'n/a');
insert into Faculties ( FacultyName) values ( 'Capital Goods');
insert into Faculties ( FacultyName) values ( 'Consumer Services');
insert into Faculties ( FacultyName) values ( 'n/a');
insert into Faculties ( FacultyName) values ( 'n/a');
insert into Faculties ( FacultyName) values ( 'n/a');
insert into Faculties ( FacultyName) values ( 'Energy');
insert into Faculties ( FacultyName) values ( 'Energy');
insert into Faculties ( FacultyName) values ( 'n/a');
insert into Faculties ( FacultyName) values ( 'Finance');
insert into Faculties ( FacultyName) values ( 'Consumer Durables');
insert into Faculties ( FacultyName) values ( 'Finance');
insert into Faculties ( FacultyName) values ( 'Basic Industries');
insert into Faculties ( FacultyName) values ('Consumer Services');
insert into Faculties ( FacultyName) values ('Consumer Services');
insert into Faculties ( FacultyName) values ('Consumer Non-Durables');


insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$8593.59', 'Accounting-3', 3,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$3694.29', 'Support', 10,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$4070.60', 'Services', 14,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$9804.11', 'Business Development', 21,4);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$9634.37', 'Training', 28,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$7546.18', 'Sales', 21,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$1623.58', 'Sales', 17,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$6033.02', 'Marketing', 17,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$3163.54', 'Business Development', 5,4);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$6762.81', 'Services', 22,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$6851.91', 'Product Management', 14,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$8127.09', 'Business Development', 29,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$5857.91', 'Engineering', 1,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$5481.27', 'Research and Development', 20,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$4549.64', 'Product Management', 20,4);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$7490.08', 'Legal', 28,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$2063.16', 'Services', 7,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$9012.10', 'Marketing', 19,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$2665.21', 'Sales', 2,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$7378.24', 'Training', 17,4);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$8782.62', 'Management', 3,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$1382.89', 'Business Development', 18,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$5112.12', 'Services', 1,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$7735.68', 'Product Management', 13,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$8986.22', 'Accounting', 23,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$2144.22', 'Training', 16,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$1943.98', 'Services', 9,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$9378.70', 'Research and Development', 25,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$2309.11', 'Support', 28,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$6638.38', 'Research and Development', 6,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$9181.53', 'Marketing', 3,4);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$3952.74', 'Engineering', 3,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$9056.27', 'Legal', 11,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$7947.33', 'Training', 19,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$8936.99', 'Legal', 19,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$6091.08', 'Research and Development', 10,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$5002.50', 'Marketing', 24,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$1400.45', 'Business Development', 24,4);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$9575.59', 'Research and Development', 22,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$1721.24', 'Legal', 25,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$3890.87', 'Sales', 18,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$2758.92', 'Support', 13,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$1143.35', 'Business Development', 15,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$5527.94', 'Engineering', 3,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$1196.50', 'Services', 30,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$3745.12', 'Sales', 15,4);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$9888.39', 'Accounting', 11,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$2607.07', 'Product Management', 1,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$7209.26', 'Support', 22,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$1381.38', 'Product Management', 13,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$2560.01', 'Marketing', 21,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$3592.29', 'Engineering', 8,4);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$6817.40', 'Support', 18,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$8845.26', 'Support', 12,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$6512.16', 'Product Management', 2,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$7250.24', 'Business Development', 10,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$320.43', 'Training', 6,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$5853.98', 'Marketing', 11,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$2800.85', 'Business Development', 8,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$2592.44', 'Sales', 15,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$9083.81', 'Support', 4,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$8531.06', 'Training', 8,4);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$7106.35', 'Engineering', 23,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$8318.89', 'Business Development', 15,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$9078.73', 'Legal', 6,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$6955.15', 'Training', 27,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$8854.27', 'Product Management', 6,4);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$4924.53', 'Accounting', 27,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$7082.46', 'Marketing', 26,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$5266.47', 'Support', 9,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$4645.45', 'Research and Development', 3,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$8351.82', 'Business Development', 8,4);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$6541.54', 'Marketing', 28,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$3273.47', 'Research and Development', 22,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$6167.27', 'Support', 5,1);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$856.85', 'Legal', 21,2);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$4814.63', 'Training', 10,4);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$7778.59', 'Engineering', 28,5);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$800.24', 'Human Resources', 24,3);
insert into Departments (Financing, DepartmentName, FacultyId,Building) values ('$3907.86', 'Research and Development', 4,2);

insert into Groups (GroupName, Year, DepartmentId) values ('D221', 3, 6);
insert into Groups (GroupName, Year, DepartmentId) values ('B103', 5, 4);
insert into Groups (GroupName, Year, DepartmentId) values ('ESSK', 3, 13);
insert into Groups (GroupName, Year, DepartmentId) values ('OEKM', 2, 31);
insert into Groups (GroupName, Year, DepartmentId) values ('UHMM', 5, 7);
insert into Groups (GroupName, Year, DepartmentId) values ('YBMA', 3, 63);
insert into Groups (GroupName, Year, DepartmentId) values ('LKPO', 3, 9);
insert into Groups (GroupName, Year, DepartmentId) values ('FYHI', 4, 64);
insert into Groups (GroupName, Year, DepartmentId) values ('UCFL', 5, 50);
insert into Groups (GroupName, Year, DepartmentId) values ('DAUL', 2, 48);
insert into Groups (GroupName, Year, DepartmentId) values ('AYDU', 1, 60);
insert into Groups (GroupName, Year, DepartmentId) values ('KLHW', 4, 27);
insert into Groups (GroupName, Year, DepartmentId) values ('SLAS', 1, 64);
insert into Groups (GroupName, Year, DepartmentId) values ('LFLW', 5, 36);
insert into Groups (GroupName, Year, DepartmentId) values ('KCXP', 1, 48);
insert into Groups (GroupName, Year, DepartmentId) values ('ZBXZ', 3, 3);
insert into Groups (GroupName, Year, DepartmentId) values ('CZFN', 2, 56);
insert into Groups (GroupName, Year, DepartmentId) values ('AYIK', 4, 35);
insert into Groups (GroupName, Year, DepartmentId) values ('B103', 2, 67);
insert into Groups (GroupName, Year, DepartmentId) values ('KBDU', 2, 42);
insert into Groups (GroupName, Year, DepartmentId) values ('GQNA', 2, 4);
insert into Groups (GroupName, Year, DepartmentId) values ('B103', 1, 51);
insert into Groups (GroupName, Year, DepartmentId) values ('VVCI', 5, 47);
insert into Groups (GroupName, Year, DepartmentId) values ('KIWD', 4, 54);
insert into Groups (GroupName, Year, DepartmentId) values ('B103', 5, 57);
insert into Groups (GroupName, Year, DepartmentId) values ('OATN', 4, 23);
insert into Groups (GroupName, Year, DepartmentId) values ('FMSI', 3, 33);
insert into Groups (GroupName, Year, DepartmentId) values ('CYLJ', 4, 11);
insert into Groups (GroupName, Year, DepartmentId) values ('OIII', 5, 33);
insert into Groups (GroupName, Year, DepartmentId) values ('VI32', 4, 64);
insert into Groups (GroupName, Year, DepartmentId) values ('CSH4', 2, 31);
insert into Groups (GroupName, Year, DepartmentId) values ('LFQJ', 1, 48);
insert into Groups (GroupName, Year, DepartmentId) values ('NZWU', 4, 54);
insert into Groups (GroupName, Year, DepartmentId) values ('UGSB', 1, 14);
insert into Groups (GroupName, Year, DepartmentId) values ('YMDG', 1, 50);
insert into Groups (GroupName, Year, DepartmentId) values ('SYLP', 5, 7);
insert into Groups (GroupName, Year, DepartmentId) values ('ZSCG', 3, 20);
insert into Groups (GroupName, Year, DepartmentId) values ('05U', 2, 1);
insert into Groups (GroupName, Year, DepartmentId) values ('YLIN', 4, 27);
insert into Groups (GroupName, Year, DepartmentId) values ('SKOT', 5, 26);
insert into Groups (GroupName, Year, DepartmentId) values ('WAJA', 2, 24);
insert into Groups (GroupName, Year, DepartmentId) values ('KPOC', 2, 68);
insert into Groups (GroupName, Year, DepartmentId) values ('SNCP', 5, 5);
insert into Groups (GroupName, Year, DepartmentId) values ('ESOE', 3, 23);
insert into Groups (GroupName, Year, DepartmentId) values ('AYIA', 3, 68);
insert into Groups (GroupName, Year, DepartmentId) values ('UDYZ', 5, 2);
insert into Groups (GroupName, Year, DepartmentId) values ('LGAT', 4, 66);
insert into Groups (GroupName, Year, DepartmentId) values ('P107', 4, 4);
insert into Groups (GroupName, Year, DepartmentId) values ('SDFC', 5, 1);
insert into Groups (GroupName, Year, DepartmentId) values ('OICI', 2, 49);
insert into Groups (GroupName, Year, DepartmentId) values ('LFLN', 2, 12);
insert into Groups (GroupName, Year, DepartmentId) values ('KVPZ', 5, 10);
insert into Groups (GroupName, Year, DepartmentId) values ('AYKK', 5, 45);
insert into Groups (GroupName, Year, DepartmentId) values ('MMCP', 2, 3);
insert into Groups (GroupName, Year, DepartmentId) values ('FLKO', 5, 55);
insert into Groups (GroupName, Year, DepartmentId) values ('FEGZ', 3, 63);
insert into Groups (GroupName, Year, DepartmentId) values ('EKAH', 5, 24);
insert into Groups (GroupName, Year, DepartmentId) values ('KFUL', 3, 39);
insert into Groups (GroupName, Year, DepartmentId) values ('FCMM', 2, 62);
insert into Groups (GroupName, Year, DepartmentId) values ('SDGC', 1, 23);
insert into Groups (GroupName, Year, DepartmentId) values ('MMZH', 1, 49);
insert into Groups (GroupName, Year, DepartmentId) values ('RJFR', 4, 3);
insert into Groups (GroupName, Year, DepartmentId) values ('SWXQ', 3, 24);
insert into Groups (GroupName, Year, DepartmentId) values ('RPLI', 2, 55);
insert into Groups (GroupName, Year, DepartmentId) values ('YDRD', 3, 67);
insert into Groups (GroupName, Year, DepartmentId) values ('UAUR', 1, 37);
insert into Groups (GroupName, Year, DepartmentId) values ('D60', 4, 51);
insert into Groups (GroupName, Year, DepartmentId) values ('HTMA', 4, 6);
insert into Groups (GroupName, Year, DepartmentId) values ('AYTN', 4, 56);
insert into Groups (GroupName, Year, DepartmentId) values ('AYVO', 5, 63);
insert into Groups (GroupName, Year, DepartmentId) values ('KPDX', 1, 53);
insert into Groups (GroupName, Year, DepartmentId) values ('UERL', 1, 32);
insert into Groups (GroupName, Year, DepartmentId) values ('FMCN', 1, 42);
insert into Groups (GroupName, Year, DepartmentId) values ('FAAB', 1, 38);
insert into Groups (GroupName, Year, DepartmentId) values ('FEGM', 4, 30);
insert into Groups (GroupName, Year, DepartmentId) values ('FCBM', 4, 49);
insert into Groups (GroupName, Year, DepartmentId) values ('KLRF', 2, 63);
insert into Groups (GroupName, Year, DepartmentId) values ('MHPL', 3, 23);

insert into GroupsCurators (CuratorId, GroupId) values (13, 3);
insert into GroupsCurators (CuratorId, GroupId) values (30, 20);
insert into GroupsCurators (CuratorId, GroupId) values (16, 37);
insert into GroupsCurators (CuratorId, GroupId) values (5, 41);
insert into GroupsCurators (CuratorId, GroupId) values (1, 63);
insert into GroupsCurators (CuratorId, GroupId) values (24, 41);
insert into GroupsCurators (CuratorId, GroupId) values (7, 48);
insert into GroupsCurators (CuratorId, GroupId) values (2, 21);
insert into GroupsCurators (CuratorId, GroupId) values (19, 57);
insert into GroupsCurators (CuratorId, GroupId) values (18, 68);
insert into GroupsCurators (CuratorId, GroupId) values (5, 73);
insert into GroupsCurators (CuratorId, GroupId) values (12, 1);
insert into GroupsCurators (CuratorId, GroupId) values (2, 45);
insert into GroupsCurators (CuratorId, GroupId) values (29, 49);
insert into GroupsCurators (CuratorId, GroupId) values (23, 37);
insert into GroupsCurators (CuratorId, GroupId) values (15, 3);
insert into GroupsCurators (CuratorId, GroupId) values (27, 2);
insert into GroupsCurators (CuratorId, GroupId) values (22, 68);
insert into GroupsCurators (CuratorId, GroupId) values (25, 20);
insert into GroupsCurators (CuratorId, GroupId) values (30, 57);
insert into GroupsCurators (CuratorId, GroupId) values (19, 3);
insert into GroupsCurators (CuratorId, GroupId) values (4, 2);
insert into GroupsCurators (CuratorId, GroupId) values (8, 73);
insert into GroupsCurators (CuratorId, GroupId) values (8, 68);
insert into GroupsCurators (CuratorId, GroupId) values (16, 42);
insert into GroupsCurators (CuratorId, GroupId) values (24, 63);
insert into GroupsCurators (CuratorId, GroupId) values (22, 102);
insert into GroupsCurators (CuratorId, GroupId) values (14, 118);
insert into GroupsCurators (CuratorId, GroupId) values (4, 140);
insert into GroupsCurators (CuratorId, GroupId) values (30, 131);


insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Chick', '$2367.68', 'Herculeson',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Christine', '$1382.01', 'Corona',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Merry', '$8466.48', 'Taunton.',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Cherye', '$3840.43', 'McKirton',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Linell', '$6613.41', 'Labb',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Samantha', '$6613.41', 'Adams',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Alejoa', '$4509.23', 'Greensmith',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Benetta', '$4640.79', 'Belasco',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Colver', '$4286.67', 'Karolovsky',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Liana', '$109.34', 'Newey',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Sydelle', '$3688.63', 'Huggons',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Gar', '$9011.82', 'Inge',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Alaric', '$6863.48', 'Dishmon',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Wendie', '$6765.02', 'Ferminger',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Eolanda', '$3432.62', 'Sotheby',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Yank', '$6734.66', 'Tregent',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Lothario', '$184.40', 'Iglesia',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Orion', '$5608.12', 'Clymer',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Bram', '$1549.17', 'Fullerlove',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Garth', '$1962.21', 'Copeman',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Cosetta', '$2218.30', 'Shwenn',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Bambie', '$1596.17', 'Spykings',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Margy', '$5658.50', 'Zealy',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Codi', '$1689.28', 'Hugle',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Orelia', '$1345.99', 'Keuneke',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Nara', '$4414.44', 'Gulland',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Thibaud', '$9110.91', 'Jagielski',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Nolly', '$6620.94', 'Jaffray',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Kale', '$3456.05', 'Gloy',1);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Arron', '$3981.65', 'Newport',0);
insert into Teachers (Name, Salary, Surname,IsProfessor) values ('Jaquith', '$5857.72', 'MacGaughie',0);

insert into Subjects (SubjectName) values ('Assistant Manager');
insert into Subjects (SubjectName) values ('Speech Pathologist');
insert into Subjects (SubjectName) values ('Health Coach III');
insert into Subjects (SubjectName) values ('Librarian');
insert into Subjects (SubjectName) values ('Automation Specialist II');
insert into Subjects (SubjectName) values ('Programmer III');
insert into Subjects (SubjectName) values ('Biostatistician I');
insert into Subjects (SubjectName) values ('Biostatistician II');
insert into Subjects (SubjectName) values ('Nurse Practicioner');
insert into Subjects (SubjectName) values ('Sales Representative');
insert into Subjects (SubjectName) values ('Occupational Therapist');
insert into Subjects (SubjectName) values ('Desktop Support Technician');
insert into Subjects (SubjectName) values ('Computer Systems Analyst IV');
insert into Subjects (SubjectName) values ('Web Developer I');
insert into Subjects (SubjectName) values ('VP Quality Control');
insert into Subjects (SubjectName) values ('Accounting Assistant I');
insert into Subjects (SubjectName) values ('Graphic Designer');
insert into Subjects (SubjectName) values ('General Manager');
insert into Subjects (SubjectName) values ('Senior Cost Accountant');
insert into Subjects (SubjectName) values ('Nurse');
insert into Subjects (SubjectName) values ('Help Desk Technician');
insert into Subjects (SubjectName) values ('Human Resources Manager');
insert into Subjects (SubjectName) values ('Desktop Support Technician');
insert into Subjects (SubjectName) values ('Desktop Support Technician');
insert into Subjects (SubjectName) values ('Account Representative I');
insert into Subjects (SubjectName) values ('Developer IV');
insert into Subjects (SubjectName) values ('Automation Specialist IV');
insert into Subjects (SubjectName) values ('Biostatistician II');
insert into Subjects (SubjectName) values ('Engineer III');
insert into Subjects (SubjectName) values ('Senior Developer');

insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('2/1/2003',23, 20);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('12/27/2019', 21, 20);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('11/12/2014', 6, 14);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('9/14/2022', 28, 4);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('7/14/2017', 3, 10);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('5/10/2004', 20, 4);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('10/13/2017', 3, 12);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('10/31/2013', 8, 31);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('8/8/2023',28, 2);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('6/7/2013', 18, 10);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('5/9/2006', 29, 26);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('10/15/2002', 14, 23);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('8/31/2007',4, 13);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('3/27/2021',14, 16);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('1/14/2010',30, 31);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('3/19/2016', 10, 3);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('8/29/2006', 24, 2);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('9/29/2003', 6, 21);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('5/4/2013', 21, 21);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('9/2/2016', 10, 13);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('8/11/2002', 15, 26);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('12/25/2012', 28, 24);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('10/21/2012', 17, 13);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('1/11/2002', 19, 25);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('10/21/2007', 19, 4);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('10/21/2018', 17, 3);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('3/7/2016',26, 28);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('10/16/2023', 6, 29);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('1/5/2014', 1, 31);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('5/20/2004', 9, 25);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('12/27/2005', 5, 8);
insert into Lectures (DateOfLecture, SubjectId, TeacherId) values ('03-7-2002', 8, 4);


insert into GroupsLectures (LectureId, GroupId) values (3, 73);
insert into GroupsLectures (LectureId, GroupId) values (16, 63);
insert into GroupsLectures (LectureId, GroupId) values (6,  38);
insert into GroupsLectures (LectureId, GroupId) values (24, 21);
insert into GroupsLectures (LectureId, GroupId) values (21, 68);
insert into GroupsLectures (LectureId, GroupId) values (22,20);
insert into GroupsLectures (LectureId, GroupId) values (16, 41);
insert into GroupsLectures (LectureId, GroupId) values (21,73);
insert into GroupsLectures (LectureId, GroupId) values (8, 21);
insert into GroupsLectures (LectureId, GroupId) values (30,48);
insert into GroupsLectures (LectureId, GroupId) values (12,2);
insert into GroupsLectures (LectureId, GroupId) values (4,3);
insert into GroupsLectures (LectureId, GroupId) values (19,21);
insert into GroupsLectures (LectureId, GroupId) values (10, 41);
insert into GroupsLectures (LectureId, GroupId) values (24, 37);
insert into GroupsLectures (LectureId, GroupId) values (14,42);
insert into GroupsLectures (LectureId, GroupId) values (11, 45);
insert into GroupsLectures (LectureId, GroupId) values (1,37);
insert into GroupsLectures (LectureId, GroupId) values (13,57);
insert into GroupsLectures (LectureId, GroupId) values (14,49);
insert into GroupsLectures (LectureId, GroupId) values (27,2);
insert into GroupsLectures (LectureId, GroupId) values (3, 38);
insert into GroupsLectures (LectureId, GroupId) values (14,21);
insert into GroupsLectures (LectureId, GroupId) values (27,68);
insert into GroupsLectures (LectureId, GroupId) values (3, 73);
insert into GroupsLectures (LectureId, GroupId) values (3, 79);

insert into Students (Name, Rating, Surname) values ('Hazel', 1, 'Valentino');
insert into Students (Name, Rating, Surname) values ('Virginie', 5, 'Zannutti');
insert into Students (Name, Rating, Surname) values ('Torrance', 4, 'Kendred');
insert into Students (Name, Rating, Surname) values ('Dyanne', 5, 'Bassford');
insert into Students (Name, Rating, Surname) values ('Reine', 3, 'Ackenhead');
insert into Students (Name, Rating, Surname) values ('Vince', 4, 'Carillo');
insert into Students (Name, Rating, Surname) values ('Godiva', 3, 'Kingswell');
insert into Students (Name, Rating, Surname) values ('Andre', 4, 'Baff');
insert into Students (Name, Rating, Surname) values ('Jacintha', 1, 'Lissandri');
insert into Students (Name, Rating, Surname) values ('Darrel', 5, 'Eplate');
insert into Students (Name, Rating, Surname) values ('Marilee', 4, 'Sivyer');
insert into Students (Name, Rating, Surname) values ('Dallon', 4, 'Sparshett');
insert into Students (Name, Rating, Surname) values ('Margaretha', 4, 'Schultz');
insert into Students (Name, Rating, Surname) values ('Jedediah', 2, 'Tough');
insert into Students (Name, Rating, Surname) values ('Olwen', 5, 'Filinkov');
insert into Students (Name, Rating, Surname) values ('Grantley', 1, 'Iacovides');
insert into Students (Name, Rating, Surname) values ('Britni', 2, 'Oldacres');
insert into Students (Name, Rating, Surname) values ('Saidee', 2, 'Petrovic');
insert into Students (Name, Rating, Surname) values ('Vilma', 2, 'Lantiffe');
insert into Students (Name, Rating, Surname) values ('Roth', 2, 'Blacklock');
insert into Students (Name, Rating, Surname) values ('Pearce', 4, 'Petrussi');
insert into Students (Name, Rating, Surname) values ('Elane', 5, 'Koppen');
insert into Students (Name, Rating, Surname) values ('Alexis', 5, 'Lelliott');
insert into Students (Name, Rating, Surname) values ('Rolph', 1, 'Soares');
insert into Students (Name, Rating, Surname) values ('Allie', 2, 'Kirkland');
insert into Students (Name, Rating, Surname) values ('Opaline', 2, 'Allmann');
insert into Students (Name, Rating, Surname) values ('Kata', 1, 'Slowly');
insert into Students (Name, Rating, Surname) values ('Dusty', 3, 'Verrier');
insert into Students (Name, Rating, Surname) values ('Paddie', 4, 'Brinded');
insert into Students (Name, Rating, Surname) values ('Jakie', 5, 'Tissington');


insert into GroupsStudents (StudentId, GroupId) values (19, 3);
insert into GroupsStudents (StudentId, GroupId) values (58, 20);
insert into GroupsStudents (StudentId, GroupId) values (23, 37);
insert into GroupsStudents (StudentId, GroupId) values (59,41);
insert into GroupsStudents (StudentId, GroupId) values (50,63);
insert into GroupsStudents (StudentId, GroupId) values (24, 41);
insert into GroupsStudents (StudentId, GroupId) values (39,48);
insert into GroupsStudents (StudentId, GroupId) values (13,21);
insert into GroupsStudents (StudentId, GroupId) values (3, 57);
insert into GroupsStudents (StudentId, GroupId) values (5, 79);
insert into GroupsStudents (StudentId, GroupId) values (4, 68);
insert into GroupsStudents (StudentId, GroupId) values (53,73);
insert into GroupsStudents (StudentId, GroupId) values (15, 1);
insert into GroupsStudents (StudentId, GroupId) values (2,45);
insert into GroupsStudents (StudentId, GroupId) values (57, 49);
insert into GroupsStudents (StudentId, GroupId) values (1, 79);
insert into GroupsStudents (StudentId, GroupId) values (31, 37);
insert into GroupsStudents (StudentId, GroupId) values (24, 3);
insert into GroupsStudents (StudentId, GroupId) values (17, 2);
insert into GroupsStudents (StudentId, GroupId) values (48, 68);
insert into GroupsStudents (StudentId, GroupId) values (21, 20);
insert into GroupsStudents (StudentId, GroupId) values (10, 79);
insert into GroupsStudents (StudentId, GroupId) values (14, 57);
insert into GroupsStudents (StudentId, GroupId) values (17, 3);
insert into GroupsStudents (StudentId, GroupId) values (38,2);
insert into GroupsStudents (StudentId, GroupId) values (11, 79);
insert into GroupsStudents (StudentId, GroupId) values (39,73);
insert into GroupsStudents (StudentId, GroupId) values (25,68);
insert into GroupsStudents (StudentId, GroupId) values (17, 42);
insert into GroupsStudents (StudentId, GroupId) values (27, 63);
insert into GroupsStudents (StudentId, GroupId) values (3, 102);
insert into GroupsStudents (StudentId, GroupId) values (28, 118);
insert into GroupsStudents (StudentId, GroupId) values (31,140);
insert into GroupsStudents (StudentId, GroupId) values (12, 79);


--------------------------------------
--       Tasks                      --
--------------------------------------

--1
select Building from Departments
group by Building  
having Building in 
	(select Building from Departments 
	group by Building
	having sum(Financing)>10000)

--3
/*Butun telebelerin orta reytinqi,'D221' qrupunda olan telebelerin orta reytinqinden boyuk olan qruplarin adi*/

select GroupName from Groups
where Groups.Id in (
	select GroupId from GroupsStudents,Students,Groups
	where GroupsStudents.StudentId=Students.Id and
	GroupsStudents.GroupId=Groups.Id and
	Groups.GroupName='D221'  
	group by GroupId
	having avg(Rating)<(	
		select avg(Rating) from Students
		)
	)

--4
select * from Teachers
where IsProfessor=1 and Salary>(select AVG(Salary) from Teachers where IsProfessor=1)

--5
select GroupName from Groups
where Groups.Id in (select GroupId from GroupsCurators group by GroupId having count(GroupId)>1)

--6
/*Butun telebelerin orta reytinqi,5 illik qruplarin min reytinqinden asagi olan qruplarin adlari*/

select GroupName from Groups
where Id in (
	select GroupId from GroupsStudents,Students,Groups
	where GroupsStudents.StudentId=Students.Id and
	GroupsStudents.GroupId=Groups.Id and
	Groups.Year=5
	group by GroupId
	having min(Rating)>(	
		select avg(Rating) from Students
		)
	)

--7
/*Department table-daki total finans-i 'Computer Science' fakultesindeki total finans-dan cox olan fakultelerin adlari*/

select FacultyName from Faculties
where id in (
	select FacultyId from Departments
	group by FacultyId
	having sum(Financing)> (
		select sum(Financing) from Departments
		where FacultyId=(
			select Id from Faculties
			where FacultyName='Computer Science'
			) 
		)
	)

--8	
/*Uzun muddet ders deyen muellimlerin tam adini ve tedris etdiyi fennin adini ardicilliqla cixar*/

select 
    (select [Name] + ' ' + Surname from Teachers 
     where Teachers.Id = Lectures.TeacherId) as FullName,
    (select SubjectName from Subjects 
     where Subjects.Id = Lectures.SubjectId) as SubjectName
from Lectures 
order by DateOfLecture asc


--9
/* Mühazirələrin vaxti ən qisa olan fənnin adı.*/

select top 1 (
	select SubjectName from Subjects 
	where Id=Lectures.SubjectId) as SubjectName
from Lectures
order by DateOfLecture desc

--10
/*'Business Development' tədris olunan tələbələrin və fənlərin sayı*/
select 
    (select count(*) from Groups,GroupsStudents,Departments 
     where Groups.Id=GroupsStudents.GroupId and
	 Departments.Id=Groups.DepartmentId and
	 Departments.DepartmentName='Business Development') as StudentsCount,

    (select count(distinct(SubjectId)) from Subjects,GroupsLectures,Departments,Lectures,Groups
     where Subjects.Id = Lectures.SubjectId and 
	 GroupsLectures.GroupId=Groups.Id and
	 Departments.Id=Groups.DepartmentId and
	 Lectures.Id=GroupsLectures.LectureId and
	 Departments.DepartmentName='Business Development') as SubjectCount

