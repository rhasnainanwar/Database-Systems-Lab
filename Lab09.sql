# 1. Find the names of all juniors (Level = JR) who are either enrolled or not in a class taught by ‘Ivana Teach’.
SELECT DISTINCT(sname) FROM student S
	LEFT JOIN enrolled E ON S.snum = E.snum 
    LEFT JOIN class C ON C.cname = E.cname
	LEFT JOIN faculty F ON f.fid = c.fid AND fname = 'Ivana Teach'
WHERE level = 'JR';

# 2. Find the names of faculty members that either teach to class ‘database systems’ or not.
SELECT DISTINCT(fname) FROM faculty F
	LEFT JOIN class C ON C.fid = F.fid AND cname = 'Database Systems';

# 3. Find the name of the courses that is either taught by a faculty member or not.
SELECT DISTINCT(C.cname) FROM class C
	LEFT OUTER JOIN faculty F ON C.fid = F.fid;

# 4. Find the names of classes that is either taught by ‘Richard Jackson’ or not and their times when a class meet there.
SELECT C.cname, C.meets_at FROM class C
	LEFT JOIN faculty F ON C.fid = F.fid AND cname = 'Richard Jackson';

# 5. Retrieve the snum and sname of students who have taken classes from both ‘Ivana Teach’ or ‘Linda Davis’.
SELECT S.snum, S.sname FROM student S
	JOIN enrolled E ON S.snum = E.snum
    JOIN class C ON C.cname = E.cname
    JOIN faculty F ON f.fid = c.fid AND fname IN ('Ivana Teach', 'Linda Davis')
    # workaround to replace intersect
GROUP BY S.snum, S.sname
HAVING COUNT(DISTINCT fname) = 2;

# 6. Find room number where a faculty member either takes a class or not.
SELECT DISTINCT(C.room) FROM class C
	LEFT JOIN faculty F ON F.fid = C.fid;

# 7. Find the department IDs where students have been enrolled or not.
SELECT DISTINCT(F.deptid) FROM faculty F
	LEFT JOIN class C ON F.fid = C.fid
    LEFT JOIN enrolled E ON E.cname = C.cname
    LEFT JOIN student S ON S.snum = E.snum;
    
# 8. Find the room number where either Robert Brown teaches or not.
SELECT DISTINCT(C.room) FROM class C
	LEFT JOIN faculty F ON C.fid = F.fid AND cname = 'Robert Brown ';