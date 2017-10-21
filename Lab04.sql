# 1. Find the names of all juniors (Level = JR) who are enrolled in a class taught by ‘Ivana Teach’.
SELECT s.sname
FROM student s
WHERE s.snum IN
	(SELECT e.snum
	FROM class c, enrolled e, faculty f
	WHERE e.cname = c.cname AND c.fid = f.fid
	AND f.fname ='Ivana Teach' AND s.level='JR');
    
# 2. Find the names of faculty members that has taught classes only in room R128.
SELECT f.fname FROM faculty f WHERE f.fid IN
	(SELECT c.fid FROM class c WHERE c.room='R128');

# 3. Find the names of classes taught by ‘Richard Jackson’ and their times when a class meet there.
SELECT c.cname, c.meets_at FROM class c WHERE c.fid IN
	(SELECT f.fid FROM faculty f WHERE f.fname='Richard Jackson');
    
# 4. Find the names of students majoring in ‘Computer Science’.
SELECT sname FROM student WHERE major='Computer Science';

# 5. Find the names of classes taught by ‘John Williams’ in dept # 68.
SELECT c.cname FROM class c WHERE c.fid IN
	(SELECT f.fid FROM faculty f WHERE f.deptid=68 AND f.fname='John Williams');
    
# 6. For each class taught by ‘John Williams’, retrieve the name and age for students.
SELECT s.sname, s.age FROM student s WHERE s.snum IN
	(SELECT e.snum FROM enrolled e WHERE e.cname IN
		(SELECT c.cname FROM class c WHERE c.fid IN
			(SELECT f.fid FROM faculty f WHERE f.fname='John Williams')));
            
# 7. Find the names of students in ‘Computer Science’ major in descending age-wise.
SELECT sname FROM student WHERE major='Computer Science' ORDER BY age desc;

# 8. Find distinct student ages in ‘Database Systems’ class in descending order.
SELECT DISTINCT s.age FROM student s WHERE s.snum IN
	(SELECT e.snum FROM enrolled e WHERE e.cname='Database Systems') ORDER BY s.age DESC;

# 9. List the name of ‘Christopher Garcia’s teachers
SELECT DISTINCT f.fname FROM faculty f WHERE f.fid IN
	(SELECT c.fid FROM class c WHERE c.cname IN 
		(SELECT e.cname FROM enrolled e WHERE e.snum IN
			(SELECT s.snum FROM student s WHERE s.sname='Christopher Garcia')));
            
# 10. Retrieve the snum and sname of students who have taken classes from both ‘Ivana Teach’ and ‘Linda Davis’. (Both with simple and nested queries)
SELECT s.snum, s.sname FROM student s WHERE s.snum IN
	(SELECT e.snum FROM enrolled e WHERE e.cname IN
		(SELECT c.cname FROM class c WHERE c.fid IN 
			(SELECT f.fid FROM faculty f WHERE (f.fname='Ivana Teach' OR f.fname='Linda Davis'))));
            
# 11. SIMPLE

SELECT DISTINCT s.sname, s.snum FROM student s, enrolled e, class c, faculty f WHERE s.snum = e.snum AND E.cname = C.cname AND C.fid = F.fid AND (f.fname = 'Ivana Teach' OR f.fname = 'Linda Davis');