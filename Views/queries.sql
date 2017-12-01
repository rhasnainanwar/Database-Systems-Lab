# 1a. Retrieve age of the oldest student whose major is “Compter Science”.
SELECT MAX(age) FROM CSstudents;

# 1b. Find the name and age of the oldest student whose major = “Computer Science”
SELECT sname, age FROM CSstudents WHERE age IN
	(SELECT MAX(age) FROM CSstudents);

# 1c. Find the names, majors and ages of all juniors (Level = JR) who are enrolled in a class taught by Ivana Teach in “Computer Science” major.
SELECT DISTINCT(sname), major, age FROM CSstudents S
	JOIN enrolled E ON S.snum = E.snum 
	JOIN class C ON C.cname = E.cname
	JOIN faculty F ON F.fid = F.fid AND fname = 'Ivana Teach'
WHERE level = 'JR';

# 1d. Find the names of faculty members and their departments, classes and room number which they teaching in “Computer Science” major.
SELECT DISTINCT(F.fname), F.deptid, C.cname, C.room FROM Faculty F
	JOIN class C ON C.fid = F.fid
	JOIN enrolled E ON E.cname = C.cname
	JOIN CSstudents S ON S.snum = E.snum;
    
# 2a. Find the names of classes and their rooms where elder students are studying.
SELECT DISTINCT(C.cname), C.room FROM class C
	JOIN enrolled E ON C.cname = E.cname
	JOIN ElderStudents S ON E.snum = S.snum;
    
# 2b. Find name of major and age of student who includes the eldest student.
SELECT major, age FROM ElderStudents;
# OR
SELECT major, age FROM ElderStudents ORDER BY age DESC LIMIT 1;

# 4. Find the names of all students who are enrolled in two classes that meet at the same time.
SELECT sname FROM student s WHERE s.snum IN
	(SELECT e.snum FROM enrolled e WHERE e.cname IN 
		(SELECT c.cname FROM class c WHERE c.meets_at IN 
			(SELECT c1.meets_at FROM class c1 WHERE c1.cname <> c.cname AND c1.meets_at = c.meets_at)
		)
	);
        
    
# 5. Redefine the above query with “EnrolledStudents”.
SELECT sname FROM EnrolledStudents s WHERE s.snum IN
	(SELECT e.snum FROM enrolled e WHERE e.cname IN 
		(SELECT c.cname FROM class c WHERE c.meets_at IN 
			(SELECT c1.meets_at FROM class c1 WHERE c1.cname <> c.cname AND c1.meets_at = c.meets_at)
		)
	);