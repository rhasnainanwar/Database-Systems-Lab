# Create a view named “CSstudents” that retrieve all students whose major is “Computer Science”
CREATE VIEW CSstudents AS
	SELECT * FROM student WHERE major = 'Computer Science';
    
# Define a view “ElderStudents” that retrieve oldest students in each major.
CREATE VIEW ElderStudents AS
	# SELECT * FROM student GROUP BY major HAVING MAX(age); RETURNED WRONG VALUES
	SELECT * FROM student s WHERE age IN
		(SELECT MAX(age) FROM student s1 where s1.major = s.major)
	GROUP BY major;

# Define a view “EnrolledStudents” that retrieve students who are enrolled for a class.
CREATE VIEW EnrolledStudents AS
	SELECT * FROM student WHERE snum IN
		(SELECT e.snum FROM enrolled E);