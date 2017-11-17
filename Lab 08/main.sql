# 3. Print the level in lower case and the average age of those students who enrolled in 2008 for that level for all levels that include ‘R’.
SELECT LOWER(s.level), AVG(s.age) FROM student s, enrolled e WHERE s.level LIKE '%R%' AND s.snum = e.snum AND e.dateFrom LIKE '2008%' GROUP BY s.level;

# 4. Find the names of all classes (initial capital) and their enrollment strength that have enrollment greater than 2.
SELECT CONCAT(UCASE(MID(cname,1,1)),MID(cname,2))  Initial, COUNT(snum) FROM enrolled GROUP BY cname HAVING COUNT(snum) > 2;

# 5. Find the names of faculty members (in upper case) and their department number together who teach in room ‘R128’ in descending order.
SELECT UCASE(fname), deptid FROM faculty, class WHERE faculty.fid = class.fid AND room = 'R128' ORDER BY fname DESC;

# 6. Find the names of students who enrolled in June 2010 and majoring in any ‘Science’ in ascending order.
SELECT sname FROM student, enrolled WHERE student.snum = enrolled.snum AND major = 'Science' AND dateFrom LIKE '2010-06%' ORDER BY sname ASC;

# 7. Find the names of faculty members that either teach to class ‘database systems’or not.
SELECT DISTINCT(fname) FROM faculty, class WHERE class.fid = faculty.fid AND (cname = 'database systems' OR cname <> 'database systems');

# 8. Find distinct student ages of those students who completed the course in the year in which he enrolled the couse, in ‘Database’ class.
SELECT DISTINCT(age) FROM student, enrolled WHERE student.snum = enrolled.snum AND cname = 'Database Systems' AND substr(dateFrom, 1, 4) = substr(dateTo, 1, 4);

# 9. Find the name of students and completion month and year who enrolled in ‘Data Structures’.
SELECT sname, SUBSTR(dateTo,6,2) Month, SUBSTR(dateTo,1, 4) Year FROM student, enrolled WHERE student.snum = enrolled.snum AND enrolled.cname = 'Data Structures';

# 10. Find class names ether taught by faculty member: ‘Barbara Wilson’ or not
SELECT cname FROM class, faculty WHERE class.fid = faculty.fid AND (fname = 'Barbara Wilson' OR fname <> 'Barbara Wilson');

# 11. Find the name of teacher who does not teach to class: ‘Marketing Research’.
SELECT distinct(fname) FROM faculty, class WHERE faculty.fid = class.fid AND cname <> 'Marketing Research';

# 12. Find the names of faculty members that taught to class ‘database Systems’ in 2009.
SELECT distinct(fname) FROM faculty, class, enrolled WHERE faculty.fid = class.fid AND class.cname = enrolled.cname AND enrolled.cname = 'database Systems' AND YEAR(dateFrom) = '2009';

# 13. Find the name of course that was run only for three months.
SELECT cname FROM enrolled WHERE TIMESTAMPDIFF(MONTH, dateFrom, dateTo) = 3;

# 14. Find the names of students who enrolled but could not complete their courses.
SELECT sname FROM student, enrolled WHERE student.snum = enrolled.snum AND dateTo IS NULL;

# Find the names of students who completed their course in June.
SELECT sname FROM student, enrolled WHERE student.snum = enrolled.snum AND substr(dateTo, 6, 2) = '06';