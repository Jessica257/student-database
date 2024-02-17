-- Creating Student Database
CREATE DATABASE StudentDB;

USE StudentDB; 

CREATE TABLE Students (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Attendance INT DEFAULT 0 CHECK (Attendance >= 0 AND Attendance <= 100)
);

-- Courses Table
CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(50)
);

-- Grades Table
CREATE TABLE Grades (
StudentID INT,
CourseID INT,
Grade INT CHECK (Grade >= 0 AND Grade <= 100),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
PRIMARY KEY (StudentID,CourseID)
);

-- Sample Students
INSERT INTO Students VALUE (1,'Jessica','Palmer',80);
INSERT INTO Students VALUE (2,'Kiehana','Clarke',100);
INSERT INTO Students VALUE (3,'Ashley', 'Wallace',75);
INSERT INTO Students VALUE (4,'Sarah','Hilton',100);
INSERT INTO Students VALUE (5,'Ian','Beale',62);
INSERT INTO Students VALUE (6,'Sage','Cross',97);
INSERT INTO Students VALUE (7,'Nicole','Findley',87);
INSERT INTO Students VALUE (8,'Sandra','Bates',92);
INSERT INTO Students VALUE (9,'Peter','Smith',50);
INSERT INTO Students VALUE (10,'Patrick','Trueman',42);

-- Sample Courses
INSERT INTO Courses VALUE (101,'Computer Science');
INSERT INTO Courses VALUE (102,'Law');
INSERT INTO Courses VALUE (103,'Biochemistry');
INSERT INTO Courses VALUE (104,'Psychology');
INSERT INTO Courses VALUE (105,'Economics');
INSERT INTO Courses VALUE (106,'Sociology');
INSERT INTO Courses VALUE (107,'Physics');

-- Sample Grades
INSERT INTO Grades VALUES (1, 101, 70);
INSERT INTO Grades VALUES (2, 102, 45);
INSERT INTO Grades VALUES (3, 106, 50);
INSERT INTO Grades VALUES (4, 104, 30);
INSERT INTO Grades VALUES (5, 107, 25);
INSERT INTO Grades VALUES (6, 101, 100);
INSERT INTO Grades VALUES (7, 103, 85);
INSERT INTO Grades VALUES (8, 103, 80);
INSERT INTO Grades VALUES (9, 105, 55);
INSERT INTO Grades VALUES (10, 105, 100);

-- Update a student grade
UPDATE Grades SET Grade = 90 WHERE StudentID = 1 AND CourseID = 101; -- Jessica Palmer's grade for Math updated to 90

-- Calculate Average Grades for Each Student
SELECT Students.StudentID,Students.FirstName,Students.LastName,ROUND(AVG(Grade), 2) AS AverageGrade
FROM Students
JOIN Grades ON Students.StudentID = Grades.StudentID
GROUP BY StudentID, FirstName, LastName;

-- Calculate Attendance Percentage for Each Student
SELECT Students.StudentID,Students.FirstName,Students.LastName,Attendance AS TotalAttendance,ROUND(AVG(Attendance), 2) AS AverageAttendance
FROM Students
GROUP BY StudentID, FirstName, LastName;

