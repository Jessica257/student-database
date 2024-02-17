Student Database

This project is aimed at creating and managing a student database. It includes SQL scripts to create tables for students, courses, and grades, as well as sample data to populate these tables. Additionally, it includes queries to calculate average grades and attendance for each student.

Database Schema
Students Table
StudentID: Primary key, unique identifier for each student
FirstName: First name of the student
LastName: Last name of the student
Attendance: Percentage attendance for each student, default 0 and must be between 0 and 100
Courses Table
CourseID: Primary key, unique identifier for each course
CourseName: Name of the course
Grades Table
StudentID: Foreign key referencing the Students table
CourseID: Foreign key referencing the Courses table
Grade: Grade for each student in each course, must be between 0 and 100
Sample Data
Sample data is provided for students, courses, and grades to demonstrate the functionality of the database.

Queries
Calculate Average Grades for Each Student

This query calculates the average grade for each student by joining the Students and Grades tables and grouping the results by student.
SELECT Students.StudentID, Students.FirstName, Students.LastName, ROUND(AVG(Grade), 2) AS AverageGrade
FROM Students
JOIN Grades ON Students.StudentID = Grades.StudentID
GROUP BY StudentID, FirstName, LastName;
Calculate Attendance Percentage for Each Student


This query calculates the average attendance percentage for each student by grouping the results by student.
SELECT Students.StudentID, Students.FirstName, Students.LastName, Attendance AS TotalAttendance, ROUND(AVG(Attendance), 2) AS AverageAttendance
FROM Students
GROUP BY StudentID, FirstName, LastName;

Instructions
To use this project:

Run the provided SQL scripts to create the database tables and populate them with sample data.
Execute the provided SQL queries to calculate average grades and attendance for each student.
Customize the database schema, add more sample data, or modify the queries as needed for your specific requirements.
Feel free to modify this README file further to include additional instructions, project overview, or any other relevant information.




