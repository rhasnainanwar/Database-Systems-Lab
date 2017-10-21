# 1. Find the names of all juniors (Level = JR) who are enrolled in a class taught by ‘Ivana Teach’.
SELECT DISTINCT s.sname
FROM student s
WHERE EXISTS
	(SELECT *
	FROM class c, enrolled e, faculty f
	WHERE s.snum = e.snum AND e.cname = c.cname AND c.fid = f.fid
	AND f.fname ='Ivana Teach' AND s.level='JR');
    
# 2. Find the names of faculty members that have taught classes only in room R128.
SELECT f.fname FROM faculty f WHERE EXISTS
	(SELECT DISTINCT c.room FROM class c WHERE c.room='R128' AND c.fid = f.fid)
	AND
    NOT EXISTS
	(SELECT DISTINCT c.room FROM class c WHERE c.room<>'R128' AND c.fid = f.fid);
    
# 3. Find the names of classes taught by ‘Richard Jackson’ and their times when a class meet there.
SELECT c.cname, c.meets_at FROM class c WHERE EXISTS
	(SELECT * FROM faculty f WHERE f.fname='Richard Jackson' AND c.fid = f.fid);
    
# 4. Retrieve the snum and sname of students who have taken classes from both ‘Ivana Teach’ and ‘Linda Davis’. (Both with simple and nested queries)
SELECT s.snum, s.sname FROM student s WHERE EXISTS
	(SELECT * FROM enrolled e WHERE e.snum=s.snum AND EXISTS
		(SELECT * FROM class c WHERE c.cname=e.cname AND EXISTS
			(SELECT * FROM faculty f WHERE c.fid=f.fid AND (f.fname='Ivana Teach' OR f.fname='Linda Davis'))));

# 5. Find the age of the oldest students who is enrolled in a course taught by Ivana. Teach.
SELECT max(s.age) FROM student s WHERE EXISTS
	(SELECT *
	FROM class c, enrolled e, faculty f
	WHERE s.snum = e.snum AND e.cname = c.cname AND c.fid = f.fid
	AND f.fname ='Ivana Teach');
    
# 6. Find ages of students in ‘Database Systems’ class that are older than 20 years
SELECT s.age FROM student s WHERE EXISTS 
	(SELECT * FROM enrolled e
    WHERE e.cname='Database Systems' AND s.age>20 AND s.snum=e.snum);
    
# 7. Find the name of faculty members that do not teach to class ‘database Systems’.
SELECT f.fname FROM faculty f WHERE EXISTS
	(SELECT * FROM class c
	WHERE c.cname<>'Database Systems' AND c.fid = f.fid);
    
# 8. Find the name of faculty members who do not teach any course.
SELECT f.fname FROM faculty f WHERE NOT EXISTS 
	(SELECT * FROM class c
	WHERE c.fid = f.fid);
    
# 9. Find the name of faculty member, department who taught the maximum number of distinct classes.
SELECT f.fname, f.deptid FROM faculty f WHERE EXISTS
	(SELECT COUNT(DISTINCT c.cname) flag FROM class c WHERE c.fid = f.fid GROUP BY c.cname HAVING MAX(flag));

# 10. Find the names of all classes and their enrollment strength that have enrollment greater than 5.
SELECT cname, COUNT(snum) FROM enrolled GROUP BY cname HAVING COUNT(snum) > 5;